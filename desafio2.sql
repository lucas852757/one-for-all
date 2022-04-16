select count(distinct cancoes_id)  as cancoes,
count(distinct artista_id) as artistas ,
count(distinct album_id) as albuns
from SpotifyClone.tabela_cancoes, SpotifyClone.tabela_artista;
