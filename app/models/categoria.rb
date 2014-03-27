class Categoria < ActiveRecord::Base

  has_many :custos


  attr_accessible :descricao

end
