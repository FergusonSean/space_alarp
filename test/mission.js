var mission = require('../models/mission.js')
exports['initialize'] = function (test) {
    test.equal(4, 4);
    console.log(mission);
    var data = mission.mission_data();
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
    test.deepEqual(expected, JSON.parse(data))
    test.done();
};
