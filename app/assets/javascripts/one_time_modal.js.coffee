class window.OneTimeModal extends window.TimeAdjustmentModal
  constructor: (@modalEl) ->
    super @modalEl
    @ui =
      _datepicker: @modalEl.find('.date-picker')
      _datepicker_container: @modalEl.find('.datepicker-container')
    @initDatepicker()

  initDatepicker: ->
    new window.MitnadvimDatepicker(@ui._datepicker, {always_visible: @ui._datepicker_container})
