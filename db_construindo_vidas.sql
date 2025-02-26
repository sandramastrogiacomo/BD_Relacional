CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    quantidade INT NOT NULL,
    descricao_produto VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

SELECT * FROM tb_categorias;

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Hidráulica', 'Produtos relacionados a encanamento e água'),
('Elétrica', 'Produtos relacionados a instalações elétricas'),
('Ferramentas', 'Ferramentas manuais e elétricas'),
('Tintas', 'Tintas e acessórios para pintura'),
('Madeiras', 'Madeiras e derivados para construção');

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome_produto, valor, quantidade, descricao_produto, id_categoria) VALUES
('Tubo PVC 100mm', 120.00, 50, 'Tubo para esgoto', 1),
('Fio Elétrico 2,5mm', 80.00, 100, 'Fio para instalações elétricas', 2),
('Martelo', 45.00, 30, 'Martelo de unha', 3),
('Tinta Branca 18L', 150.00, 20, 'Tinta látex para parede', 4),
('Tábua de Pinus 2m', 70.00, 60, 'Tábua para construção', 5),
('Chave de Fenda', 25.00, 40, 'Chave de fenda simples', 3),
('Cano PVC 50mm', 90.00, 70, 'Cano para água', 1),
('Lâmpada LED 9W', 15.00, 200, 'Lâmpada econômica', 2);

SELECT * FROM tb_produtos WHERE valor > 100.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT p.id_produto, p.nome_produto, p.valor, p.quantidade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.id_produto, p.nome_produto, p.valor, p.quantidade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Elétrica';