json.array!(@items) do |item|
  json.extract! item, :id, :nome, :marca, :descricao, :quantidade, :quantidadeMinima
  json.url item_url(item, format: :json)
end
