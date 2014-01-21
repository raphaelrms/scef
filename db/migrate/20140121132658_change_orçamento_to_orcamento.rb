class ChangeOrçamentoToOrcamento < ActiveRecord::Migration
  def change
    rename_column :fases, :orçamento, :orcamento
  end
end
