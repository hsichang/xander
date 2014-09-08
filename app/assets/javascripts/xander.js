// TODO: Escape button closes modals
$(document).ready(function() {

  var Router = function() {
    var self = this;
    self.$body = $('body');
    self.$menuBtn = $('.top_menu');
    self.$modalBtn = $('.modal-close-btn')

    self._welcomeScreen();
    self._bindClickEvents();
  }

  Router.prototype = {
    _bindClickEvents : function() {
      var self = this;

      self.$menuBtn.on('click', function(evt) {
        evt.preventDefault();
        if (evt.target.id !== 'home') {
          if ( (evt.target.id) !== self.$body.attr('class') ) {
            self._switchWindow(evt.target.id)
          };
        } else {
          self._welcomeScreen();
        };  
      });

      self.$modalBtn.on('click', function(evt) {
        evt.preventDefault();
        self._welcomeScreen();
      });

      self.$body.keyup(function(evt) {
        if (evt.keyCode === 27) { self._welcomeScreen() } 
      });
    },

    _welcomeScreen : function() {
      var self = this;
      self.$body.removeClass();
    },

    _switchWindow : function(route) {
      var self = this;

      self.$body.attr('class', route);
    },

  };  /* end of Router.prototype */

  new Router();
}); 
