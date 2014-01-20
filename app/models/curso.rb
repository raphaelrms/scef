class Curso < ActiveRecord::Base

  has_many :editals
  has_many :fases

end
