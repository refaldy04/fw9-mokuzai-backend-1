const router = require("express").Router();
// console.log("a");

router.use("/auth", require("./auth_seller"));
router.use("/auth", require("./auth_customer"));

module.exports = router;
