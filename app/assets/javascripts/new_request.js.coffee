$ ->
  $one_time = $('#one_time_modal')
  $weekly = $('#weekly_modal')

  new window.MitnadvimDatepicker($one_time.find('.date-picker'), {always_visible: $one_time.find('.datepicker-container')})
  new window.MitnadvimDatepicker($weekly.find('.datepicker'), {})

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

