jQuery(function(){
  Home.init();
})

var Home = function(){
  
  var loginLink;
  var registrationLink;
  var loginForm = jQuery('#login_form');
  var registrationForm = jQuery('#registration_form');
  
  return {
    
    init:function(){
      jQuery('#login_link').click(Home.showLoginForm);
      jQuery('#registration_link').click(Home.showRegistrationForm);
      jQuery('#cancel_registration_link').click(Home.hideRegistrationForm)
    },
    
    showLoginForm:function(){
      loginForm.toggle();
    },
    
    showRegistrationForm:function(){
      loginForm.hide();
      registrationForm.show();
    },
    
    hideRegistartionForm:function(){
      registrationForm.hide();
    }
  }
  
  
}();