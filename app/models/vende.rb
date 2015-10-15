class Vende < ActiveRecord::Base
  validates_presence_of :idFornecedor, :on => :create, :message => "O campo fornecedor deve ser informado"
  validates_presence_of :idItem, :on => :create, :message => "O campo item deve ser informado"
  validates_presence_of :data, :on => :create, :message => "O campo data deve ser informado"
  validates_presence_of :valor, :on => :create, :message => "O campo valor deve ser informado"
end
