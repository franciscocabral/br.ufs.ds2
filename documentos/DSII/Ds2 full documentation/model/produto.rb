class Produto < ActiveRecord::Base
  has_many :pedidos, primary_key: "idPedido", foreign_key: "idPedido"
  has_many :comandas, through: :pedidos
  has_many :componentes_produtos, primary_key: "idProduto", foreign_key: "idProduto"
  has_many :items, through: :componentes_produtos

  validates_presence_of :nome, :on => :create, :message => "O campo nome deve ser informado"
  validates_presence_of :valor, :on => :create, :message => "O campo valor deve ser informado"
  validates_presence_of :descricao, :on => :create, :message => "O campo descricao deve ser informado"

  def quantidade
    componentes = self.componentes_produtos

    menor_quantidade = -1;
    componentes.each do |componente|
      if(menor_quantidade == -1)
        menor_quantidade = componente.item.quantidade / componente.quantidade
      else
        quantidade_temporaria = componente.item.quantidade / componente.quantidade
        menor_quantidade = menor_quantidade > quantidade_temporaria ? quantidade_temporaria : menor_quantidade;
      end
    end
    return menor_quantidade > -1 ? menor_quantidade : 0
  end

end
