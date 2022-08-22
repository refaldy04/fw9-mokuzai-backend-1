const response = require ('../helpers/standardResponse');
// const errorResponse = require ('../helpers/errorResponse');
const favoriteModels = require ('../models/favorite');

exports.getAllFavorite = (req,res) =>{
  const id = req.authUser.id;
  favoriteModels.getAllFavorite(id, (err,result)=>{
    return response(res, 'Product Favorite',result);
  });
};

exports.getFavoriteByIdAndProductId = (req,res) =>{
  const id = req.authUser.id;
  const product_id = req.body.id;
  favoriteModels.getFavoriteByIdAndProductId(id, product_id, (err,result)=>{
    console.log(product_id);
    return response(res, 'Product Favorite',result.rows[0]);
  });
};

exports.addItemFavorite = (req, res) => {
  const id = req.authUser.id;
  // return response(res, "Good Job", userResult);
  favoriteModels.addItemFavorite(id, req.body, (err, result) => {
    return response(res, 'add Item to cart', result);
  });
};

exports.deleteItemFavorite = (req,res) =>{
  // const user = req.authUser.id;
  const {id} = req.params;
  favoriteModels.deleteItemFavorite(id, (err,result)=>{
    return response(res, 'Item is remove from favorite',result);
  });
};