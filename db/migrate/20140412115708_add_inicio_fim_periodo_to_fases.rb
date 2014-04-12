class AddInicioFimPeriodoToFases < ActiveRecord::Migration
  def change
    add_column :fases, :inicio_periodo, :date
    add_column :fases, :fim_periodo, :date
  end
end
