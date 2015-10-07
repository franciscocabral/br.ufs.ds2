json.array!(@fornecedors) do |fornecedor|
  json.extract! fornecedor, :id, :nome, :cnpj, :cidade, :estado, :num, :endereco, :telefone
  json.url fornecedor_url(fornecedor, format: :json)
end
