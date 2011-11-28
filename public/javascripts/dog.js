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
    },
    
    updateMainPhoto:function(){
      var listItem = jQuery(this);
      mainPhotoDiv.children('img').attr('src', listItem.attr('data-full-photo-url'));
      thumbsListItems.removeClass('selected');
      listItem.addClass('selected');
    }
    
  }
}();