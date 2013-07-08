
$ ->
  setSchools = (schools) ->
    #remove all options except the prompt
    html = ''
    $.each(schools, ->
      html += "<option value='#{this.id}'>#{this.name}</option>"
    )
    $('#school option[value!=""]').remove()
    $('#school').append(html);

  selectSchool = (school_id) ->
    $('#school').val(school_id)

  $('form#request_filter #area').on('change', ->
    area_id = $(this).val()
    $.get("/schools.json?area=#{area_id}").success (data) =>
          console.log data
          setSchools(data)
  )

  setSchools(window.filterCtrl.schools)
  selectSchool(window.filterCtrl.school)
