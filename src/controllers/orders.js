const response = require ('../helpers/standardResponse');
// const errorResponse = require ('../helpers/errorResponse');
const ordersModels = require ('../models/orders');

exports.getAllOrders = (req, res)=>{
  const id = req.authUser.id;
  ordersModels.getAllOrders(id, (err, result) =>{
    return response(res, 'Get All Orders', result);
  });
};
