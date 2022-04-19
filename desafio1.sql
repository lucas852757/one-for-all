drop database IF EXISTS SpotifyClone;
create database SpotifyClone;

create table SpotifyClone.tabela_plano(
plano_id int primary key auto_increment,
plano varchar(50) not null,
valor_plano decimal(3, 2)
) engine = InnoDB;

insert into SpotifyClone.tabela_plano (plano, valor_plano)
values
('gratuito', 0),
('familiar',	7.99),
('universitário', 5.99),
('pessoal', 6.99);

create table SpotifyClone.tabela_usuario(
usuario_id int primary key auto_increment,
usuario varchar(75) not null,
idade int not null,
plano_id int not null,
foreign key (plano_id) references SpotifyClone.tabela_plano(plano_id)
) engine = InnoDB;

insert into SpotifyClone.tabela_usuario(usuario, idade, plano_id)
values
('Thati', '23', '1'),
    ('Cintia', '35', '2'),
    ('Bill', '20', '3'),
    ('Roger', '45', '4'),
    ('Norman', '58', '4'),
    ('Patrick', '33', '2'),
    ('Vivian', '26', '3'),
    ('Carol', '19', '3'),
    ('Angelina', '42', '2'),
    ('Paul', '46', '2');

create table SpotifyClone.tabela_artista(
artista_id int primary key auto_increment,
artista varchar(50)
) engine = InnoDB;

insert into SpotifyClone.tabela_artista(artista)
values
('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon'),
    ('Tyler Isle'),
    ('Fog');

create table SpotifyClone.tabela_album(
album_id int primary key auto_increment,
artista_id int not null,
album varchar(50),
ano_lancamento year,
foreign key (artista_id) references SpotifyClone.tabela_artista (artista_id)
) engine = InnoDB;

insert into SpotifyClone.tabela_album(artista_id, album, ano_lancamento)
values
(1,'Envious', '1990'),
    (1,'Exuberant', '1993'),
    (2,'Hallowed Steam', '1995'),
    (3,'Incandescent', '1998'),
    (4,'Temporary Culture', '2001'),
    (4,'Library of liberty', '2003'),
    (5,'Chained Down', '2007'),
    (5,'Cabinet of fools', '2012'),
    (5,'No guarantees', '2015'),
    (6,'Apparatus', '2015');




create table SpotifyClone.tabela_cancoes(
cancoes_id int primary key auto_increment,
cancoes varchar(50),
album_id int not null,
foreign key (album_id) references SpotifyClone.tabela_album (album_id),
duracao_segundos int not null
) engine = InnoDB;

insert into SpotifyClone.tabela_cancoes(cancoes, album_id, duracao_segundos)
values
( 'Soul For Us', '1', '200'),
    ( 'Reflections Of Magic ', '1', '163'),
    ( 'Dance With Her Own', '1', '116'),
    ( 'Troubles Of My Inner Fire', '2', '203'),
    ( 'Time Fireworks', '2', '152'),
    ( 'Magic Circus', '3', '105'),
    ( 'Honey, So Do I', '3', '207'),
    ( 'Sweetie, Let"s Go Wild', '3', '139'),
    ( 'She Knows', '3', '244'),
    ( 'Fantasy For Me', '4', '100'),
    ( 'Celebration Of More', '4', '146'),
    ( 'Rock His Everything', '4', '223'),
    ( 'Home Forever', '4', '231'),
    ( 'Diamond Power', '4', '241'),
    ( 'Let"s Be Silly', '4', '132'),
    ( 'Thang Of Thunder ', '5', '240'),
    ( 'Words Of Her Life', '5', '185'),
    ( 'Without My Streets', '5', '176'),
    ( 'Need Of The Evening', '6', '190'),
    ( 'History Of My Roses', '6', '222'),
    ( 'Without My Love', '6', '111'),
    ( 'Walking And Game', '6', '123'),
    ( 'Young And Father', '6', '197'),
    ( 'Finding My Traditions', '7', '179'),
    ( 'Walking And Man', '7', '229'),
    ( 'Hard And Time', '7', '135'),
    ( 'Honey, Im A Lone Wolf', '7', '150'),
    ( 'She Thinks I Won"t Stay Tonight', '8', '166'),
    ( 'He Heard You"re Bad For Me ', '8', '154'),
    ( 'He Hopes We Can"t Stay', '8', '210'),
    ( 'I Know I Know', '8', '117'),
    ( 'He"s Walking Away', '9', '159'),
    ( 'He"s Trouble', '9', '138'),
    ( 'I Heard I Want To Bo Alone', '9', '120'),
    ( 'I Ride Alone', '9', '151'),
    ( 'Honey', '10', '79'),
    ( 'You Cheated On Me', '10', '95'),
    ( 'Wouldn"t It Be Nice', '10', '213'),
    ( 'Baby', '10', '136'),
    ( 'You Make Me Feel So..', '10', '83');

