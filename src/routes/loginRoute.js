const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
var firebase = require("firebase/app");
// const controller = require ('../controllers/personController')

router.post('/signup', 
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

 router.post('/signin', function (req, res) {
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

 module.exports = router;