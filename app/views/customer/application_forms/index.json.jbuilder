json.array!(@application_forms) do |application_form|
  json.extract! application_form, :id, :experiment_description
  json.url application_form_url(application_form, format: :json)
end
