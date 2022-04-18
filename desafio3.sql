select us.usuario as usuario, count(us.usuario_id) as qtde_musicas_ouvidas, round(sum(can.duracao_segundos)/60,2) as total_minutos from SpotifyClone.tabela_cancoes as can
join SpotifyClone.historico as his on can.cancoes_id = his.cancoes_id
join SpotifyClone.tabela_usuario as us on his.usuario_id = us.usuario_id
group by his.usuario_id
order by us.usuario;
