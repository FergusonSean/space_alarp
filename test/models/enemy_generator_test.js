var generator = require('../../models/enemy_generator')
var mission = require('../../models/mission')

exports['testGenerateEnemy'] = function (test) {
  enemy = generator.generate(true, 0)

  test.equal('boo', enemy.name)
  test.equal(8, enemy.hp)
  test.equal(3, enemy.maxShields)
  test.equal(3, enemy.shields)
  test.equal(2, enemy.speed)
  test.ok(enemy.x)
  test.ok(enemy.y)
  test.ok(enemy.z)
  test.done();
};

exports['testLaunchEnemyCreatesCallbacks'] = function (test) {
  var originalTimeout = setTimeout
  try {
    var events = []
    global.setTimeout = function(callback, timeout) {
      events.push({
        callback: callback,
        timeout: timeout
      })
    }
    
    var expectedEvent = null
    ship = mission._data
    sector = ship.white
    enemy = generator._genEnemy("test", 5, 5, 60,
      function() { test.equal("x", expectedEvent) },
      function() { test.equal("y", expectedEvent) },
      function() { test.equal("z", expectedEvent) }
    )

    enemy.assignSector(ship, sector)
    enemy.launch(ship, sector)

    test.equal(mission._sectorLength, events.length)
    for(var i = 1; i <= mission._sectorLength; i++) {
      test.equal(i*1000, events[i-1].timeout)
      switch(i) {
      case 20 - mission._distanceToX:
        expectedEvent = "x"; break
      case 20 - mission._distanceToY:
        expectedEvent = "y"; break
      case 20:
        expectedEvent = "z"; break
      default:
        expectedEvent = null
      }
      events[i-1].callback();
    }

    test.done()
  } finally {
    global.setTimeout = originalTimeout
  }
};
