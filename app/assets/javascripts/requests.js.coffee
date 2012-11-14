# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(() ->
  $(".volunteer .actions .btn-primary").popover(placement: "right", trigger: "manual")
  $(".volunteer .actions .btn-primary").click(() -> $(this).popover("toggle"))

  $(".school_request_modal").on("hide", (ev) ->
    $(this).find(".volunteer .actions .btn-primary").popover("hide")
  )

  $(".delete_request").click(() ->
    debugger
    requestId = $(this).attr("reqId")
    $.ajax(
      url: "/requests/#{requestId}"
      type: "DELETE"
      dataType: "json"
      success: (result) =>
        $(this).parents(".school_request_modal").modal("hide")
    )
  )
)