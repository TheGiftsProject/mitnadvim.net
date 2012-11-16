$(document).ready(() ->
  $(".volunteer .actions .btn-primary").popover(placement: "right", trigger: "manual")
  $(".volunteer .actions .btn-primary").click(() -> $(this).popover("toggle"))

  $(".school_request_modal").on("hide", (ev) ->
    $(this).find(".volunteer .actions .btn-primary").popover("hide")
  )

  $(".delete_request").click(() ->
    requestId = $(this).attr("reqId")
    $.ajax(
      url: "/requests/#{requestId}"
      type: "DELETE"
      dataType: "json"
      success: (result) =>
        modalEl = $(this).parents(".school_request_modal")
        modalEl.modal("hide")
        Mitnadvim.showFlashMsg(modalEl.find(".flash_content .delete_success").text())
    )
  )
)
