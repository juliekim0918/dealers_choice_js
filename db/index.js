/* THINGS I NEED TO DO 
 -- ADDING VALIDATION 
 --- don't create a row if author name already exists [DONE]
 --- throw error if rating is not a number from 1 to 5 [DONE - but should be a better way than to add 10 lines of code]
 -- ALLOWING MULTI SELECT FOR GENRES ON FORM
 -- ALLOWING ADDING A NEW GENRE ON FORM [DONE]
 -- ALLOWING EDITING AN EXISTING POST 
*/

const { Client } = require('pg');
const client = new Client(process.env.DATABASE_URL || 'postgres://localhost/dealers_choice');
client.connect();

// sql does not have a concept of array; string_agg  concatenates all the values of the column you select 
// in this case, all the genre_names thats associated with bookId
// in index.ejs, you would need to split it back into an array to loop through the list of genres 
// string_agg is an aggregate function so you need to use group by 
const baseQuery = `
WITH bg as (
SELECT
b.id as id,
string_agg(g.name, ', ') as genres
FROM
books_genres bg
JOIN books b
on b.id = bg.bookId
JOIN genres g
ON g.id = bg.genreId
GROUP BY 1
)
SELECT
b.id as id,
b.title as title,
b.summary,
TO_CHAR(b.dateFinished, 'YYYY/MM/DD') as datefinished,
b.rating,
a.name as author_name,
bg.genres
FROM
books b
JOIN authors a
ON a.id = b.authorId
JOIN bg
ON b.id = bg.id \n
`;

const whereClause = `
WHERE
b.id = $1
`;

const createAuthorQuery = `
INSERT INTO authors
(name)
SELECT $1
WHERE NOT EXISTS (SELECT name
              FROM authors
              WHERE name=$2);
`;

const createBookQuery = `
INSERT INTO books (authorId, title,  summary, dateFinished, rating)
VALUES (
    (SELECT id FROM authors WHERE name=$1),
    $2,
    $3,
    now(),
    $4
)
RETURNING *`;

const getGenresQuery = `
SELECT name 
FROM
genres
`

const getBooks = async() => {
    const books = await client.query(baseQuery);
    return books.rows
}
 
const getBook = async(id) => {
    const currBook = await client.query(`${baseQuery} ${whereClause}`, [id])
    return currBook.rows
}

const getGenres = async () => {
    const genres = await client.query(getGenresQuery);
    return genres.rows
}

const deleteBook = async (id) => {
    await client.query(`DELETE FROM books_genres where bookId=$1`, [id])
    await client.query(`DELETE FROM books WHERE id=$1`, [id])
}

const createBook = async (author, title, summary, rating, genre, newGenre) => {
    const newAuthor = await client.query(createAuthorQuery,[author, author] );
    //console.log(newAuthor, 'THIS IS THE NEW AUTHOR')
    const newBook = await client.query(createBookQuery, [author, title, summary, rating]);
    // need to get rows out of newBook
    //console.log(newBook.rows[0].id, 'THIS IS THE NEW BOOK')
    let genreId = 1;
    if (genre === 'Other') {
        // if they selected Other, access the newGenre to create a new genre
        genreId = (await client.query(`INSERT INTO genres (name) VALUES ($1) RETURNING *`, [newGenre]))
    } else {
         genreId = await client.query(`SELECT id FROM genres WHERE name=$1`, [genre])
    }
    await client.query(`INSERT INTO books_genres (bookId, genreId) VALUES ($1, $2) RETURNING *`, [newBook.rows[0].id, genreId.rows[0].id])
    // MECHANISM TO CHECK WHAT THE CURRENT DB/TABLES LOOKS LIKE
    const [currAuthors, currGenres, currBooks] = await Promise.all([
        await client.query('SELECT * FROM authors'),
        await client.query('SELECT * FROM genres'),
        await client.query('SELECT b.id, b.title FROM books b')
    ])
    //console.log(currAuthors.rows, currGenres.rows, currBooks.rows)

    return newBook
}

module.exports = {
    client,
    getBooks,
    getBook,
    getGenres,
    deleteBook,
    createBook
}