create table SpotifyClone.tabela_usuario_id_seguindo_artista_id(
usuario_id int not null,
seguindo_artista_id int not null,
constraint primary key (usuario_id, seguindo_artista_id),
foreign key (usuario_id) references SpotifyClone.tabela_usuario (usuario_id),
foreign key (seguindo_artista_id) references SpotifyClone.tabela_artista (artista_id)
) engine = InnoDB;

insert into SpotifyClone.tabela_usuario_id_seguindo_artista_id(usuario_id, seguindo_artista_id)
values
(1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 3),
    (6, 1),
    (7, 2),
    (7, 5),
    (8, 1),
    (8, 5),
    (9, 6),
    (9, 4),
    (9, 3),
    (10, 2),
    (10, 6);

create table SpotifyClone.historico(
cancoes_id int not null,
data_reproducao datetime,
usuario_id int not null,
constraint primary key (cancoes_id, usuario_id),
foreign key (usuario_id) references SpotifyClone.tabela_usuario(usuario_id),
foreign key (cancoes_id) references SpotifyClone.tabela_cancoes(cancoes_id)
) engine = InnoDB;
    
insert into SpotifyClone.historico(cancoes_id, data_reproducao, usuario_id)
values
(1, '2020-11-10 13:52:27', 5),
    (2, '2021-08-15 17:10:10', 4),
    (3, '2020-12-05 18:38:30', 3),
    (4, '2020-07-27 12:52:58', 7),
    (5, '2018-05-09 22:30:49', 7),
    (6, '2020-11-13 16:55:13', 3),
    (7, '2020-07-03 19:33:28', 5),
    (8, '2021-03-14 06:14:26', 9),
    (9, '2020-04-01 03:36:00', 9),
    (11, '2018-01-16 18:40:43', 7),
    (12, '2017-02-24 21:14:22', 5),
    (12, '2017-07-27 05:24:49', 10),
    (13, '2017-12-25 01:03:57', 10),
    (14, '2020-08-05 08:05:17', 1),
    (14, '2020-08-06 15:23:43', 5),
    (15, '2020-09-14 16:32:22', 1),
    (16, '2021-05-24 17:23:45', 9),
    (17, '2018-12-07 22:48:52', 9),
    (20, '2017-02-06 08:21:34', 10),
    (21, '2020-10-09 12:27:48', 2),
    (21, '2017-12-04 05:33:43', 10),
    (22, '2018-05-29 14:56:41', 6),
    (23, '2020-03-06 11:22:33', 1),
    (24, '2020-05-16 06:16:22', 2),
    (25, '2020-05-02 05:30:35', 1),
    (26, '2020-07-30 10:00:00', 3),
    (27, '2021-01-09 01:44:33', 4),
    (29, '2017-01-24 00:31:17', 6),
    (30, '2017-10-12 12:35:20', 6),
    (32, '2019-05-25 08:14:03', 8),
    (33, '2021-08-15 21:37:09', 8),
    (34, '2020-01-02 07:40:33', 2),
    (35, '2021-07-10 15:20:30', 4),
    (36, '2020-02-28 10:45:55', 1),
    (38, '2019-02-07 20:33:48', 6),
    (39, '2020-09-21 13:14:46', 2),
    (39, '2018-03-21 16:56:40', 8),
    (40, '2020-10-18 13:38:05', 8);


