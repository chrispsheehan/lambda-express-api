const express = require('express');
const awsServerlessExpress = require('aws-serverless-express');
const app = express();

app.get('/hello', (req, res) => {
  res.status(200).json({msg: "Hello, this is your AWS Lambda function, [mushroom] testy badgers!"});
});

app.use((req, res, next) => { 
  console.log(`Params: ${JSON.stringify(req.params)}`); // log out requests
  console.log(`Headers: ${JSON.stringify(req.headers)}`);
  console.log(`${req.method}: ${JSON.stringify(req.url)}`);
  res.status(200).json({msg: `Hello, your ip is ${ipAddress}`});
})

const server = awsServerlessExpress.createServer(app);

exports.handler = (event, context) => {
  awsServerlessExpress.proxy(server, event, context);
};