const express = require('express');
const router = express.Router();
const feather = require('feather-icons');

const [plusIcon, deleteIcon, dropdownIcon] = [
  feather.icons.plus.toSvg(),
  feather.icons.x.toSvg(),
  feather.icons["chevron-down"].toSvg({
    class: "select-dropdown"
  }),
];

router.use(express.static('public'))
router.use(express.urlencoded({ extended: false }))
const { client, getBooks, createBook, getGenres } = require('../db/index')


router.get('/', async (req, res, next) => {
    try {
        res.render("index", {
            bookList: await getBooks(),
            plusIcon
        })
    } catch (e) {
        next(e)
    }
}) 

router.get('/add', async (req, res, next) => {
    try {
        res.render('addBook', {
            dropdownIcon,
            genreList: await getGenres()
        })
    } catch (e) {
        next(e)
    }

})

router.post('/add', async (req, res, next) => {
    try {
      const title = req.body.title;
      const author = req.body.author;
      const summary = req.body.summary;
        const rating = req.body.rating;
        const genre = req.body.genre;
        const newGenre = req.body['new-genre'];
        const newBook = await createBook(author, title, summary, rating, genre, newGenre);
      res.redirect(`/books/${newBook.rows[0].id}`);
    } catch (e) {
        next(e)
    }


})

module.exports = router