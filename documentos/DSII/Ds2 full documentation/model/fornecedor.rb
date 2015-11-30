class Fornecedor < ActiveRecord::Base
  has_many :vende, foreign_key: "idFornecedor"
  has_many :items, ->{uniq}, through: :vende
 
  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :cnpj, :on => :create, :message => "O campo CNPJ deve ser informado"
  validates_presence_of :cidade, :on => :create, :message => "O campo cidade deve ser informado"
  validates_presence_of :estado, :on => :create, :message => "O campo estado deve ser informado"
  validates_presence_of :telefone, :on => :create, :message => "O campo telefone deve ser informado"
end
