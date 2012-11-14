#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require_tree .

class window.Mitnadvim

  @showFlashMsg: (msg) ->
    messages = $(".messages")
    flashContainerEl = $("<div class='alert alert-success'></div>")
    flashCloseEl = $("<a class='close' data-dismiss='alert'> ×</a>")
    flashEl = $("<div>#{msg}</div>")

    flashContainerEl.append(flashCloseEl)
    flashContainerEl.append(flashEl)
    messages.append(flashContainerEl)

