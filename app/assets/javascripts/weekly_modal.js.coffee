class window.WeeklyModal extends window.TimeAdjustmentModal
  constructor: (@modalEl) ->
    super @modalEl
    @ui =
      _datepicker: @modalEl.find('.datepicker')
      _from_date: @modalEl.find('.from-date')
    @initDatepicker()
    @initWeekdaySelect()
    @initDatetimeMask()

  initDatepicker: ->
    new window.MitnadvimDatepicker(@ui._datepicker, {})

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


