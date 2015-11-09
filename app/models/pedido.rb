class Pedido < ActiveRecord::Base
  belongs_to :comanda, primary_key: "idcomanda", foreign_key: "idcomanda"
  belongs_to :produto, primary_key: "idProduto", foreign_key: "idProduto"

  validates_presence_of :idFuncionario, :on => :create, :message => "O campo funcionario deve ser informado"
  validates_presence_of :idProduto, :on => :create, :message => "O campo produtos deve ser informado"
  validates_presence_of :idcomanda, :on => :create, :message => "O campo comanda deve ser informado"
  validates_presence_of :dataPedido, :on => :create, :message => "O campo data do pedido deve ser informado"
end
