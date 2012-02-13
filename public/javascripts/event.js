jQuery(function(){
  Event.init();
})

var Event = function(){
  
  // var eventAddDogsDiv;
  var eventAddDogLink; 
  var eventRemoveDogLink;
  return {
    
    init:function(){
      // eventAddDogsDiv = jQuery('#event_add_dogs_div');
      eventAddDogLink = jQuery('.event_add_dog_link');
      eventAddDogLink.live('click', Event.addDogForm);
      eventRemoveDogLink = jQuery('.event_dog_remove_link');
      eventRemoveDogLink.live('click', Event.removeDog);
      jQuery('.event_remove_dog_link').live('click', Event.removeDog);
    },
    
    addDogForm:function(){
      var myLink = jQuery(this);
      var eventMemberId = myLink.attr('data-event-member-id');
      jQuery.ajax({
        url: '/event_members/' + eventMemberId + '.json',
        type: 'get',
        success:function(response){
          var form = '<form class="add_event_dog_form" action="/event_members/' + eventMemberId + '/add_dog">';
          form += '<select name="dog_id">';
          form += '<option>Add A Dog</option>';
          jQuery(response).each(function(idx, dog){
            form += '<option value="' + dog['dog']['id'] + '">' + dog['dog']['name'] + '</option>'; 
          })  
          form += '</select>';
          form += '<input type="submit" value="Add Dog" />';
          form += '</form>';
          myLink.append(form);
          jQuery('.add_event_dog_form').submit(Event.addDog);
        }
      });
    },
    
    addDog:function(){
      var myForm = jQuery(this);
      var memberEventListingDiv = myForm.closest('.member_event_listing_div');
      var memberEventDogList = memberEventListingDiv.children('ul.member_event_dog_list');
      myForm.remove();
			jQuery.ajax({
        url: myForm.attr('action') + '.json',
        type: 'post',
        data: myForm.serialize(),
        success:function(response){
					var newDogListItems = '';
          jQuery(response['dogs']).each(function(idx, dog){
            var eventMemberId = myForm.attr('action').match(/\d/)[0];
            var removeLink = '<a href="javascript:void(0)" class="event_dog_remove_link" data-event-member-id="' + eventMemberId + '" data-dog-id="' + dog['dog']['id'] + '">Remove</a>'
            newDogListItems += '<li id="event_dog_' + dog['dog']['id'] + '">' + dog['dog']['name'] + '&nbsp;' + removeLink + '</li>'; 
          });
          memberEventDogList.html(newDogListItems);
          jQuery('a.event_dog_remove_link').click(Event.removeDog);
          if(response['all_dogs'] == true){
            eventAddDogLink.remove();
          }
        }
      });
      return false;
    },
    
    removeDog:function(){
      myLink = jQuery(this);
      jQuery.ajax({
        url: '/event_members/' + myLink.attr('data-event-member-id') + '/remove_dog.json',
        type: 'post',
        data: {event_member_dog_id: myLink.attr('data-event-member-dog-id')},
        success:function(){
          myLink.closest('li').remove();
          if(jQuery('.event_add_dog_link').length < 1){
						
					}
}
        }
      })
    }
    
  }
  
}();