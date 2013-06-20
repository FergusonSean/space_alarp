
roomsFunctions = {
  pressAButton : function(roomId) {
    $.ajax("/rooms/"+roomId+"/push_button.js", { 
      dataType : "script",
      type : "POST",
      data : {
        button : 'A'
      }
    }) 
  },
  pressBButton : function(roomId) {
    $.ajax("/rooms/"+roomId+"/push_button.js", { 
      dataType : "script",
      type : "POST",
      data : {
        button : 'B'
      }
    }) 
  },
  updateRoomFields : function(roomId) {
    $.getJSON("/rooms/"+roomId, function(room) {
      $("#sector-damage").innerHTML = room.damage;
      $("#room-power").innerHTML = room.power;
      roomsFunctions.updateEnemies(room.enemies);
    });
  },
  updateEnemies: function(enemies) {
    $.each(enemies, function(index, enemy) {
      $("#enemy-"+enemy.id+" .enemy_health").innerHTML = enemy.health;
      $("#enemy-"+enemy.id+" .enemy_speed").innerHTML = enemy.speed;
      $("#enemy-"+enemy.id+" .enemy_distance").innerHTML = enemy.distance;
    });
  }
};
