json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :email, :phone, :msg
  json.url contact_url(contact, format: :json)
end
