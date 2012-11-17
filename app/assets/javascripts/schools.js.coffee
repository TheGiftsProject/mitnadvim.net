$(document).ready(() ->
  $(".volunteer .actions .btn-primary").popover(placement: "right", trigger: "manual")
  $(".volunteer .actions .btn-primary").click(() -> $(this).popover("toggle"))

  $(".school_request_modal").on("hide", (ev) ->
    $(this).find(".volunteer .actions .btn-primary").popover("hide")
  )

)
