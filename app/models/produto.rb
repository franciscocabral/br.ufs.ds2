class Produto < ActiveRecord::Base
  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :valor, :on => :create, :message => "O campo valor deve ser informado"
  validates_presence_of :descricao, :on => :create, :message => "O campo descricao deve ser informado"
end
