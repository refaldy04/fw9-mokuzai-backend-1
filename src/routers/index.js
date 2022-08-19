const router = require('express').Router();

// router.use('/',require('./product'));
// router.use('/',require('./chat'));
// router.use('/auth', require('./auth'));
router.use('/profile', require('./profile'));

module.exports = router;
//