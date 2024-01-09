'use strict'
const express = require('express')
const app = express()

app.get('/', (req, res) => {
    res.sendFile(`${__dirname}/index.html`)
})

app.get('/data', (req, res) => {
    res.json({ a: 1 });
})

// app.listen(3000) // <-- comment this line out from your app

module.exports = app // export your app so aws-serverless-express can use it