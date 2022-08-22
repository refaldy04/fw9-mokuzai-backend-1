const wishlist = require('express').Router();
const authMw = require('../middleware/auth');
const wishlistControll = require('../controllers/wishlist');

wishlist.get('/all', authMw,wishlistControll.getAllWishlist);
wishlist.get('/product/:id', authMw,wishlistControll.getWishlistByIdAndProductId);


module.exports=wishlist;