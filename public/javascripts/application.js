// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function($){

  // Twitter for frontpage
  $("#twitter").tweet({
    username: "2ndChanceDog",
    count: 4,
    loading_text: "loading...",
    template: "{text} <br/> {time}"
  });

  // popovers for dogs
  // Since we can't show a short blurb about the dogs, this should probably just be hidden
  /*
  $('.dogs-list img').popover({
    placement: 'below',
    live: true,
    html: true
  });
  */

  // Dogs viewer
  window.dogViewer = $('#dog-viewer');
  dogViewer.DogsViewer();

  $('#dog-viewer-controls .next').click(function() { window.dogViewer.DogsViewer.nextPage() });
  $('#dog-viewer-controls .previous').click(function() { window.dogViewer.DogsViewer.previousPage() });

});
