# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(() ->
  $(".volunteer .actions .btn-primary").popover(placement: "top", trigger: "manual")
  $(".volunteer .actions .btn-primary").click(() -> $(this).popover("toggle"))
)