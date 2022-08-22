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