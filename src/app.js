const express = require('express');
const awsServerlessExpress = require('aws-serverless-express');
const app = express();

app.get('/hello', (req, res) => {
  res.status(200).json({msg: "Hello, this is your AWS Lambda function, [mushroom] testy badgers!"});
});

app.use((req, res, next) => { 
  const ip = req.headers['x-forwarded-for'] || req.socket.remoteAddress 
  res.status(200).json({msg: `Hello, heres your ip ${ip}`});
})

const server = awsServerlessExpress.createServer(app);

exports.handler = (event, context) => {
  awsServerlessExpress.proxy(server, event, context);
};