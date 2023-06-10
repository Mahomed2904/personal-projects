const express = require('express');
const { MessagingResponse } = require('twilio').twiml;

const app = express();

app.get('/send', (req, res) => {
  
});

app.post('/sms', (req, res) => {
  const twiml = new MessagingResponse();
  console.log("Requested")  
  twiml.message('Seja bem vindo');
  res.type('text/xml').send(twiml.toString());
});

app.listen(3000, () => {
  console.log('Express server listening on port 3000');
});