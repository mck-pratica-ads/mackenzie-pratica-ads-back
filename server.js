require("firebase/auth");
require("firebase/firestore");

var firebaseConfig = {
  apiKey: "AIzaSyD_QPsF344HuQPgZCH7sLlUVAJcdi0l7Ow",
  authDomain: "projetoads-mack.firebaseapp.com",
  databaseURL: "https://projetoads-mack.firebaseio.com",
  projectId: "projetoads-mack",
  storageBucket: "projetoads-mack.appspot.com",
  messagingSenderId: "SENDER_ID",
  appId: "projetoads-mack",
  measurementId: "G-MEASUREMENT_ID",
};
var firebase = require("firebase/app");
firebase.initializeApp(firebaseConfig);

const express = require('express');
const bodyParser = require('body-parser');
const favicon = require('express-favicon');
const path = require('path');
const port = process.env.PORT || 8080;
const app = express();
app.use(favicon(__dirname + '/build/favicon.ico'));
// the __dirname is the current directory from where the script is running
app.use(express.static(__dirname));
app.use(express.static(path.join(__dirname, 'build')));
app.use(bodyParser.json());

app.get('/ping', function (req, res) {
 return res.send('pong');
});

const { body, validationResult } = require('express-validator');
app.post('/signup', 
  body('email').isEmail(),
  body('password').isLength({ min: 6 }),
  function (req, res) {

    // TODO: Add validator https://express-validator.github.io/docs/
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    firebase.auth().createUserWithEmailAndPassword(req.body.email, req.body.password)
    .then((user) => {
      return res.json({
        "data": {  
        }
      });
    })
    .catch((error) => {
      var errorCode = error.code;
      var errorMessage = error.message;
      
      return res.json({
        "error": {
          "code" : errorCode,
          "message" : errorMessage
        }
      });
    });
 });

 app.post('/signin', function (req, res) {

  firebase.auth().signInWithEmailAndPassword(req.body.email, req.body.password)
    .then((user) => {
      return res.json({
        "data": {  
        }
      });
    })
    .catch((error) => {
      var errorCode = error.code;
      var errorMessage = error.message;
      return res.json({
        "error": {
          "code" : errorCode,
          "message" : errorMessage
        }
      });
    });
 });


app.get('/*', function (req, res) {
  res.sendFile(path.join(__dirname, 'build', 'index.html'));
});
app.listen(port);