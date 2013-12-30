json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :computer, :reason, :name
  json.url ticket_url(ticket, format: :json)
end
