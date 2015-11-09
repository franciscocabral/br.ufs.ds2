class ComponentesProduto < ActiveRecord::Base
  belongs_to :item, primary_key: "idItem", foreign_key: "idItem"
  belongs_to :produto, primary_key: "idProduto", foreign_key: "idProduto"
  validates_presence_of :idProduto, :on => :create, :message => "O campo produto deve ser informado"
  validates_presence_of :idItem, :on => :create, :message => "O campo Item deve ser informado"
  validates_presence_of :quantidade, :on => :create, :message => "A campo quantidade deve ser informada"
end
