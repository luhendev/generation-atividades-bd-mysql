CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

-- Criação de tabelas:
CREATE TABLE tb_produto (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    validade DATE,
    estoque BIGINT,
    valor DECIMAL(10, 2) NOT NULL,
    categoria_id BIGINT,
    CONSTRAINT fk_categoria_produto FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

CREATE TABLE tb_categoria (
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	descricao VARCHAR(255)
);

-- Inserção de dados:
INSERT INTO tb_produto (nome, validade, estoque, valor, categoria_id)
VALUES	("Dipirona", "2024-05-31", 100, 19.00, 1),
		("Ibuprofeno", "2024-07-31", 150, 22.00, 1),
		("Paracetamol", "2024-12-31", 200, 18.50, 1),
		("Amoxicilina", "2025-01-15", 80, 35.00, 1),
		("Cetirizina", "2024-08-15", 120, 28.00, 1),
		("Vitaminas C", "2025-05-01", 300, 45.00, 2),
		("Whey Protein", "2025-12-01", 200, 150.00, 2),
		("Ômega 3", "2025-03-01", 250, 90.00, 2),
		("Creatina", "2025-10-01", 180, 75.00, 2),
		("Shampoo Anticaspa", "2024-11-30", 200, 35.00, 3),
		("Creme Hidratante", "2025-02-28", 150, 50.00, 3),
		("Protetor Solar", "2024-06-15", 100, 60.00, 3),
		("Desodorante Roll-On", "2025-03-10", 220, 20.00, 3),
		("Sabonete Líquido", "2025-01-01", 500, 8.00, 4),
		("Detergente", "2024-10-15", 400, 5.50, 4),
		("Desinfetante", "2025-06-30", 300, 12.00, 4),
		("Álcool Gel", "2024-12-31", 350, 15.00, 4),
		("Termômetro Digital", "2025-07-01", 50, 45.00, 5),
		("Suporte Ortopédico", "2025-05-20", 75, 80.00, 5),
		("Óleo Essencial de Lavanda", "2025-12-10", 100, 35.00, 5),
		("Máscara de Proteção", "2024-11-01", 500, 3.00, 5);

INSERT INTO tb_categoria (nome, descricao)
VALUES  
    ("Medicamento", "Produtos utilizados no tratamento de doenças e condições de saúde, como analgésicos, antibióticos e anti-inflamatórios."),
    ("Suplemento Alimentar", "Produtos que complementam a alimentação, fornecendo nutrientes como vitaminas, minerais e proteínas."),
    ("Cosmético Pessoal", "Produtos de cuidados com a pele, cabelo, corpo e higiene pessoal, como shampoos, cremes e desodorantes."),
    ("Higiene", "Produtos relacionados à higiene pessoal e limpeza doméstica, como sabonetes, desinfetantes e detergentes."),
    ("Saúde", "Produtos voltados para o bem-estar e saúde geral, como termômetros, suportes ortopédicos e óleos essenciais.");
        
-- Visualizar tabela:
SELECT * FROM tb_produto;
SELECT * FROM tb_categoria;
        
-- Consulta:
SELECT * FROM tb_produto WHERE valor > 50.00;
SELECT * FROM tb_produto WHERE valor BETWEEN 5 AND 60;
SELECT * FROM tb_produto WHERE nome LIKE "%C%";

-- INNER JOIN
SELECT * FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id;