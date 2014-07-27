var genDoDamageHandler = function(damage) {
  return function(ship, enemy, sector) {
    console.log("DAMAGE! " + damage + " on " + sector);
  }
}

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
    enemy.distance -= speed;
    if (oldDist > 12 && 12 >= enemy.distance) {
      enemy.x(ship, sector, enemy);
    } else if (oldDist > 6 && 6 >= enemy.distance) {
      enemy.y(ship, sector, enemy);
    } else if (enemy.distance <= 0) {
      enemy.z(ship, sector, enemy);
      enemy.removeFromSector(sector);
      return;
    }
    
    setTimeout(45000, function() {
      enemy.advance(ship, sector);
    });
  }
  enemy["removeFromSector"] = function(sector) {
    index = sector.enemies.indexOf(enemy);
    if (index >= 0) {
      sector.enemies.splice(index, 1);
    }
  }
  enemy["launch"] = function(ship, sector) {
    enemy["distance"] = 20;
    sector.enemies << enemy;

    setTimeout(45000, function() {
      enemy.advance(ship, sector);
    });
  }
}

var threats = [
  ["evil ship", 5, 2, 3, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(3)],
  ["more evil ship", 5, 3, 2, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(3)]
]

var seriousThreats = [
  ["boo", 8, 3, 2, genDoDamageHandler(2), genDoDamageHandler(3), genDoDamageHandler(4)],
  ["spook", 10, 2, 3, genDoDamageHandler(1), genDoDamageHandler(2), genDoDamageHandler(2)]
]

exports.generate = function(serious_threat) {
  var stats_list = serious_threat ? serious_threats : threats;
  var stats = stats_list[Math.floor(Math.random() * stats_list.length)];
  return gen_enemy(stats);
}
