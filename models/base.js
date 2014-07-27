
var add_sector(base, name) {
  var upper_room = {};
  var lower_room = {};
  var sector = {};
  sector.name = name;
  sector.upper = upper_room;
  sector.lower = lower_room;
  upper_room.sector = sector;
  lower_room.sector = sector;

  base[name + "_upper"] = upper_room;
  base[name + "_lower"] = lower_room;
  base[name] = sector;

  base.sectors << sector;
  return sector;
}

global.base = {
  initialize: function() {
    sectors = [];
    add_sector("red");
    add_sector("white");
    add_sector("blue");

    white_lower.batt_capacity = 5;
    white_lower.batt = 3;
    white_lower.cannisters = 3;
    white_lower.btna = function() {
      console.log("pulse");
    }
    
    white_upper.btna = function() {
      console.log("gun");
    }
  }
}
