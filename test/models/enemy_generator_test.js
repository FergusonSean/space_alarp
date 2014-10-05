var generator = require('../models/enemy_generator')
var mission = require('../models/mission')

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
  firstHit = false
  secondHit = false
  thirdHit = false

  var originalTimeout = setTimeout
  try {
    var events = []
    globals.setTimeout = function(callback, timeout) {
      events << [callback, timeout]
    }

    ship = mission._data
    sector = ship.white
    enemy = generator.genEnemy("test", 20, 5, 5, 4,
      function() { return 1 },
      function() { return 2 },
      function() { return 3 }
    )
    enemy.assignSector(ship, sector)
    enemy.launch(ship, sector)

    

    test.done()
  } finally {
    globals.setTimeout = originalTimeout
  }
  
};
