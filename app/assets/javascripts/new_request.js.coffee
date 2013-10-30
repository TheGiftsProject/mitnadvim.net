$ ->
  $one_time = $('#one_time_modal')
  $weekly = $('#weekly_modal')
  datePickerOptions = {
    months: ['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי', 'אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר']
    days: ['ראשון', 'שני', 'שלישי', 'רביעי', 'חמישי', 'שישי', 'שבת']
    days_abbr: ['א', 'ב', 'ג', 'ד', 'ה', 'ו', 'ש']
    first_day_of_week: 0
    show_clear_date: false
    show_select_today: false
    weekend_days: [6]
    show_icon: true
  }
  $one_time.find('.date-picker').Zebra_DatePicker($.extend({always_visible: $one_time.find('.datepicker-container')}, datePickerOptions))
  $weekly.find('.datepicker').Zebra_DatePicker($.extend({}, datePickerOptions))

  $('input.recurrence-select').on 'click', ->
    modalSelector = switch this.value
      when '1' then '#one_time_modal'
      when '2' then '#weekly_modal'
      else ''
    $('a.choose-time').attr('href', modalSelector)

  timef = 'hh:mm'
  $one_time.on 'click', '.save-button', (e) ->
    begin_time = moment($one_time.find('.begin-time').val(), timef)
    end_time = moment($one_time.find('.end-time').val(), timef)
    hours = end_time.diff(begin_time, 'hours', true)
    $('form input.duration').val(hours)

  $('.begin-time, .end-time').datetimeEntry({
    datetimeFormat: 'H:M'
    spinnerImage: ''
  })

  $('.from-date').datetimeEntry({
    datetimeFormat: 'D/m/Y'
    spinnerImage: ''
  })
