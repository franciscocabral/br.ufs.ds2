json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :nome, :cpf, :cidade, :estado, :num, :endereco, :telefone, :salario, :dataContratacao, :ativo, :turno, :login, :password_digest, :nivelAcesso
  json.url funcionario_url(funcionario, format: :json)
end
