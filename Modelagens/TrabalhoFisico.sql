
CREATE TABLE SUPERVIA (
nome varchar(255) PRIMARY KEY,
longitude varchar(255),
latitude varchar(255),
cep char(9),
sigla char(3),
nome_ramal varchar(20),
endereco_rua varchar(255),
endereco_numero int
);

CREATE TABLE MUSEU (
nome_rua varchar(255),
nome varchar(255) PRIMARY KEY,
numero int,
nome_bairro varchar(255)
);

CREATE TABLE TELEFONE_MUSEU (
telefone varchar(12),
nome_museu varchar(255),
PRIMARY KEY(telefone,nome_museu),
FOREIGN KEY(nome_museu) REFERENCES MUSEU (nome)
);

CREATE TABLE TELEFONE_TEATRO (
telefone varchar(12),
nome_teatro varchar(255),
PRIMARY KEY(telefone,nome_teatro)
);

CREATE TABLE ACAD_TER_IDADE (
ponto_referencia varchar(255),
numero int,
local varchar(255) PRIMARY KEY,
nome_bairro varchar(255)
);

CREATE TABLE LINHA (
nome varchar(20) PRIMARY KEY,
num_estacoes int,
extensao varchar(5)
);

CREATE TABLE METRO (
num_elevadores int,
num_roletas_entrada int,
num_roletas_saida int,
sigla char(3),
latitude varchar(255),
longitude varchar(255),
nome varchar(255) PRIMARY KEY
);

CREATE TABLE NOME_RUA_PRAIA (
logradouro varchar(255) PRIMARY KEY
);

CREATE TABLE RAMAL (
nome varchar(20) PRIMARY KEY,
num_estacoes int,
extensao varchar(5)
);

CREATE TABLE BRT (
num int,
rua varchar(255),
latitude varchar(255),
longitude varchar(255),
nome varchar(255) PRIMARY KEY,
nome_linha varchar(20),
nome_bairro varchar(255),
FOREIGN KEY(nome_linha) REFERENCES LINHA (nome)
);

CREATE TABLE BAIRRO (
nome varchar(255) PRIMARY KEY,
longitude varchar(255),
latitude varchar(255)
);

CREATE TABLE ENDERECO (
rua varchar(255),
numero int,
PRIMARY KEY(rua,numero)
);

CREATE TABLE PRAIA (
numero int,
nome varchar(255) PRIMARY KEY,
nome_bairro varchar(255),
FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome)
);

CREATE TABLE praia_esta_em (
logradouro varchar(255),
nome_praia varchar(255),
PRIMARY KEY(logradouro,nome_praia),
FOREIGN KEY(logradouro) REFERENCES NOME_RUA_PRAIA (logradouro),
FOREIGN KEY(nome_praia) REFERENCES PRAIA (nome)
);

CREATE TABLE EST_BIKE_RIO (
codigo varchar(4) PRIMARY KEY,
nome varchar(255),
numero int,
nome_rua varchar(255),
nome_bairro varchar(255),
FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome)
);

CREATE TABLE TEATRO (
nome varchar(255) PRIMARY KEY,
nome_rua varchar(255),
numero int,
nome_bairro varchar(255),
FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome)
);

ALTER TABLE SUPERVIA ADD FOREIGN KEY(nome_ramal) REFERENCES RAMAL (nome);
ALTER TABLE SUPERVIA ADD FOREIGN KEY(endereco_numero) REFERENCES ENDERECO (rua,numero)
;
ALTER TABLE MUSEU ADD FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome);
ALTER TABLE TELEFONE_TEATRO ADD FOREIGN KEY(nome_teatro) REFERENCES TEATRO (nome);
ALTER TABLE ACAD_TER_IDADE ADD FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome);
ALTER TABLE BRT ADD FOREIGN KEY(nome_bairro) REFERENCES BAIRRO (nome);
