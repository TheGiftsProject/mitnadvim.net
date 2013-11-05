class window.OneTimeModal extends window.TimeAdjustmentModal
  constructor: (@modalEl) ->
    super @modalEl
    @ui =
      _datepicker: @modalEl.find('.date-picker')
      _datepicker_container: @modalEl.find('.datepicker-container')
    @initDatepicker()

  initDatepicker: ->
    new window.MitnadvimDatepicker(@ui._datepicker, {always_visible: @ui._datepicker_container})

  selectedDate: ->
    moment(@ui._datepicker.val(), 'YYYY-MM-DD').format('DD/MM/YYYY')

  timeString: ->
    I18n.t('modals.one_time.time_description', {date: @selectedDate(), begin_time: @modalEl.find('.begin-time').val(), end_time: @modalEl.find('.end-time').val()})
