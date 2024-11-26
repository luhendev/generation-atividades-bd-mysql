CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

-- Criação de tabelas:
CREATE TABLE tb_pizza (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	sabor VARCHAR(255),
	molho VARCHAR(255),
	tamanho VARCHAR(255),
	extra VARCHAR(255),
	valor DECIMAL NOT NULL,
	categoria_id BIGINT,
	CONSTRAINT fk_categoria_pizza FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

CREATE TABLE tb_categoria (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255)
);

-- Inserção de dados:
INSERT INTO tb_pizza (sabor, molho, tamanho, extra, valor, categoria_id)
VALUES	("Portuguesa", "Molho de Tomate", "Família", "Borda recheada", 50.00, 1),
		("Calabresa", "Molho de Tomate", "Grande", "Acebolado", 30.00, 1),
        ("Mussarela", "Molho de Tomate", "Média", "Queijo Parmesão", 45.00, 1),
        ("Pepperoni", "Molho de Tomate", "Pequena", "Borda recheada", 35.00, 5),
        ("Frango com Catupiry", "Molho Branco", "Família", "Borda recheada", 55.00, 1),
        ("Vegetariana", "Molho Pesto", "Média", "Borda recheada", 43.00, 2),
		("Bacon", "Molho de Tomate", "Família", "Borda recheada", 110.00, 5),
        ("Chocolate", "Chocolate Branco", "Pequena", "Borda doce recheada", 60.00, 3);

INSERT INTO tb_categoria (nome, descricao)
VALUES  
    ("Tradicional", "Pizza mais pedida da pizzaria."),
    ("Vegetariana", "Pizza sem carne, feita com legumes frescos."),
    ("Doces", "Pizzas feitas com ingredientes doces, geralmente servidas como sobremesa."),
    ("Gourmet", "Pizzas com combinações sofisticadas e ingredientes exclusivos."),
    ("Regional", "Pizzas que representam a culinária típica de diversas regiões.");
        
-- Visualizar tabela:
SELECT * FROM tb_pizza;
SELECT * FROM tb_categoria;
        
-- Consulta:
SELECT * FROM tb_pizza WHERE valor > 45.00;
SELECT * FROM tb_pizza WHERE valor BETWEEN 50 AND 100;
SELECT * FROM tb_pizza WHERE sabor LIKE "%M%";

-- INNER JOIN
SELECT * FROM tb_pizza INNER JOIN tb_categoria
ON tb_pizza.categoria_id = tb_categoria.id;

SELECT * FROM tb_pizza INNER JOIN tb_categoria
ON tb_pizza.categoria_id = tb_categoria.id WHERE tb_categoria.nome = "Doces";