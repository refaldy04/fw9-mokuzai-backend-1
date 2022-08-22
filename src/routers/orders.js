const order = require('express').Router();
const authMw = require('../middleware/auth');
const orderControll = require('../controllers/orders');

order.get('/', authMw, orderControll.getAllOrders);
// order.get('/productid', authMw,orderControll.getWishlistByIdAndProductID);


module.exports=order;