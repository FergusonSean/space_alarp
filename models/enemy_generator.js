var genDoDamageHandler = function(damage) {
  return function(ship, enemy, sector) {
    console.log("DAMAGE! " + damage + " on " + sector);
  }
}

var sectorLength = 20;
var distanceToX = 12;
var distanceToY = 6;

var genEnemy = function(name, hp, shields, speed, x, y, z) {
  enemy = {
    "name": name,
    "hp": hp,
    "maxShields": shields,
    "shields": shields,
    "speed": speed,
    "x": (typeof x !== 'undefined' ? x : function(){}),
    "y": (typeof y !== 'undefined' ? y : function(){}),
    "z": (typeof z !== 'undefined' ? z : function(){})
  }
  enemy["alive"] = function() { return enemy.hp > 0; }
  enemy["won"] = function() { return enemy.distance <= 0; }
  enemy["advance"] = function(ship, sector) {
    if (!enemy.alive() || enemy.won()) {
      enemy.removeFromSector(sector);
      return;
    }
    
    oldDist = enemy.distance;
    enemy.distance -= 1;
    if (oldDist > distanceToX && distanceToX >= enemy.distance) {
      enemy.x(ship, sector, enemy);
    } else if (oldDist > distanceToY && distanceToY >= enemy.distance) {
      enemy.y(ship, sector, enemy);
    } else if (enemy.distance <= 0) {
      enemy.z(ship, sector, enemy);
      enemy.removeFromSector(sector);
      return;
    }
  }
  enemy["removeFromSector"] = function(sector) {
    index = sector.enemies.indexOf(enemy);
    if (index >= 0) {
      sector.enemies.splice(index, 1);
    }
  }
  enemy["assignSector"] = function(ship, sector) {
    enemy["distance"] = sectorLength;
    sector.enemies << enemy;
  }
  enemy["launch"] = function(ship, sector) {
    for(var i = 1; i <= sectorLength; i++) {
      setTimeout((45000*i)/enemy.speed, function() {
        enemy.advance(ship, sector);
      });
    }
  }
  return enemy;
}

var threats = [
  ["evil ship", 5, 2, 3, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(3)],
  ["more evil ship", 5, 3, 2, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(3)]
]

var seriousThreats = [
  ["boo", 8, 3, 2, genDoDamageHandler(2), genDoDamageHandler(3), genDoDamageHandler(4)],
  ["spook", 10, 2, 3, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(2)]
]

exports.generate = function(seriousThreat, index) {
  var stats_list = seriousThreat ? seriousThreats : threats;

  if(typeof index === undefined){
    index = Math.floor(Math.random() * stats_list.length)
  }

  var stats = stats_list[index];
  return genEnemy.apply(null, stats);
}

exports.genEnemy = genEnemy;
