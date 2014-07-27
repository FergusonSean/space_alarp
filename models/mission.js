var ship = {
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

exports.mission_data = function() {
  return JSON.stringify(ship);
}
