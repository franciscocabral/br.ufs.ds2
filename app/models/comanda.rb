class Comanda < ActiveRecord::Base
  validates_presence_of :idFuncionario, :on => :create, :message => "O campo funcionario não pode ser vazio"
  validates_presence_of :mesa, :on => :create, :message => "O campo mesa não pode ser vazio"
  validates_presence_of :dataAbertura, :on => :create, :message => "A data de abertura da comanda deve ser informada"
  validates_presence_of :dataEncerramento, :on => :create, :message => "A data de encerramento deve ser informada"
  validates_presence_of :valorFinal, :on => :create, :message => "O valor final deve ser informado"

end
