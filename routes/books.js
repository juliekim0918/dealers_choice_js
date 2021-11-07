const express = require('express');
const router = express.Router();
const { client, getBook, deleteBook } = require('../db/index');

router.use(express.static('public'))
router.use(require('method-override')('_method'))

router.get('/:id', async (req, res, next) => {
    try {
        const id = req.params.id;
        const currBook = await getBook(id);
        res.render("book", {
            currBook:currBook[0]
        })
    } catch(e) {
        next(e)
    }
})

router.delete('/:id', async (req, res, next) => {
    try {
        const id = req.params.id
        await deleteBook(id);
        res.redirect('/')
    } catch(e) {
        next(e)
    }
})

module.exports = router

