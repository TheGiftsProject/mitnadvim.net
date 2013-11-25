class window.WeeklyModal extends window.TimeAdjustmentModal
  constructor: (@$modalEl) ->
    super @$modalEl
    @ui =
      _datepicker: @$modalEl.find('.datepicker')
    @weekdays = []
    @initDatepicker()
    @initWeekdaySelect()
    @initDatetimeMask()

  initDatepicker: ->
    new window.MitnadvimDatepicker(@ui._datepicker, {format: 'd/m/Y'})

  # initialize check-box buttons on weekly dialog
  initWeekdaySelect: ->
    @$modalEl.find('.weekdays button').on 'click', (e) =>
      $button = $(e.target)
      weekday = parseInt($button.data('id'))
      name = $button.text()

      @$modalEl.find("input:checkbox[value=#{weekday}]").attr 'checked', ->
        not $button.hasClass('active')  # this handler is called before bootstrap sets active class, so we invert the logic
      if $button.hasClass('active')
        # remove the template
        @removeTimeSelection(weekday)
      else
        # add template
        @addTimeSelection(name, weekday)

  initDatetimeMask: ->
    @ui._datepicker.datetimeEntry({
      datetimeFormat: 'D/m/Y'
      spinnerImage: ''
    })

  selectedWeekdays: ->
    days = []
    @$modalEl.find('.weekdays button.active').each (index, el) ->
      days.push($(el).text())
    days.join(', ')

  removeTimeSelection: (value) ->
    index = $.inArray(value, @weekdays)
    @weekdays.splice(index, 1)
    console.log @weekdays
    @$modalEl.find(".days-with-time>div[data-day='#{value}']").remove()

  addTimeSelection: (name, value) ->
    index = 0
    while index < @weekdays.length
      if value <= @weekdays[index]
        break
      index++
    @weekdays.splice(index, 0, value)
    console.log @weekdays
    template = $('<div class="control-group" data-day="' + value + '"><label class="control-label" for="">יום ' + name + '</label><div class="controls"><span class="datetimeEntry_wrap"><input class="input-mini inline begin-time hasDatetimeEntry" id="request_begin_time" name="request[begin_time][]" type="text"></span> - <span class="datetimeEntry_wrap"><input class="input-mini inline end-time hasDatetimeEntry" id="request_end_time" name="request[end_time][]" type="text"></span><button>X</button> </div></div>')
    if index == 0
      template.prependTo(@$modalEl.find('.days-with-time'))
    else if index == @weekdays.length - 1
      template.appendTo(@$modalEl.find('.days-with-time'))
    else
      template.insertAfter(@$modalEl.find(".days-with-time>div:nth-child(#{index})"))

  timeString: ->
    I18n.t('modals.weekly.time_description', {"date": @ui._datepicker.val(), weekdays: @selectedWeekdays(), begin_time: @$modalEl.find('.begin-time').val(), end_time: @$modalEl.find('.end-time').val()})


