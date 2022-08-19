const profile = require('express').Router();
const uploadProfile = require('../middleware/upload');
const profilesControll = require('../controllers/profile');

profile.get('/', profilesControll.getAllProfiles);
profile.get('/:id', profilesControll.getProfilebyId);
profile.post('/',  uploadProfile, profilesControll.createProfiles);
profile.patch('/:id',  uploadProfile, profilesControll.updateProfiles);
module.exports = profile;