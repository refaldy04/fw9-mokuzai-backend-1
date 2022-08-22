const router = require('express').Router();

router.use('/auth', require('./auth'));
router.use('/chat', require('./chat'));
router.use('/product', require('./product'));
router.use('/profile', require('./profile'));
router.use('/add_chart', require('./transaction'));
router.use('/get_chart', require('./transaction'));
router.use('/payment', require('./payment'));
router.use('/wishlist', require('./wishlist'));
router.use('/favorite', require('./favorite'));
router.use('/orders', require('./orders'));

module.exports = router;
