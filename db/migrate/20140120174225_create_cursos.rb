class CreateCursos < ActiveRecord::Migration
  def change
    create_table :cursos do |t|
      t.string :nome
      t.string :descricao
      t.string :ano
      t.timestamps
    end
  end
end
