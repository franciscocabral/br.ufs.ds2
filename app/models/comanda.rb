class Comanda < ActiveRecord::Base
  belongs_to :funcionario, primary_key: "idFuncionario", foreign_key: "idFuncionario"
  has_many :pedidos, class_name: 'Pedido', primary_key: "idcomanda", foreign_key: "idComanda"
  has_many :produtos, through: :pedidos
  validates_presence_of :idFuncionario, :on => :create, :message => "O campo funcionario não pode ser vazio"
  validates_presence_of :mesa, :on => :create, :message => "O campo mesa não pode ser vazio"
  validates_presence_of :dataAbertura, :on => :create, :message => "A data de abertura da comanda deve ser informada"

end
