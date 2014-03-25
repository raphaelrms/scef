class Custo < ActiveRecord::Base

  belongs_to :fases
  has_one :categoria
  has_many :arquivos, :as => :anexo, :dependent => :destroy

  attr_accessible :valor, :fase_id, :categoria_id



end
