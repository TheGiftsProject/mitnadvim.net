
class FilterCtrl
  constructor: () ->
    console.log 'schools: ' + window.filterCtrl.schools
    @schools = ko.observableArray(window.filterCtrl.schools)
    console.log 'school: ' + window.filterCtrl.school
    @school = ko.observable(window.filterCtrl.school)
    @area = ko.observable()

    ko.applyBindings @, $('#request_filter')[0]
  loadSchools: ->
    $.get("/schools.json?area=#{@area()}").success (data) =>
      console.log data
      @schools(data)

window.filter_ctrl = new FilterCtrl();