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

function drawLines() {
  $(".jquery-line").remove();
  $('[id^="draggable-element-"]').each(function () {
    var initial = this;
    var toElement = this.getAttribute("toService")
    if(toElement){
      var element = $("#draggable-element-"+toElement)
      if(element.length){
        var fromPoint = $(this).offset();
        var toPoint = element.offset();

        var from = function () {},
        to = new String('to');
        from.y = fromPoint.top+$(this).height()/2;
        from.x = fromPoint.left+$(this).width()+5;
        to.y = toPoint.top+element.height()/2;
        to.x = toPoint.left;
        $.line(from, to);

        $('#services-widget').append(
          "<img class=\"jquery-line\"src=\"/assets/right.svg\" style=\"width:auto;height:auto;position:absolute; left:"+ (element.position().left-6) +"px;top:"+ ((element.position().top+element.height()/2)-8) +"px\"></img>"
        );
      }
    }
  });
}


function makeDraggable() {
  $( ".draggable" ).draggable({ cursor: "move", scroll: true, cancel: "card-body", containment: "parent",
    stop: function(){
      var finalxPos = $(this).position().left;
      var finalyPos = $(this).offset().top - 22;
      var id =this.getAttribute("serviceId");
      drawLines();
      $.ajax({
        method: "PATCH",
        url: "/services/"+id,
        data: { service:{position_x: finalxPos, position_y: finalyPos }}
      })
    }
  })
}

$(function() {

    drawLines();
    makeDraggable();

});
