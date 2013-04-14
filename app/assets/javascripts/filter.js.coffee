
class FilterCtrl
  constructor: () ->
    @schools = ko.observableArray(window.filterCtrl.schools)
    @school = ko.observable(window.filterCtrl.school)
    @area = ko.observable()

    ko.applyBindings @, $('#request_filter')[0]
  loadSchools: ->
    $.get("/schools.json?area=#{@area()}").success (data) =>
      console.log data
      @schools(data)

window.filter_ctrl = new FilterCtrl();