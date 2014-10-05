var mission = require('../models/mission.js')

exports['initialize'] = function (test) {
    test.equal(4, 4);
    var real_data = mission.mission_data();
    expected = {
      upper_red: {capacity: 2, charge:1},
      lower_red: {capacity: 3, charge:2},
      upper_white: {capacity: 3, charge:1},
      lower_white: {capacity: 5, charge:3, cannisters:3},
      upper_blue: {capacity: 2, charge:1},
      lower_blue: {capacity: 3, charge:2},
      white:{enemies:[], damage:0},
      red:{enemies:[], damage:0},
      blue:{enemies:[], damage:0}
    }
    test.deepEqual(expected, JSON.parse(real_data))
    test.done();
};

exports['dealDamage'] = function (test) {
  mission.initialize();
  mission.dealDamage(3,2,1)
  var real_data = mission.mission_data();
  expected = {
    upper_red: {capacity: 2, charge:1},
    lower_red: {capacity: 3, charge:2},
    upper_white: {capacity: 3, charge:1},
    lower_white: {capacity: 5, charge:3, cannisters:3},
    upper_blue: {capacity: 2, charge:1},
    lower_blue: {capacity: 3, charge:2},
    white:{enemies:[], damage:2},
    red:{enemies:[], damage:3},
    blue:{enemies:[], damage:1}
  }
  test.deepEqual(expected, JSON.parse(real_data))
  test.done();
};

exports['initialize'] = function(test) {
  mission.dealDamage(3,2,1);
  mission.movePower(1,-1,1);
  mission.initialize();

  var real_data = mission.mission_data();
  expected = {
    upper_red: {capacity: 2, charge:1},
    lower_red: {capacity: 3, charge:2},
    upper_white: {capacity: 3, charge:1},
    lower_white: {capacity: 5, charge:3, cannisters:3},
    upper_blue: {capacity: 2, charge:1},
    lower_blue: {capacity: 3, charge:2},
    white:{enemies:[], damage:0},
    red:{enemies:[], damage:0},
    blue:{enemies:[], damage:0}
  }
  test.deepEqual(expected, JSON.parse(real_data))
  test.done();
}

exports['movePower'] = function (test) {
  mission.initialize();
  mission.movePower(1,-1,1)
  var real_data = mission.mission_data();
  expected = {
    upper_red: {capacity: 2, charge:1},
    lower_red: {capacity: 3, charge:3},
    upper_white: {capacity: 3, charge:1},
    lower_white: {capacity: 5, charge:2, cannisters:3},
    upper_blue: {capacity: 2, charge:1},
    lower_blue: {capacity: 3, charge:3},
    white:{enemies:[], damage:0},
    red:{enemies:[], damage:0},
    blue:{enemies:[], damage:0}
  }
  test.deepEqual(expected, JSON.parse(real_data))
  test.done();
};
