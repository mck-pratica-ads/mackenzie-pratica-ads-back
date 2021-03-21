const express = require('express');
const router = express.Router();
const { body, validationResult } = require('express-validator');
var firebase = require("firebase/app");
const loginController = require ('../controllers/login.controller')

router.post('/signup', 
  body('email').isEmail(),
  body('password').isLength({ min: 6 }),
  body('fullname').isLength({ min: 5 }),
  body('username').isLength({ min: 5 }),
  body('birthdate').isLength({ min: 10 }),
  body('state').isLength({ min: 2 }),
  body('city').isLength({ min: 4 }),
  function (req, res) {

    // TODO: Add validator https://express-validator.github.io/docs/
    // 0. Validation
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }

    const { email, password} = req.body;

    // 1. Request on firebase
    firebase.auth().createUserWithEmailAndPassword(email, password)
    .then((user) => {

      // 2. Create on DB
      loginController.createUser(req.body)
      .then((result) => {        
        return res.status(200).json({ data: req.body });
      })
      .catch((error) => {
        console.log('error:' + error);
        return res.status(400).json({ error: { code: 400, message: 'Insert DB Error'} });
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
  // 0. Request Firebase
  firebase.auth().signInWithEmailAndPassword(req.body.email, req.body.password)
    .then((user) => {   
      // 1. Get User From DB   
      loginController.getUserByEmail(user.user.email)
        .then((result) => {
          var data = result[0];
          return res.json({"data": data});
        })
        .catch((error) => {
          return res.status(400).json({ errors: {} });
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