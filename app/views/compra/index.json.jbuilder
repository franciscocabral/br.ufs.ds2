json.array!(@vendes) do |vende|
  json.extract! vende, :id, :idVende, :idFornecedor, :idItem, :data, :valor
  json.url vende_url(vende, format: :json)
end
