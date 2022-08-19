const router = require("express").Router();
// console.log("a");

router.use("/auth", require("./auth_seller"));
router.use("/auth", require("./auth_customer"));
router.use("/add_chart", require("./transaction"));
router.use("/get_chart", require("./transaction"));

module.exports = router;
