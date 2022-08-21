const response = require("../helpers/standardResponse");
const paymentModel = require("../models/payment");

exports.createPayment = (req, res) => {
  //   console.log(req.body);

  // return response(res, "Good Job", userResult);
  paymentModel.createPayment(req.body, (err, resultCreate) => {
    // paymentModel.deleteOrder(resultCreate[0].order_id, (err, resultDelete) => {
    return response(res, "good job", resultCreate);
    // });
  });
};
