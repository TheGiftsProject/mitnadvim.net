class window.WeeklyModal extends window.TimeAdjustmentModal
  constructor: (@$modalEl) ->
    super @$modalEl
    @ui =
      _datepicker: @$modalEl.find('.datepicker')
    @initDatepicker()
    @initWeekdaySelect()
    @initDatetimeMask()

  initDatepicker: ->
    new window.MitnadvimDatepicker(@ui._datepicker, {format: 'd/m/Y'})

  # initialize check-box buttons on weekly dialog
  initWeekdaySelect: ->
    @modalEl.find('.weekdays button').on 'click', (e) =>
      $button = $(e.target)
      weekday = $button.data('id')
      @modalEl.find("input:checkbox[value=#{weekday}]").attr 'checked', ->
        not $button.hasClass('active')  # this handler is called before bootstrap sets active class, so we invert the logic

  initDatetimeMask: ->
    @ui._from_date.datetimeEntry({
      datetimeFormat: 'D/m/Y'
      spinnerImage: ''
    })

  selectedWeekdays: ->
    days = []
    @modalEl.find('.weekdays button.active').each (index, el) ->
      days.push($(el).text())
    days.join(', ')

  timeString: ->
    I18n.t('modals.weekly.time_description', {"date": @ui._datepicker.val(), weekdays: @selectedWeekdays(), begin_time: @modalEl.find('.begin-time').val(), end_time: @modalEl.find('.end-time').val()})


