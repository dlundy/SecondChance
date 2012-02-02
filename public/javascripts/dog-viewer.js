/* Requires underscore.js
 * http://documentcloud.github.com/underscore/
 */

/* TODO:
    -fade or animate between pages
    -spacing when only one row is present?
    -clear/reset button?
*/

(function($) {
  var defaults = {
    remote_path : '/dogs.json',
    pagination: '#dog-pagination',
    results_label: "#dog-results",
    content: '#dog-content',
    default_search: 'all',
    form: '#dog-viewer-controls form'
  }

  $.fn.DogsViewer = function(options) {
    var _self = this;
    var opts = $.extend({}, defaults, options);
    var currentPage = 1;
    var searchTerm = opts.default_search;

    $(opts.form).submit(function() {
      var val = $('.dog-search:first').val();
      if (val == "") val = "all";
      _self.DogsViewer.search(val);
      return false;
    });

    var pagination = function() {
      var _self = {};
      _self.container = $(opts.pagination);
      _self.pages = 1;

      var template = _.template(
        "<% _.each(_.range(size), function(index) { %>" +
          "<a class='pagination-dot <% if (index == currentPage-1) { print ('active') } %>' href='#/<%=searchTerm%>/<%=index + 1%>'></a>" +
        "<% }) %>"
      );

      _self.redraw = function() {
        if (_self.pages > 1) {
          var result = template({
            'size': _self.pages,
            'currentPage': currentPage,
            'searchTerm': searchTerm
          });
          _self.container.html(result);
        }
        else {
          _self.container.html("");
        }
      }

      // Use to give the illusion of immediate feedback
      _self.setActive = function(index) {
        _self.container.children().removeClass('active');
        _self.container.children().eq(index).addClass('active');
      }

      return _self;
    }();

    var dogs = function() {

      var _self = {};
      _self.dogs = [];
      _self.container = $(opts.content);
      var template = _.template('<li><a href="/dogs/<%= dog.id %>"><img src="<%= dog.primary_thumb_url %>"><h3><%= dog.name %></h3></a></li>\n');

      _self.redraw = function() {
        var result = _.reduce(
          _self.dogs,
          function(memo, dog) { return memo + template(dog) },
          ""
        );
        _self.container.html("<ul class='dogs-list'>"+result+"</ul>");
      }

      return _self;

    }();

    // Address handling routines.
    // These load new data by altering the url and forcing the address change handler to fire
    var setAction = function(newSearch, currentPage) {
      $.address.value(newSearch + "/" + currentPage);
    }

    _self.DogsViewer.nextPage = function() {
      if (currentPage < pagination.pages) {
        currentPage = currentPage + 1;
        setAction(searchTerm, currentPage);
      }
    }

    _self.DogsViewer.previousPage = function() {
      if (currentPage > 1) {
        currentPage = currentPage - 1;
        setAction(searchTerm, currentPage);
      }
    }

    _self.DogsViewer.search = function(newSearch) {
      setAction(newSearch, 1);
    }

    // Handle any changes in # addresses.
    // This function drives all data loading by responding to address changes.
    $.address.change(function(event) {
      // use default search if base url
      if (event.path == '/') {
        searchTerm = opts.default_search;
        currentPage = 1;
        loadPage(searchTerm, currentPage);
      }
      else {
        searchTerm = event.pathNames[0];
        currentPage = parseInt(event.pathNames[1]);
        loadPage(searchTerm, currentPage);
      }
    });

    // Variable used to track what the newest XHR call was.
    // Only the results from the newest load call will be handled, the rest will be ignored.
    var latestXHRCall;

    var loadPage = function(search, page) {
      pagination.setActive(page-1);
      var params = {'page': page}

      // Don't actually search by the search term if it's the default "all"
      if (opts.default_search != search) {
        params.search_text = search
      }

      // Make call to server
      latestXHRCall = $.getJSON(opts.remote_path,params)
      .success(function(data, textStatus, jqXHR) {
        if (latestXHRCall === jqXHR) {
          success(data);
        }
      })
      .error(function(data, textStatus, jqXHR) {
        if (latestXHRCall === jqXHR) {
          noResults(data);
        }
      });

      var success = function(data) { 
        dogs.dogs = data.dogs;
        dogs.redraw();
        pagination.pages = data.pages;
        pagination.redraw();
        //$(".popover").remove(); // not needed if popovers not active

        var label;
        if (opts.default_search == search) {
          label = "We currently have " + data.results + " dogs available for adoption.";
        }
        else {
          label = "We have " + data.results + " dogs that match '" + search + "'.";
        }

        $(opts.results_label).html(label);
      };

      var noResults = function(data) {
        dogs.dogs = []
        dogs.redraw();
        $(opts.results_label).html("No results found for: " + searchTerm);
        pagination.pages = 1;
        pagination.redraw();
        $(".popover").remove();
      }
    }

    return this;
  }
})(jQuery);

$(document).ready(function(){
  window.dogViewer = $('#dog-viewer');
  dogViewer.DogsViewer();

  $('#dog-viewer-controls .next').click(function() { window.dogViewer.DogsViewer.nextPage() });
  $('#dog-viewer-controls .previous').click(function() { window.dogViewer.DogsViewer.previousPage() });
})