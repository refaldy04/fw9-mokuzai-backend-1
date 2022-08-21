const product = require('express').Router();
const productController = require('../controllers/product');
const upload = require('../middleware/upload');
const authMiddle = require('../middleware/auth');

product.post('/', authMiddle, upload, productController.createProduct);
product.get('/', productController.showAllProduct);
product.get('/ProductSeller',authMiddle,productController.showProductSeller);
product.get('/:category_name',authMiddle,productController.showProductByCategory);
product.get('/archive/:archive_status',authMiddle,productController.showProductByArchive);
product.patch('/:id',authMiddle,upload,productController.editProduct);
product.delete('/:id',authMiddle, productController.deleteProduct);

module.exports = product ;

