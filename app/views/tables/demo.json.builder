json.Result "OK"
json.TotalRecordCount @visitors_count
json.Records do
  json.array!(@question) do |question|
    json.question_id question.id
    json.question_desc question.descripcion
  end
end