class Noticia < ActiveRecord::Base
  attr_accessible :corpo, :subtitulo, :tags, :titulo
end
