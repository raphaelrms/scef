class Custo < ActiveRecord::Base

  belongs_to :fases
  has_one :categoria

  attr_accessible :valor, :fase_id, :categoria_id

end
