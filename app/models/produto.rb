class Produto < ActiveRecord::Base
  has_many :pedidos, primary_key: "idPedido", foreign_key: "idPedido"
  has_many :comandas, through: :pedidos
  has_many :componentes_produtos, primary_key: "idProduto", foreign_key: "idProduto"
  has_many :items, through: :componentes_produtos

  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :valor, :on => :create, :message => "O campo valor deve ser informado"
  validates_presence_of :descricao, :on => :create, :message => "O campo descricao deve ser informado"
end
