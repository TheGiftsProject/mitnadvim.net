$ ->
  $one_time = $('#one_time_modal')
  $weekly = $('#weekly_modal')
  datePickerOptions = {
    months: [
      I18n.t 'datepicker.months.jan'
      I18n.t 'datepicker.months.feb'
      I18n.t 'datepicker.months.mar'
      I18n.t 'datepicker.months.apr'
      I18n.t 'datepicker.months.may'
      I18n.t 'datepicker.months.jun'
      I18n.t 'datepicker.months.jul'
      I18n.t 'datepicker.months.aug'
      I18n.t 'datepicker.months.sep'
      I18n.t 'datepicker.months.oct'
      I18n.t 'datepicker.months.nov'
      I18n.t 'datepicker.months.dec']
    days: [
      I18n.t 'datepicker.days.sun'
      I18n.t 'datepicker.days.mon'
      I18n.t 'datepicker.days.tue'
      I18n.t 'datepicker.days.wed'
      I18n.t 'datepicker.days.thu'
      I18n.t 'datepicker.days.fri'
      I18n.t 'datepicker.days.sat']
    days_abbr: [
      I18n.t 'datepicker.sdays.sun'
      I18n.t 'datepicker.sdays.mon'
      I18n.t 'datepicker.sdays.tue'
      I18n.t 'datepicker.sdays.wed'
      I18n.t 'datepicker.sdays.thu'
      I18n.t 'datepicker.sdays.fri'
      I18n.t 'datepicker.sdays.sat']
    first_day_of_week: 0
    show_clear_date: false
    show_select_today: false
    weekend_days: [6]
    show_icon: true
  }
  $one_time.find('.date-picker').Zebra_DatePicker($.extend({always_visible: $one_time.find('.datepicker-container')}, datePickerOptions))
  $weekly.find('.datepicker').Zebra_DatePicker($.extend({}, datePickerOptions))

  # initialize check-box buttons on weekly dialog
  $weekly.find('.weekdays button').on 'click', ->
    $this = $(this)
    weekday = $this.data('id')
    $weekly.find("input:checkbox[value=#{weekday}]").attr 'checked', ->
      not $this.hasClass('active')  # this handler is called before bootstrap sets active class, so we invert the logic

  # init selection of recurrence dialog
  $('input.recurrence-select').on 'click', ->
    modalSelector = switch this.value
      when '1' then '#one_time_modal'
      when '2' then '#weekly_modal'
      else ''
    $('a.choose-time').attr('href', modalSelector)

  initSaveButton = (modal) ->
    modal.on 'click', '.save-button', (e) ->
      begin_time = moment(modal.find('.begin-time').val(), timef)
      end_time = moment(modal.find('.end-time').val(), timef)
      hours = end_time.diff(begin_time, 'hours', true)
      $('form input.duration').val(parseFloat(hours.toFixed(1)))

  timef = 'hh:mm'
  initSaveButton $one_time
  initSaveButton $weekly

  # initialize time entry
  $('.begin-time, .end-time').datetimeEntry({
    datetimeFormat: 'H:M'
    spinnerImage: ''
  })

  $('.from-date').datetimeEntry({
    datetimeFormat: 'D/m/Y'
    spinnerImage: ''
  })

