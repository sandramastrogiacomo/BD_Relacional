CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255)
);

SELECT * FROM tb_categorias;

CREATE TABLE tb_produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    valor_produto DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    data_validade DATE,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Bovinos', 'Cortes de carne bovina'),
('Suínos', 'Cortes de carne suína'),
('Aves', 'Cortes de frango e outras aves'),
('Embutidos', 'Produtos embutidos como linguiças, salame, mortadela e salsichas'),
('Outros', 'Outros tipos de produtos');

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome_produto, valor_produto, quantidade_estoque, data_validade, id_categoria) VALUES
('Picanha', 120.00, 50, '2023-12-01', 1),
('Costela Suína', 80.00, 30, '2023-11-15', 2),
('Peito de Frango', 25.00, 100, '2023-10-20', 3),
('Linguiça Toscana', 40.00, 60, '2023-11-10', 4),
('Alcatra', 90.00, 40, '2023-12-05', 1),
('Coxão Mole', 70.00, 35, '2023-11-25', 1),
('Asa de Frango', 30.00, 80, '2023-10-30', 3),
('Bacon', 55.00, 50, '2023-11-20', 2);

SELECT * FROM tb_produtos WHERE valor_produto > 50.00;

SELECT * FROM tb_produtos WHERE valor_produto BETWEEN 50.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.id_produto, p.nome_produto, p.valor_produto, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.id_produto, p.nome_produto, p.valor_produto, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Bovinos';
