jQuery(function(){
  Dog.init();
});

var Dog = function(){
  
  var mainPhotoDiv;
  var thumbsListItems;
  
  return {
    
    init:function(){
      thumbsListItems = jQuery('#thumbs_list li');
      thumbsListItems.click(Dog.updateMainPhoto);
      mainPhotoDiv = jQuery('#main_photo');
      jQuery('#share_url').select();
      // Dog.removeHeaderAndFooter();
    },
    
    updateMainPhoto:function(){
      var listItem = jQuery(this);
      var img = mainPhotoDiv.children('img');
      img.hide();
      img.attr('src', listItem.attr('data-full-photo-url'));
      img.fadeIn();
      thumbsListItems.removeClass('selected');
      listItem.addClass('selected');
    }
    
    // removeHeaderAndFooter:function(){
    //   jQuery('#rg_header').remove();
    //   jQuery('#rg_footer').remove();
    // }
    // 
  }
  
}();


// fb
(function(d, s, id) {
var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
// twitter
(function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs"));
