const router = require('express').Router();

router.use('/auth', require('./auth_seller'));
// router.use('/',require('./product'));
// router.use('/',require('./chat'));
// router.use('/profile', require('./usersCostumer'));

module.exports = router;
//