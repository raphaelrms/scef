class ChangeOrcamentoOnFase < ActiveRecord::Migration
    def up
      change_table :fases do |t|
        t.change :orcamento, :integer
      end
    end

    def down
      change_table :fases do |t|
        t.change :orcamento, :float
      end
    end
end
