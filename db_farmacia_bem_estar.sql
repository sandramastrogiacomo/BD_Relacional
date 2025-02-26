CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias (
    id_categoria BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto BIGINT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    data_validade DATE,
    id_categoria BIGINT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Medicamentos', 'Produtos para tratamento de doenças'),
('Cosméticos', 'Produtos de beleza e cuidados pessoais'),
('Higiene', 'Produtos de higiene pessoal'),
('Vitaminas', 'Suplementos vitamínicos e minerais'),
('Infantil', 'Produtos para bebês e crianças');

SELECT * FROM tb_categorias;

INSERT INTO tb_produtos (nome_produto, preco, quantidade, data_validade, id_categoria) VALUES
('Paracetamol 500mg', 15.90, 100, '2024-12-31', 1),
('Shampoo Anticaspa', 25.50, 50, '2025-06-30', 2),
('Creme Dental', 7.80, 200, '2024-10-15', 3),
('Vitamina C 1000mg', 45.00, 80, '2024-08-20', 4),
('Fralda Pampers', 60.00, 120, '2025-05-01', 5),
('Protetor Solar FPS 50', 55.00, 60, '2024-07-25', 2),
('Sabonete Líquido', 12.00, 150, '2024-09-10', 3),
('Ibuprofeno 400mg', 18.50, 90, '2024-11-30', 1);

SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos WHERE preco > 50.00;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.id_produto, p.nome_produto, p.preco, p.quantidade, p.data_validade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.id_produto, p.nome_produto, p.preco, p.quantidade, p.data_validade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Higiene';

