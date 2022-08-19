const router = require('express').Router();

router.use('/auth', require('./auth'));
router.use('/product', require('./product'));
router.use('/profile', require('./profile'));
router.use('/add_chart', require('./transaction'));
router.use('/get_chart', require('./transaction'));

module.exports = router;