HTMLWidgets.widget({

  name: 'tippy',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
        el.innerHTML = x.text;
        el.setAttribute("title", x.tooltip);

        Tippy('#' + el.id,
        {
          position: x.position,
          animation: x.animation,
          trigger: x.trigger,
          interactive: x.interactive,
          interactiveBorder: x.interactiveBorder,
          delay: x.delay,
          hideDelay: x.hideDelay,
          arrow: x.arrow,
          arrowSize: x.arrowSize,
          animateFill: x.animateFill,
          duration: x.duration,
          hideDuration: x.hideDuration,
          html: x.html,
          distance: x.distance,
          theme: x.theme,
          offset: x.offset,
          hideOnClick: x.hideOnClick,
          multiple: x.multiple,
          followCursor: x.followCursor,
          inertia: x.inertia,
          flipDuration: x.flipDuration,
          sticky: x.sticky,
          stickyDuration: x.stickyDuration,
          zIndex: x.zIndex,
          touchHold: x.touchHold
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
