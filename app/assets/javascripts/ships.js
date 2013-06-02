shipsFunctions = {
  SendAjaxRequestToStartMission: function (startMissionUrl) {
    $.ajax({
      type: "POST",
      url: startMissionUrl,
      success: function (data, textStatus, jqXHR) {
        //<Update the display on the page> 
        alert("victory");
      }
    });
  }
}

