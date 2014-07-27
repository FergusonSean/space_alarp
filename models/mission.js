var ship = {}

var add_sector = function(base, name) {
  var upper_room = {};
  var lower_room = {};
  var sector = {};
  sector.name = name;
  sector.upper = upper_room;
  sector.lower = lower_room;
  upper_room.sector = sector;
  lower_room.sector = sector;

  console.log('adding sector');
  base[name + "_upper"] = upper_room;
  base[name + "_lower"] = lower_room;
  base[name] = sector;

  base.sectors << sector;
  return sector;
}

exports.mission_data = function() {
  
}

exports.initialize = function() {
  initialize = function() {
    sectors = [];
    add_sector(ship, "red");
    add_sector(ship, "white");
    add_sector(ship, "blue");

    console.log('done with sectors');
    console.log(ship);
    ship.white_lower.batt_capacity = 5;
    ship.white_lower.batt = 3;
    ship.white_lower.cannisters = 3;
    ship.white_lower.btna = function() {
      console.log("pulse");
    }

    ship.white_upper.btna = function() {
      console.log("gun");
    }
  }
}
