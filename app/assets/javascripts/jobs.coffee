# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  contact_people = $('#job_contact_person_id').html()

  $('#job_company_id').change ->
    company = $('#job_company_id :selected').text()
    options = $(contact_people).filter("optgroup[label='#{company}']").html()

    if options
      $('#job_contact_person_id ').html(options)
      $('#job_contact_person_id').parent().show()
    else
      $('#job_contact_person_id').empty()
      $('#job_contact_person_id').parent().hide()
