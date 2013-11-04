#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require plugins/jquery_filteron
#= require jquery.datetimeentry
#= require zebra-datepicker/core
#= require moment
#= require filter
#= require new_request
#= require datepicker

class window.Mitnadvim

  @showFlashMsg: (msg) ->
    messages = $(".messages")
    flashContainerEl = $("<div class='alert alert-success'></div>")
    flashCloseEl = $("<a class='close' data-dismiss='alert'> ×</a>")
    flashEl = $("<div>#{msg}</div>")

    flashContainerEl.append(flashCloseEl)
    flashContainerEl.append(flashEl)
    messages.append(flashContainerEl)

  @showRequestSentMsg: ->
    $('.request_sent_modal').modal('show')

