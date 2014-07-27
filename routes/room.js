var express = require('express');
var mission = require('../models/mission');
var router = express.Router();

router.get('/', function(req, res) {
  res.render('room', { mission_data: mission.mission_data() });
});

module.exports = router;
