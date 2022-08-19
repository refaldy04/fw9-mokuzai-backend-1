const router = require('express').Router();
// console.log("a");

router.use('/auth', require('./auth_seller'));
// router.use('/auth', require('./auth_customer'));
router.use('/product', require('./product'));

module.exports = router;