const wishlist = require('express').Router();
const authMw = require('../middleware/auth');
const wishlistControll = require('../controllers/wishlist');
const validationCheck = require('../middleware/checkValidation');

wishlist.get('/all', authMw,wishlistControll.getAllWishlist);
wishlist.get('/product/:id', authMw,wishlistControll.getWishlistByIdAndProductId);
wishlist.post('/add', authMw, wishlistControll.addItemWishlist);
wishlist.delete('/delete/:id', authMw, validationCheck,wishlistControll.deleteItemWishlist);


module.exports=wishlist;