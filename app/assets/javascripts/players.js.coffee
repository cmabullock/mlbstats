# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$('#players').dataTable
		spaginationType: "full_numbers"
		bProcessing: true
		bServerSide: true
		aaSorting: [[2,"desc"]] 
		sAjaxSource: $("#players").data('source') 