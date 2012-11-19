$(document).ready(() ->
  $(".volunteer .actions .btn-primary").popover(placement: "right", trigger: "manual")
  $(".volunteer .actions .btn-primary").click(() -> $(this).popover("toggle"))

  $(".school_request_modal").on("hide", (ev) ->
    $(this).find("[rel=popover]").popover("hide")
    $(this).find("[rel=tooltip]").tooltip("hide")
  )

  $(".school_request_modal .close_request").tooltip(placement: "top", trigger: "manual", style: "close_request_tip")
  $(".school_request_modal .close_request").click(() -> $(this).tooltip("toggle"))
)
