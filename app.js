const express = require("express");
const morgan = require("morgan");
const app = express();
// const bookBank = require("./bookBank");
// can set up views; 'view engine' is necessary; you can put 'ejs' or 'pug' depending on what library you're using
app.set("view engine", "ejs");
app.use(morgan("dev"));
// app.use(express.static("public"));
// or you can use
// app.use('/public', express.static(path.join(__dirname,'public')))
app.use('/public', express.static('public'))
// you need to make sure to require above i.e. const path = require('path')
const { client, getBooks, getBook } = require('./db');
app.use('/books', require('./routes/books'));
app.use('/', require('./routes/index'))



port = process.env.PORT || 8000
app.listen(8000, () => {
  console.log("listening in port 8000");
});
