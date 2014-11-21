# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'ready page:load', ->
	
  	$('.datepicker').datepicker(format: 'yyyy-mm-dd' );
  	$('#game_show_table').tablesorter sortList: [[1,0]] 
  


