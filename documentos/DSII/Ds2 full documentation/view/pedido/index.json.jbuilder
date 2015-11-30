json.array!(@pedidos) do |pedido|
  json.extract! pedido, :id, :idPedido, :idFuncionario, :idProduto, :idcomanda, :dataPedido, :dataFinalizacao, :cancelado
  json.url pedido_url(pedido, format: :json)
end
