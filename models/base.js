
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

global.base = {
  initialize: function() {
    sectors = [];
    add_sector(this, "red");
    add_sector(this, "white");
    add_sector(this, "blue");

    console.log('done with sectors');
    console.log(this);
    this.white_lower.batt_capacity = 5;
    this.white_lower.batt = 3;
    this.white_lower.cannisters = 3;
    this.white_lower.btna = function() {
      console.log("pulse");
    }
    
    this.white_upper.btna = function() {
      console.log("gun");
    }
  }
}
