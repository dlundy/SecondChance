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
    
  }
  
}();