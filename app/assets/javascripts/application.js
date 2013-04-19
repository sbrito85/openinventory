// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require bootstrap
//= require_tree .
//= require_self

$(function() {
  $('#asset_refresh').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true})
  	
	});
$(function() {
  $('#asset_aquired').datepicker({"format": "yyyy-mm-dd", "weekStart": 1, "autoclose": true})

	});
$(function() {
  $(document).on("click","#people th a, #people .pagination a", function() {
$.getScript(this.href);
return false;
});
$("#people_search input").keyup(function() {
$.get($("#people_search").attr("action"), $("#people_search").serialize(), null, "script");
return false;
  });
});
$(function() {
  $(document).on("click","#assets th a, #assets .pagination a", function() {
$.getScript(this.href);
return false;
});
$("#assets_search input").keyup(function() {
$.get($("#assets_search").attr("action"), $("#assets_search").serialize(), null, "script");
return false;
  });
});
