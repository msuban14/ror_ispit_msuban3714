// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "bootstrap"
import "./src/application.scss"
global.$ = global.jQuery = jQuery;
window.$ = window.jQuery = jQuery;




$(document).ready(function(){

  $('#fishing_area_location_id').parent().hide();

  $("#fishing_area_country_id").change(function() {
      // using text value to match second select option groups could just as easily be based on value then label text
      var arr = $('#fishing_area_country_id option:selected').text();

      if (arr !== '') {
        $('#fishing_area_location_id').parent().show();
        $("#fishing_area_location_id").children("optgroup").hide();
        $("#fishing_area_location_id").children("optgroup[label='" + arr + "']").show();

        $('#fishing_area_fishery_id').parent().show();
        $("#fishing_area_fishery_id").children("optgroup").hide();
        $("#fishing_area_fishery_id").children("optgroup[label='" + arr + "']").show();
      } else {
        //uncomment in case of disabling the show/hide for location
        //$("#fishing_area_location_id").children("optgroup").show();
        //$("#fishing_area_fishery_id").children("optgroup").show();
        $('#fishing_area_location_id').parent().hide();
        $('#fishing_area_fishery_id').parent().hide();
      }
    });


});
