const express = require("express");
const morgan = require("morgan");
const app = express();
const bookBank = require("./bookBank");
// can set up views; 'view engine' is necessary; you can put 'ejs' or 'pug' depending on what library you're using
app.set("view engine", "ejs");
app.use(morgan("dev"));
app.use(express.static("public"));

app.get("/", (req, res) => {
  // you can pass a second parameter to send any data you want to the html/ejs file
  res.render("index", {
    bookBank,
    bookList: bookBank.getBooks(),
  });
});

app.get('/books/:id', (req, res) => {
    const id = req.params.id
    res.render("book", {
        bookBank,
        id,
        currBook: bookBank.findBook(id)
    })
})

app.listen(8000, () => {
  console.log("listening in port 8000");
});
