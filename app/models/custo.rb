class Custo < ActiveRecord::Base

  belongs_to :fase
  belongs_to :categoria

  has_many :arquivos, :as => :anexo, :dependent => :destroy

  validates :fase,:presence => true

  attr_accessible :valor, :fase_id, :categoria_id, :observacoes, :dt_referencia, :quantidade,:descricao, :tributo

  attr_accessor :valor_com_tributacao

  def valor_com_tributacao
    valor_total = self.valor*self.quantidade
    return valor_total + (valor_total*self.tributo)/100 unless self.tributo.nil?
  end

end
