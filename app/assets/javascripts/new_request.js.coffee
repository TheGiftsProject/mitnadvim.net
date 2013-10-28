$ ->
  $one_time = $('#one_time_modal')
  $one_time.find('.date-picker').Zebra_DatePicker({
    months: ['ינואר', 'פברואר', 'מרץ', 'אפריל', 'מאי', 'יוני', 'יולי', 'אוגוסט', 'ספטמבר', 'אוקטובר', 'נובמבר', 'דצמבר']
    #months_abbr: []
    days: ['ראשון', 'שני', 'שלישי', 'רביעי', 'חמישי', 'שישי', 'שבת']
    days_abbr: ['א', 'ב', 'ג', 'ד', 'ה', 'ו', 'ש']
    always_visible: $('#datepicker_container')
    first_day_of_week: 0
  })

  timef = 'hh:mm'
  $one_time.on 'click', '.save-button', (e) ->
    begin_time = moment($one_time.find('.begin-time').val(), timef)
    end_time = moment($one_time.find('.end-time').val(), timef)
    hours = end_time.diff(begin_time, 'hours', true)
    $('form input.duration').val(hours)
