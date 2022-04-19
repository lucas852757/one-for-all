select  count(*) as quantidade_musicas_no_historico from SpotifyClone.historico group by usuario_id
having usuario_id = 3 ;