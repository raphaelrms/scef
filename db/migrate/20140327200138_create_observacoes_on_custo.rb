class CreateObservacoesOnCusto < ActiveRecord::Migration
  def change
    add_column :custos, :observacoes, :string
  end
end
