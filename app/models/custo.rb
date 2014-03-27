class Custo < ActiveRecord::Base

  belongs_to :fase
  belongs_to :categoria
  has_many :arquivos, :as => :anexo, :dependent => :destroy

  attr_accessible :valor, :fase_id, :categoria_id, :observacoes



end
