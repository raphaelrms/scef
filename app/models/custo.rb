class Custo < ActiveRecord::Base

  has_and_belongs_to_many :fases
  has_one :categoria

end
