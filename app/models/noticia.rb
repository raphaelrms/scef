# coding: UTF-8
class Noticia < ActiveRecord::Base
  has_many :noticia_permissoes
  has_many :comentarios
  belongs_to :user
  has_many :roles, :through => :noticia_permissoes
  accepts_nested_attributes_for :noticia_permissoes
  #delegate :roles, :to => :noticia_permissoes
  IDS_PERMISSOES = [1, 2, 3]

  validates :titulo, :presence => true
  validates :corpo, :presence => true
  attr_accessible :titulo, :subtitulo, :tags,:noticia_permissoes_attributes,:corpo,:noticia_permissoes,:role_id
  #before_validation :validar_permissoes

  default_scope order("updated_at desc")

  scope :da_permissao, lambda { |permissao|
    joins(:noticias_permissoes).where(:noticias_permissoes => {:permissao => permissao})
  }

  scope :com_tag, lambda { |pesquisa|
    where("tags LIKE ?", "%#{pesquisa}%")
  }

  def autor
    self.user.name if self.user
  end

  def corpo_resumido
    corpo_texto = ActionView::Base.full_sanitizer.sanitize(corpo)
    #corpo_texto = CGI.unescapeHTML(corpo_texto)
    if corpo_texto.size <= 10
      return corpo_texto.html_safe
    else
      return "#{corpo_texto[0, 10]} [...]".html_safe
    end
  end

  def criar_ou_atualizar_permissao_admin(parametro)
    if parametro.blank?
      noticias_permissoes.administrador.first.destroy if noticias_permissoes.administrador.any?
    else
      noticias_permissoes << NoticiaPermissao.new(:noticias => self, :permissao => PERMISSAO_PROPPI[1]) unless noticias_permissoes.administrador.any?
    end
  end

  def criar_ou_atualizar_permissao_coord(parametro)
    if parametro.blank?
      noticias_permissoes.coordenador.first.destroy if noticias_permissoes.coordenador.any?
    else
      noticias_permissoes << NoticiaPermissao.new(:noticias => self, :permissao => PERMISSAO_COORDENACAO[1]) unless noticias_permissoes.coordenador.any?
    end
  end

  def criar_ou_atualizar_permissao_visit(parametro)
    if parametro.blank?
      noticias_permissoes.visitante.first.destroy if noticias_permissoes.visitante.any?
    else
      noticias_permissoes << NoticiaPermissao.new(:noticias => self, :permissao => PERMISSAO_VISITANTE[1]) unless noticias_permissoes.visitante.any?
    end
  end

  def validar_permissoes
    errors.add(:noticias_permissoes, "VocÃª deve definir quem pode visualizar essa notÃ­cia.") unless noticias_permissoes.any?
  end

  def de_administrador?
    noticias_permissoes.administrador.any?
  end

  def de_coordenacao?
    noticias_permissoes.coordenador.any?
  end

  def de_visitante?
    noticias_permissoes.visitante.any?
  end

  def self.pesquisar_tag(param)
    resp = []
    tags_encontradas = []
    tags_encontradas << param
    noticias = Noticia.com_tag(param).select{ |n| !n.tags.blank? && n.tags.include?(param) }
    if noticias.any?
      noticias.each do |noticia|
        tags = noticia.tags.split(",").select{ |t| t.include? param }
        tags.each{|tag| tags_encontradas << tag}
      end
    end
    tags_encontradas.uniq.each{|tag|resp << {:id => tag, :name => tag}}
    resp
  end

end