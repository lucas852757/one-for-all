select min(valor_plano) 
as faturamento_minimo, 
max(valor_plano) 
as faturamento_maximo, 
round(avg(valor_plano),2) 
as faturamento_medio,
sum(valor_plano) as faturamento_total
from SpotifyClone.tabela_plano as pla
inner join SpotifyClone.tabela_usuario as us on us.plano_id = pla.plano_id