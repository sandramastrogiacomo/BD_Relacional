CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_pizzas (
    id_pizza INT PRIMARY KEY AUTO_INCREMENT,
    nome_pizza VARCHAR(255) NOT NULL,
    ingredientes TEXT,
    valor DECIMAL(10, 2) NOT NULL,
    tamanho VARCHAR(255),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Salgada', 'Pizzas com sabores salgados'),
('Doce', 'Pizzas com sabores doces'),
('Vegetariana', 'Pizzas sem carne'),
('Especial', 'Pizzas com ingredientes especiais'),
('Vegana', 'Pizzas sem nenhum ingrediente de origem animal');

SELECT * FROM tb_categorias;

INSERT INTO tb_pizzas (nome_pizza, ingredientes, valor, tamanho, id_categoria) VALUES
('Calabresa', 'Calabresa, cebola, mussarela', 45.00, 'Grande - 8 pedaços', 1),
('Marguerita', 'Mussarela, tomate, manjericão', 30.00, 'Broto - 4 pedaços', 1),
('Quatro Queijos', 'Mussarela, parmesão, gorgonzola, catupiry', 75.00, 'Grande - 8 pedaços', 1),
('Chocolate', 'Chocolate, morango', 60.00, 'Broto - 4 pedaços', 2),
('Banana com Canela', 'Banana, canela, açúcar', 40.00, 'Broto - 4 pedaços', 2),
('Vegetariana', 'Tomate, pimentão, cebola, azeitona', 65.00, 'Grande - 8 pedaços', 3),
('Frango com Catupiry', 'Frango, catupiry, milho', 55.00, 'Grande - 8 pedaços', 1),
('Portuguesa', 'Presunto, mussarela, ovo, cebola, azeitona', 70.00, 'Grande - 8 pedaços', 1);

SELECT * FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE valor > 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome_pizza LIKE '%M%';

SELECT p.*, c.nome_categoria 
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria;

SELECT p.*, c.nome_categoria 
FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Vegetariana';

