class window.TimeAdjustmentModal
  constructor: (@modalEl) ->
    @ui =
      _time_inputs: @modalEl.find('.begin-time, .end-time')
    @initSaveButton()
    @initTimeInputs()
    @time_format = 'hh:mm'

  initTimeInputs: ->
    @ui._time_inputs.datetimeEntry({
      datetimeFormat: 'H:M'
      spinnerImage: ''
    })

  initSaveButton: ->
    @modalEl.on 'click', '.save-button', =>
      begin_time = moment(@modalEl.find('.begin-time').val(), @time_format)
      end_time = moment(@modalEl.find('.end-time').val(), @time_format)
      hours = end_time.diff(begin_time, 'hours', true)
      $('form input.duration').val(parseFloat(hours.toFixed(1)))
      $('form .time-description').text(@timeString())
