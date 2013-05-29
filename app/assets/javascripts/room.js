
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
  
  refreshData : function() {
    $('#mydiv').load("/rooms/"+roomIdForHackRefresh+" #mydiv")
    setTimeout(roomsFunctions.refreshData , 2000);
  },
};
