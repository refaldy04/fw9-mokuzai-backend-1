const response = require('../helpers/standardResponse');
const paymentModel = require('../models/payment');

exports.createPayment = (req, res) => {
  //   console.log(req.body);

  paymentModel.createPayment(req.body, (err, resultCreate) => {
    paymentModel.editStatusOrder(
      resultCreate[0].order_id,
      'paid',
      (err, resultDelete) => {
        return response(res, 'good job', resultCreate);
      }
    );
  });
};
