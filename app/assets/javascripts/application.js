// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks

//= require_tree .
//= require_tree ./channels

$(function() {
    $( ".draggable" ).draggable({ cursor: "move", containment: "parent", cancel: "card-body", scroll: true,
    stop: function(){
      var finalxPos = $(this).position().left;
      var finalyPos = $(this).offset().top -22;
      var id =this.getAttribute("serviceId");
      $.ajax({
        method: "PATCH",
        url: "/services/"+id,
        data: { service:{position_x: finalxPos, position_y: finalyPos }}
      })
    }
  })
});
