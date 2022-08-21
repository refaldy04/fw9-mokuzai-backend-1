const chats = require('express').Router();
const chatsController = require('../controllers/chat');
const authMiddle = require('../middleware/auth');

chats.post('/',authMiddle,chatsController.createChat);
chats.get('/',authMiddle,chatsController.getAllChat);
chats.delete('/:id',authMiddle,chatsController.deleteChat);

module.exports=chats;
