class window.ModalManager

  @renderRemoteModal: (path, container) ->
    $(container).load(path)

$(document).ready(() ->
  $("*[remote-modal]").each(() ->
    path = $(this).attr("remote-modal")
    $(this).click(() ->
      window.ModalManager.renderRemoteModal(path, $(this).parent(".request_row"))
    )
  )
)