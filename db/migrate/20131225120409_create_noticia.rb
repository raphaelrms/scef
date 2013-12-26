#encoding: utf-8
class CreateNoticia < ActiveRecord::Migration
  def change
    create_table :noticias do |t|
      t.string :titulo
      t.string :subtitulo
      t.string :tags
      t.binary :corpo
      t.timestamps
    end
  end
end
