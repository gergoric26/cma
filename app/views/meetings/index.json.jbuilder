json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :purpose, :attendance, :timeAndDate, :location, :notes, :uploadDocuments
  json.url meeting_url(meeting, format: :json)
end
