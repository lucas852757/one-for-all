select art.artista, alb.album, art.artista_id from SpotifyClone.tabela_album as alb
inner join SpotifyClone.tabela_artista as art on art.artista_id = alb.artista_id;

select usa.seguindo_artista_id, alb.album ,count(*) 
from SpotifyClone.tabela_usuario_id_seguindo_artista_id as usa
inner join SpotifyClone.tabela_album as alb on alb.artista_id = usa.seguindo_artista_id
group by usa.seguindo_artista_id, alb.album ;
 