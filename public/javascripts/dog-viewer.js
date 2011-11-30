/* Requires underscore.js
 * http://documentcloud.github.com/underscore/
 */

/* TODO:
    -search
    -fade or animate between pages
    -deal with long dog names and heights
    -anchor links/html 5 history
*/

(function($) {
  var defaults = {
    startingPage: 1,
    url : '/dogs.json',
    previous: '.previous',
    next: '.next'
  }

  $.fn.DogsViewer = function(options) {
    var elem = this;
    var opts = $.extend({}, defaults, options);
    var currentPage = opts.startingPage;
    var previousButton = $(opts.previous);
    var nextButton = $(opts.next);
    previousButton.click(function() { elem.DogsViewer.previous() } );
    nextButton.click(function() { elem.DogsViewer.next() } );

    var dogs = [];

    this.DogsViewer.next = function() {
      loadData(currentPage+1, refresh);
    }

    this.DogsViewer.previous = function() {
      loadData(currentPage-1, refresh);
    }

    loadData = function(page, callback) {
      $.getJSON(opts.url + '?page='+page, function(data) {
        dogs = data;
        currentPage = page;
        callback();
      });
    }

    var template = _.template('<a href="/dogs/<%= dog.id %>"><li><img src="<%= dog.primary_thumb_url %>" data-original-title="<%= dog.name %>" data-content="<%= dog.short_description %>" ><h3><%= dog.name %></h3></li></a>\n')

    refresh = function() {
      var result = _.reduce(
        dogs,
        function(memo, dog) { return memo + template(dog) },
        ""
      );
      _.defer(function(){elem.html(result)});
      $(".popover").remove();
    }

    this.debug = function() {
      console.log(dogs);
    }

  }
})(jQuery);

$(document).ready(function(){
    $('.dogs-list').DogsViewer({
      previous: '.dog-viewer-controls .previous',
      next: '.dog-viewer-controls .next'
    });
});
