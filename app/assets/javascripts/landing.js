var accountDetailsContainer =
        '<h2></h2>'
    +   '<button class="mdl-button mdl-js-button mdl-button--raised" id="sign-in" name="signin">Sign In</button>&nbsp;&nbsp;&nbsp; '
       '</div>'
    ;

$(document).ready(function() {

  $(".rslides").responsiveSlides({
    auto: true,
    pagination: true,
    nav: true,
    fade: 500,
    maxwidth: 1200
  });

    $('#login-button').animatedDialog({
        content: "~ .animated-dialog-content"
    });

    $('#info-button').animatedDialog({
      "content": "~ .animated-dialog-content",
      "width": 300,
      "height": 500,
      "background": "rgb(236, 236, 236)",
      "tween": "centerExpand"
    });

    $('.product-modal').animatedDialog({
      "content": "~ .animated-dialog-content",
      "width": 600,
      "height": 375,
      "background": "rgb(236, 236, 236)",
      "tween": "centerExpand"
    })
});
