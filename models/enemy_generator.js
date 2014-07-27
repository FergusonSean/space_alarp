var event_do_dmg = function(damage) {
  return function(enemy, sector) {
    console.log("DAMAGE! " + damage + " on " + sector);
  }
}

var gen_enemy = function(name, hp, shields, speed, x, y, z) {
  enemy = {
    "name": name,
    "hp": hp,
    "max_shields": shields,
    "shields": shields,
    "speed": speed,
    "x": (typeof x !== 'undefined' ? x : null),
    "y": (typeof y !== 'undefined' ? y : null),
    "z": (typeof z !== 'undefined' ? z : null),
  }
  enemy["alive"] = function() { return enemy.hp > 0; }
  enemy["advance"] = function(sector) {
    if (!enemy.alive()) {
      return;
    }
    old_dist = enemy.distance;
    enemy.distance -= speed;
    if (old_dist > 12 && 12 >= enemy.distance) {
      enemy.x(enemy, sector);
    } else if (old_dist > 6 && 6 >= enemy.distance) {
      enemy.y(enemy, sector);
    } else if (enemy.distance <= 0) {
      enemy.z(enemy, sector);
    }
    setTimeout(45000, function() {
      enemy.advance(sector);
    });
  }
  enemy["launch"] = function(sector) {
    enemy["distance"] = 20;
    setTimeout(45000, function() {
      enemy.advance(enemy, sector);
    });
  }
}

var threats = {
  ["evil ship", 5, 2, 3, event_do_dmg(1), event_do_dmg(2), event_do_dmg(3)],
  ["more evil ship", 5, 3, 2, event_do_dmg(1), event_do_dmg(2), event_do_dmg(3)]
}

var serious_threats = {
  ["boo", 8, 3, 2, event_do_dmg(2), event_do_dmg(3), event_do_dmg(4)],
  ["spook", 10, 2, 3, event_do_dmg(1), event_do_dmg(2), event_do_dmg(2)]
}

exports.generate = function(serious_threat) {
  var stats_list = serious_threat ? serious_threats : threats;
  var stats = stats_list[Math.floor(Math.random() * stats_list.length)];
  return gen_enemy(stats);
}
