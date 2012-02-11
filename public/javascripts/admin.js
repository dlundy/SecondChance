// Use this to customize the wymeditor boot process
// Just mirror the options specified in boot_wym.js with the new options here.
// This will completely override anything specified in boot_wym.js for that key.
// e.g. skin: 'something_else'
var custom_wymeditor_boot_options = {

};

jQuery(function(){
  Admin.init();
});

var Admin = function(){
  
  var marqueLoading = '<marquee><strong>LOADING... Please Wait...</strong></marquee>';
  var importLink = '<a href="javascript:void(0)" class="add_icon" id="import_dog_data_link">Import Dog Data</a>';
  
  return {
    
    init:function(){
      jQuery('#import_dog_data_link').live('click', Admin.importDogData);
    },
    
    importDogData:function(){
      var myLink = jQuery(this);
      var myLi = myLink.parent();
      myLink.remove();
      myLi.html(marqueLoading);
      jQuery.ajax({
        url: '/dogs/import_dog_data.json',
        type: 'post',
        success:function(){
          myLi.html(myLink);
        }
      });
    }
  }
  
}();