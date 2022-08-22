const response = require ('../helpers/standardResponse');
// const errorResponse = require ('../helpers/errorResponse');
const wishlistModels = require ('../models/wishlist');

exports.getAllWishlist = (req, res)=>{
  const id = req.authUser.id;
  wishlistModels.getAllWishlist(id, (err, result) =>{
    return response(res, 'Get All Wishlist', result);
  });
};

exports.getWishlistById = (req,res) =>{
  const id = req.authUser.id;
  const product_id = req.params;
  wishlistModels.getWishlistById(id, product_id, (err,result)=>{
    return response(res, 'Product Wishlist',result);
  });
};

exports.getWishlistByIdAndProductId = (req,res) =>{
  const {id} = req.params;
  // const product_id = req.body.id;
  console.log(id);
  wishlistModels.getWishlistByIdAndProductId(id, (err,result)=>{
    // console.log(product_id);
    return response(res, 'Product Wishlist',result.rows[0]);
  });
};

exports.addItemWishlist = (req, res) => {
  const id = req.authUser.id;
  // return response(res, "Good Job", userResult);
  wishlistModels.addItemWishlist(id, req.body, (err, result) => {
    return response(res, 'add Item to cart', result);
  });
};

exports.deleteItemWishlist = (req,res) =>{
  // const user = req.authUser.id;
  const {id} = req.params;
  wishlistModels.deleteItemWishlist(id, (err,result)=>{
    return response(res, 'Item is remove from Wishlist',result);
  });
};