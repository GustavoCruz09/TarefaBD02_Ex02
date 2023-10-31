Create Database TarefaBD02_Ex02
go
Use TarefaBD02_Ex02
go
Create Table Filme (
id_Filme			int				not null,
titulo				varchar(40)		not null,
ano					int				null		check(ano <= 2021),
Primary Key (id_Filme)
)
go
Create Table Estrela (
id_Estrela			int				not null,
nome				varchar(50)		not null
Primary Key	(id_Estrela)
)
go
Create Table Cliente (
num_CadastroCliente	int				not null,
nome				varchar(70)		not null,
logradouro			varchar(150)	not null,
num					int				not null	check(num >= 0),
cep					char(8)			null		check(Len(cep) = 8)
Primary Key (num_CadastroCliente)
)
go
Create Table Filme_Estrela (
id_Filme			int				not null,
id_Estrela			int				not null
Primary Key (id_Filme, id_Estrela)
Foreign Key (id_Filme) references Filme(id_Filme),
Foreign Key (id_Estrela) references Estrela(id_Estrela)
)
go
Create Table DVD (
num_DVD				int				not null,
data_fabricacao		date			not null,
id_Filme			int				not null
Primary Key (num_DVD)
Foreign Key (id_Filme) references Filme(id_Filme)
)
go
Create Table Locacao (
num_DVD				int				not null,
num_CadastroCliente	int				not null,
data_locacao		date			not null	check(data_locacao = getdate()),
data_devolucao		date			not null,
valor				decimal(7, 2)	not null	check(valor >= 0),
Constraint chk_dtDev check(data_devolucao > data_locacao),
Primary Key (num_DVD, num_CadastroCliente, data_locacao),
Foreign Key (num_DVD) references DVD(num_DVD),
Foreign Key (num_CadastroCliente) references Cliente(num_CadastroCliente)
)

Alter Table Estrela
Add Constraint chk_Nome check(len(nome) = 50)

Alter Table Filme
Alter Column titulo				varchar(50)		not null

Insert Into Filme Values
(1001, 'Whiplash', 2015),
(1002, 'Birdman', 2015),
(1003, 'Interestelar', 2014),
(1004, 'A Culpa é das estrelas', 2014),
(1005, 'Alexandre e o Dia Terrível, Horrível, Espantoso e Horroroso', 2014),
(1006, 'Sing', 2016)

Alter Table Estrela
Add nome_estrela	varchar(50) null

Insert Into Estrela Values
(9901, 'Michael Keaton', 'Michael John Douglas'),
(9902, 'Emma Stone', 'Emily Jean Stone'),
(9904, 'Steve Carell', 'Steven John Carell'),
(9905, 'Jennifer Garner', 'Jennifer Anne Garner')
