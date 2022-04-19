select art.artista, alb.album, art.artista_id from SpotifyClone.tabela_album as alb
inner join SpotifyClone.tabela_artista as art on art.artista_id = alb.artista_id
inner join ((select seguindo_artista_id, count(*) 
from SpotifyClone.tabela_usuario_id_seguindo_artista_id a group by seguindo_artista_id) as tab)
on tab.artista_id = alb.artista_id ;
 