json.array!(@comandas) do |comanda|
  json.extract! comanda, :id, :idcomanda, :idFuncionario, :mesa, :dataAbertura, :dataEncerramento, :valorFinal
  json.url comanda_url(comanda, format: :json)
end
