class window.MitnadvimDatepicker
  _options = {
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
  # @el should be jQuery object
  constructor: (@el, options) ->
    @el.Zebra_DatePicker($.extend(options, _options))