// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

function randColor() {
    var color = (function lol(m, s, c) {
                    return s[m.floor(m.random() * s.length)] +
                        (c && lol(m, s, c - 1));
                })(Math, '3456789ABCDEF', 4);
    return color;
}

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();


  App.messages = App.cable.subscriptions.create('WebNotificationsChannel', {
    received: function(data) {
      var obj = $('#messages').append(this.renderMessage(data));
      $('#messages').animate({ scrollTop: $(document).height() }, "fast");
      return obj
    },

    renderMessage: function(data) {
      return "<p> <b style='color: #"+ randColor()+";'>" + data.message.topic + ": </b>" + data.message.value + "</p>";
    }
  });
  
}).call(this);
