json.array!(@produtos) do |produto|
  json.extract! produto, :id, :nome, :valor, :descricao
  json.url produto_url(produto, format: :json)
end
