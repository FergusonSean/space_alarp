  
var data = null

var sectorLength = 20;
var distanceToX = 12;
var distanceToY = 6;

exports.initialize = function() {
  data = {
    upper_red: {capacity: 2, charge:1},
    lower_red: {capacity: 3, charge:2},
    upper_white: {capacity: 3, charge:1},
    lower_white: {capacity: 5, charge:3, cannisters:3},
    upper_blue: {capacity: 2, charge:1},
    lower_blue: {capacity: 3, charge:2},
    white:{enemies:[], damage:0, length:function(){ return sectorLength }},
    red:  {enemies:[], damage:0, length:function(){ return sectorLength }},
    blue: {enemies:[], damage:0, length:function(){ return sectorLength }}
  }
};
exports.initialize();

exports.mission_data = function() {
  return JSON.stringify(data);
};

exports.dealDamage = function(red, white, blue) {
  data.red.damage += red
  data.white.damage += white
  data.blue.damage += blue
};

exports.movePower = function(red, white, blue) {
  data.lower_red.charge += red
  data.lower_white.charge += white
  data.lower_blue.charge += blue
};

exports.applyShieldDelta = function(red, white, blue) {
  data.upper_red.charge += red
  data.upper_white.charge += white
  data.upper_blue.charge += blue
};
// Exported for testing only
exports._data = data 
exports._sectorLength = sectorLength;
exports._distanceToX = distanceToX;
exports._distanceToY = distanceToY;
