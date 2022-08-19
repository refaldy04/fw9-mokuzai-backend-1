const auth_seller = require('express').Router();
const authController = require('../controllers/auth_seller');
const { body } = require('express-validator');
const bcrypt = require('bcrypt');
const validationCheck = require('../middleware/checkValidation');

const registerSellerValidator = [
  body('email')
    .notEmpty().withMessage('Email Required')
    .isEmail().withMessage('Wrong Email Format'),
  body('password')
    .notEmpty().withMessage('Password Required')
    .isLength({min: 4}).withMessage('Password must be more than 4 characters')
    .customSanitizer(
      async val =>{
        const hash = await bcrypt.hash(val, 10);
        return hash;
      })
];

const loginValidator =  [
  body('email')
    .exists({checkFalsy: true}).withMessage('Enter an Email')
    .isEmail().withMessage('Wrong Email Format'),

  body('password')
    .exists({checkFalsy: true}).withMessage('Enter a Password')
];

auth_seller.post('/register_seller', ...registerSellerValidator, validationCheck, authController.registerSeller);
// auth_seller.post('/register', ...registValidator, validationCheck, authController.register);
auth_seller.post('/login', ...loginValidator, validationCheck, authController.login);

module.exports = auth_seller ;

