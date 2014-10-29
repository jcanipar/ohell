# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
  $('#standings_table').tablesorter(sortList: [[3,1]] );
  $('#link1').attr("href", "/players/standings?num_players=3");
  $('#link2').attr("href", "/players/standings?num_players=4");	
  $('#link3').attr("href", "/players/standings?num_players=5");
  $('#side-header').html("# of Players");