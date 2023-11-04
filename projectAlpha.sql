CREATE SCHEMA `project_alpha` DEFAULT CHARACTER SET utf8 ;

use project_alpha;

-- -----------------------------------------------------
-- Table Pessoa - adicionado AUTO_INCREMENT
-- -----------------------------------------------------
drop table pessoa;
CREATE TABLE pessoa
( id bigint NOT NULL AUTO_INCREMENT,
nome character varying(100) NOT NULL,
datanascimento date,
cpf character varying(14),
funcionario boolean,
CONSTRAINT pk_pessoa PRIMARY KEY (id));
-- -----------------------------------------------------
-- Table Projeto - adicionado AUTO_INCREMENT
-- -----------------------------------------------------
drop table projeto;
CREATE TABLE projeto (
id bigint NOT NULL AUTO_INCREMENT,
nome VARCHAR(200) NOT NULL,
data_inicio DATE ,
data_previsao_fim DATE ,
data_fim DATE ,
descricao VARCHAR(5000) ,
status VARCHAR(45) ,
orcamento FLOAT ,
risco VARCHAR(45) ,
idgerente bigint NOT NULL,
CONSTRAINT pk_projeto PRIMARY KEY (id),
CONSTRAINT fk_gerente FOREIGN KEY (idgerente)
REFERENCES pessoa (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION);
-- -----------------------------------------------------
-- Table Membros - Adicionado 'idpessoa como PK'
-- -----------------------------------------------------
drop table membros;
CREATE TABLE membros
( idprojeto bigint NOT NULL ,
idpessoa bigint NOT NULL,
CONSTRAINT pk_membros_projeto PRIMARY KEY (idprojeto, idpessoa),
-- alterado 'id_projeto'
CONSTRAINT fk_projeto FOREIGN KEY (idprojeto)
REFERENCES projeto (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION,
--
CONSTRAINT fk_pessoa FOREIGN KEY (idpessoa)
REFERENCES pessoa (id) MATCH SIMPLE
ON UPDATE NO ACTION ON DELETE NO ACTION);

use project_alpha;

select * from pessoa;
INSERT INTO pessoa (nome,datanascimento,cpf, funcionario)
VALUES
    ('Joao','2020-02-02',    '1235622334', true),
    ('Maria','2020-02-03',   '1237562365', false),
    ('Roberto','2020-02-04' ,'1345356223', true),
    ('Estevão','2020-02-05', '1235622547', false),
    ('Rosa','2020-02-06',    '1235622984', true),
    ('José','2020-02-07',    '1235622239', false);

select * from projeto;
INSERT INTO projeto (nome,data_inicio,data_previsao_fim, data_fim, descricao,status,orcamento,risco,idgerente)
VALUES
    ('Projeto 1','2020-02-02', '2020-02-02','2020-02-02', 'alguma descrição', 'EM_ANDAMENTO', 50.0,'BAIXO_RISCO', 33),
    ('Projeto 2','2020-02-03', '2020-02-03','2020-02-03', 'alguma descrição', 'EM_ANDAMENTO', 60.0,'BAIXO_RISCO', 35),
    ('Projeto 3','2020-02-04', '2020-02-04','2020-02-04', 'alguma descrição', 'EM_ANDAMENTO', 70.0,'BAIXO_RISCO', 37);

select * from membros;
INSERT INTO membros (idprojeto,idpessoa)
VALUES
    (11, 33),
    (12, 35),
    (13, 37);