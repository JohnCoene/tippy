HTMLWidgets.widget({

  name: 'tippy',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {
        
        var id = el.id;
        
        if(x.hasOwnProperty('element')){
          id = x.element;
          var sel = document.getElementById(id);
          sel.setAttribute("title", x.tooltip);
          el.style.display = "none";
        } else {
          el.innerHTML = x.text;
          el.setAttribute("title", x.tooltip);
        }

        tippy('#' + id, x.opts);

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
