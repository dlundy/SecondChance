// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function($){
  $("#twitter").tweet({
    username: "2ndChanceDog",
    count: 4,
    loading_text: "loading...",
    template: "{text} <br/> {time}"
  });
});
