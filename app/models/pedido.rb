class Pedido < ActiveRecord::Base
  validates_presence_of :inFuncionario, :on => :create, :message => "O campo funcionario deve ser informado"
  validates_presence_of :idProduto, :on => :create, :message => "O campo produtos deve ser informado"
  validates_presence_of :idComanda, :on => :create, :message => "O campo comanda deve ser informado"
  validates_presence_of :dataPedido, :on => :create, :message => "O campo data do pedido deve ser informado"
  validates_presence_of :dataFinalizacao, :on => :create, :message => "O campo data da finalização deve ser informado"
end
