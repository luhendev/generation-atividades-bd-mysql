CREATE DATABASE db_generation_game_online;

use db_generation_game_online;

-- Criação de tabelas:
CREATE TABLE tb_personagens (
	id BIGINT AUTO_INCREMENT PRIMARY KEY, 
	nome VARCHAR(255) NOT NULL,
	nivel INT NOT NULL,
	ataque BIGINT,
	defesa BIGINT,
	hp BIGINT,
	ouro DECIMAL NOT NULL
);

CREATE TABLE tb_classes (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	descricao VARCHAR(255) NOT NULL
);

-- Inserção de dados:
INSERT INTO tb_personagens (nome, nivel, ataque, defesa, hp, ouro)
VALUES	("Oharad", 95, 8, 12, 27, 45.780),
		("Nughis", 102, 6, 15, 21, 60.450),
		("Ewaelle", 97, 7, 11, 30, 48.900),
		("Bolthorn", 110, 9, 14, 24, 55.340),
		("Adric", 101, 10, 13, 20, 47.760),
		("Trifoth", 98, 5, 16, 28, 52.300),
		("Porthios", 105, 12, 10, 25, 58.940),
		("Skaldr", 100, 7, 14, 22, 50.620);

INSERT INTO tb_classes (descricao)
VALUES	("Cavalheiro"),
		("Mago"),
		("Arqueiro"),
		("Druída"),
		("Necromante");

-- Visualizar tabela:
	SELECT * FROM tb_personagens;
	SELECT * FROM tb_classes;

-- Alterar tabela:
ALTER TABLE tb_personagens ADD classeid BIGINT;

ALTER TABLE tb_personagens
ADD CONSTRAINT fk_tb_personagens
FOREIGN KEY (classeid)
REFERENCES tb_classes (id);

ALTER TABLE tb_personagens CHANGE ouro ouro DECIMAL(10,3);

DESCRIBE tb_personagens;

-- Atualizar dados:
UPDATE tb_personagens SET ataque = 3000 WHERE id = 4;
UPDATE tb_personagens SET ataque = 4000 WHERE id = 7;
UPDATE tb_personagens SET defesa = 1500 WHERE id = 7;
UPDATE tb_personagens SET defesa = 1900 WHERE id = 2;

UPDATE tb_personagens SET classeid = 1 WHERE id = 1;
UPDATE tb_personagens SET classeid = 2 WHERE id = 2;
UPDATE tb_personagens SET classeid = 3 WHERE id = 3;
UPDATE tb_personagens SET classeid = 2 WHERE id = 4;
UPDATE tb_personagens SET classeid = 4 WHERE id = 5;
UPDATE tb_personagens SET classeid = 1 WHERE id = 6;
UPDATE tb_personagens SET classeid = 3 WHERE id = 7;
UPDATE tb_personagens SET classeid = 5 WHERE id = 8;

-- Consulta:
SELECT * FROM tb_personagens WHERE ataque > 2000;
SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

-- INNER JOIN
SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classeid = tb_classes.id;

SELECT * FROM tb_personagens INNER JOIN tb_classes
ON tb_personagens.classeid = tb_classes.id WHERE tb_classes.id = 3;