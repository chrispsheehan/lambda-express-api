const express = require('express');
const serverless = require('serverless-http');

const app = express();

app.get('/hello', (req, res) => {
  res.send('Hello, this is your AWS Lambda function!');
});

module.exports.handler = serverless(app);