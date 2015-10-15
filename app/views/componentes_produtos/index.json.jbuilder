json.array!(@componentes_produtos) do |componentes_produto|
  json.extract! componentes_produto, :id, :idCompoe, :idProduto, :idItem, :quantidade
  json.url componentes_produto_url(componentes_produto, format: :json)
end
