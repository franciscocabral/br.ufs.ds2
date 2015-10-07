class Funcionario < ActiveRecord::Base
  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :cpf, :on => :create, :message => "O campo cpf deve ser infomado"
  validates_presence_of :cidade, :on => :create, :message => "O campo cidade deve ser informado"
  validates_presence_of :estado, :on => :create, :message => "O campo estado deve ser informado"
  validates_presence_of :num, :on => :create, :message => "O campo num deve ser informado"
  validates_presence_of :endereco, :on => :create, :message => "O campo endereço deve ser infomado"
  validates_presence_of :telefone, :on => :create, :message => "O campo telefone deve ser informado"
  validates_presence_of :salario, :on => :create, :message => "O campo salario deve ser informado"
  validates_presence_of :dataContratacao, :on => :create, :message => "O campo data de contratação deve ser informado"
  validates_presence_of :ativo, :on => :create, :message => "O campo ativo deve ser informado"
  validates_presence_of :turno, :on => :create, :message => "O campo turno deve ser informado"
  validates_presence_of :login, :on => :create, :message => "O campo login deve ser informado"
  validates_presence_of :nivelAcesso, :on => :create, :message => "O campo nivel de acesso deve ser informado"

  has_secure_password

  validates_presence_of :password, :on => :create, :message => "O campo senha deve ser informado"
  validates_presence_of :password_confirmation, :on => :create, :message => "O campo confirmação de senha deve ser informado"

  validates_length_of :password, :within => 6..20, :on => :create, :message => "O campo senha deve ter entre 6 e 20 carateres"
  validates_length_of :password_confirmation, :within => 6..20, :on => :create, :message => "O campo confirmação de senha deve entre 6 e 20 caracteres"
end
