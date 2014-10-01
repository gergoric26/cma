json.array!(@contacts) do |contact|
  json.extract! contact, :id, :firstName, :lastName, :streetAddress, :city, :state, :zip, :phoneNumber, :alternatePhoneNumber, :comments, :birthday, :uploadDocuments
  json.url contact_url(contact, format: :json)
end
