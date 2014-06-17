# coding: UTF-8
module RelatorioHelper

  def custo_total_rel(fase)
    @custo_total = fase.custos.sum('(valor*quantidade)+(valor*quantidade*tributo)/100')
    @custo_excedido = @custo_total.to_i > fase.orcamento.to_i ? true : false
    @valor_excedido = @custo_total.to_i - fase.orcamento.to_i
  end

end