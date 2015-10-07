class Item < ActiveRecord::Base
  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :marca, :on => :create, :message => "O campo marca deve ser informado"
  validates_presence_of :descricao, :on => :create, :message => "O campo descricao deve ser informado"
  validates_presence_of :quantidade, :on => :create, :message => "O campo quantidade deve ser informmado"
  validates_presence_of :quantidadeMinima, :on => :create, :message => "O campo quantidade minima deve ser preenchido"
end
