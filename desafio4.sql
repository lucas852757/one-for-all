select us.usuario as usuario, if(max(his.data_reproducao like '2021%'), 'Usuário ativo','Usuário inativo') as condicao_usuario
from SpotifyClone.historico as his
inner join SpotifyClone.tabela_usuario as us on his.usuario_id = us.usuario_id
group by us.usuario_id
order by us.usuario;