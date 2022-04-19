select art.artista, alb.album from SpotifyClone.tabela_album as alb
inner join SpotifyClone.tabela_artista as art on art.artista_id = alb.artista_id order by alb.album limit 2 offset 3 ;