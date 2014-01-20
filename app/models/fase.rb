class Fase < ActiveRecord::Base

  belongs_to :curso
  has_and_belongs_to_many :custos

end
