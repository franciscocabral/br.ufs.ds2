class ComponentesProduto < ActiveRecord::Base
  validates_presence_of :idProduto, :on => :create, :message => "O campo produto deve ser informado"
  validates_presence_of :idItem, :on => :create, :message => "O campo Item deve ser informado"
  validates_presence_of :quantidade, :on => :create, :message => "A campo quantidade deve ser informada"
end
