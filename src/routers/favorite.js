const favorite = require('express').Router();
const authMw = require('../middleware/auth');
const favoriteControll = require('../controllers/favorite');

favorite.get('/all', authMw,favoriteControll.getAllFavorite);
favorite.get('/favoriteid', authMw,favoriteControll.getFavoriteByIdAndProductId);


module.exports=favorite;