var generator = require('../models/enemy_generator')

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
  enemy = generator.generate(true, 0)
  
  test.done();
};
