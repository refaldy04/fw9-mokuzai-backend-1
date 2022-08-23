const newPaymentM = require('../models/newpayment');
const response = require('../helpers/standardResponse');
const errorResponse = require('../helpers/errorResponse');

exports.createPayment = (req, res)=>{
  const id= req.authUser.id;
  const status = 'Not Paid'; 
  console.log(id);
  newPaymentM.createPayment(id, status, req.body, (err, results)=>{
    if (err) {
      return errorResponse(err, res);
    }else{
      return response(res, 'Create Payment successfully', results[0]);
    }
  });
  
};

exports.editPayment = (req, res)=>{
  const id_user= req.authUser.id;
  const id_payment = parseInt(req.params.id);
  const status = 'Get Paid';
  console.log(id_user);
  newPaymentM.editPayment(id_user, id_payment, status, req.body, (err, results)=>{
    // console.log(results);
    if (err) {
      return errorResponse(err, res);
    }else{
      return response(res, 'Update Payment successfully', results);
    }
  });
  
};

exports.editStatus = (req, res)=>{
  const id_user= req.authUser.id;
  const id_payment = parseInt(req.params.id);
  newPaymentM.editStatus(id_user, id_payment, req.body, (err, results)=>{
    // console.log(results);
    if (err) {
      return errorResponse(err, res);
    }else{
      return response(res, 'Update Status successfully', results);
    }
  });
  
};