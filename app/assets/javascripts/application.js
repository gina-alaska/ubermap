// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.remotipart
//= require jquery-ui-1.9.2/js/jquery-ui-1.9.2
//= require bootstrap/dist/js/bootstrap
//= require mapbox.js/dist/mapbox
//= require proj4leaflet/lib/proj4-compressed
//= require proj4leaflet/src/proj4leaflet
//= require leaflet.markerclusterer/dist/leaflet.markercluster
//= require leaflet-hash/leaflet-hash
//= require gina-map-layers/dist/mapbox-adapter
//= require ace-builds/src/ace
//= require leaflet-wms-time-slider/SliderControl
//= require turbolinks
//= require map_layer
//= require_tree .

$(document).on("page:fetch", function() {
  $('.spinner-frame').fadeIn("slow");
});


$(document).on("page:load", function() {
  $('.spinner-frame').fadeOut("slow");
});
