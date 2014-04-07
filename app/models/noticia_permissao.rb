class NoticiaPermissao < ActiveRecord::Base

  belongs_to :noticia
  belongs_to :role
  accepts_nested_attributes_for :role
  #validates :noticias, :presence => true
  #validates :permissao, :presence => true, :inclusion => {:in => Noticia::IDS_PERMISSOES}

  attr_accessible :role_id
  scope :administrador, lambda {
    where(:permissao => Noticia::PERMISSAO_PROPPI[1])
  }

  scope :coordenador, lambda {
    where(:permissao => Noticia::PERMISSAO_COORDENACAO[1])
  }

  scope :visitante, lambda {
    where(:permissao => Noticia::PERMISSAO_VISITANTE[1])
  }


end