const router = require("express").Router();
// console.log("a");

router.use("/auth", require("./auth_seller"));
router.use("/auth", require("./auth_customer"));
// router.use('/',require('./product'));
// router.use('/',require('./chat'));
// router.use('/profile', require('./usersCostumer'));

module.exports = router;
