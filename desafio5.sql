select can.cancoes as cancao, count(*) as reproducoes from SpotifyClone.historico as his
inner join SpotifyClone.tabela_cancoes as can on can.cancoes_id = his.cancoes_id
group by can.cancoes_id 
having `reproducoes` >= 2 order by cancao limit 2;



