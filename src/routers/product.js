const product = require('express').Router();
const productController = require('../controllers/product');
const { body } = require('express-validator');
const validationCheck = require('../middleware/checkValidation');
const upload = require('../middleware/upload');
const authMiddle = require('../middleware/auth');

// const registerSellerValidator = [
//   body('email')
//     .notEmpty().withMessage('Email Required')
//     .isEmail().withMessage('Wrong Email Format'),
//   body('password')
//     .notEmpty().withMessage('Password Required')
//     .isLength({min: 4}).withMessage('Password must be more than 4 characters')
//     .customSanitizer(
//       async val =>{
//         const hash = await bcrypt.hash(val, 10);
//         return hash;
//       })
// ];

// const loginValidator =  [
//   body('email')
//     .exists({checkFalsy: true}).withMessage('Enter an Email')
//     .isEmail().withMessage('Wrong Email Format'),

//   body('password')
//     .exists({checkFalsy: true}).withMessage('Enter a Password')
// ];

product.post('/', authMiddle, upload, productController.createProduct);
// product.patch('/', ...loginValidator, validationCheck, authController.login);

module.exports = product ;

