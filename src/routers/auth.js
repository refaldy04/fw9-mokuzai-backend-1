const auth = require('express').Router();
const authController = require('../controllers/auth');
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

const userValidation = [
  body('email').isEmail().withMessage('Email format invalid'),
  body('password')
    .isLength({ min: 4 })
    .withMessage('password length min 4 character')
    .customSanitizer(async (val) => {
      const hash = await bcrypt.hash(val, 10);
      return hash;
    }),
];
auth.post('/register_seller', ...registerSellerValidator, validationCheck, authController.registerSeller);
auth.post('/register_costumer', ...userValidation, validationCheck, authController.register_costumer);
auth.post('/login', ...loginValidator, validationCheck, authController.login);


module.exports = auth ;

