/* Requires underscore.js
 * http://documentcloud.github.com/underscore/
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

    var template = _.template('<li><img src="" data-original-title="<%= dog.name %>" data-content="<%= dog.short_description %>" ><h3><%= dog.name %></h3></li>\n')

    refresh = function() {
      var result = _.reduce(
        dogs,
        function(memo, dog) { return memo + template(dog) },
        ""
      );
      elem.html(result);
      $(".popover").remove();
      elem.html(result);
    }

    this.debug = function() {
      console.log(dogs);
    }

  }
})(jQuery);

$(document).ready(function(){
    var butts = $('.dogs-list').first();
    butts.DogsViewer({
      previous: '.dog-viewer-controls .previous',
      next: '.dog-viewer-controls .next'
    });
});
