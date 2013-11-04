$ ->
  # init selection of recurrence dialog
  $('input.recurrence-select').on 'click', ->
    modalSelector = switch this.value
      when '1' then '#one_time_modal'
      when '2' then '#weekly_modal'
      else ''
    $('a.choose-time').attr('href', modalSelector)

  oneTimeModal = new window.OneTimeModal($('#one_time_modal'))
  weeklyModal = new window.WeeklyModal($('#weekly_modal'))
