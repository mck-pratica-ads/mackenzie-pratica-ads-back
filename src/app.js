const express = require('express');
const bodyParser = require('body-parser');
const app = express();

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json());

const router = express.Router();

// Routers
const loginRoute = require('./routes/loginRoute');
app.use('/login', loginRoute);

// Firebase Auth
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

module.exports = app;