CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(255) NOT NULL,
    descricao_categoria VARCHAR(255)
);

CREATE TABLE tb_cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(255) NOT NULL,
    descricao_curso VARCHAR(255),
    valor_curso DECIMAL(10, 2) NOT NULL,
    duracao_curso INT,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id_categoria)
);

SELECT * FROM tb_categorias;

INSERT INTO tb_categorias (nome_categoria, descricao_categoria) VALUES
('Programação', 'Cursos de linguagens de programação e desenvolvimento de software'),
('Design', 'Cursos de design gráfico e UX/UI'),
('Marketing', 'Cursos de marketing digital e estratégias de vendas'),
('Negócios', 'Cursos de gestão e empreendedorismo'),
('Idiomas', 'Cursos de línguas estrangeiras');

SELECT * FROM tb_cursos;

INSERT INTO tb_cursos (nome_curso, descricao_curso, valor_curso, duracao_curso, id_categoria) VALUES
('Curso de Java', 'Aprenda Java do básico ao avançado', 750.00, 60, 1),
('Curso de Python', 'Python para iniciantes e intermediários', 600.00, 50, 1),
('Curso de Design Gráfico', 'Design gráfico com Adobe Photoshop', 450.00, 40, 2),
('Curso de Marketing Digital', 'Estratégias de marketing digital', 800.00, 55, 3),
('Curso de Gestão de Projetos', 'Gestão de projetos com Agile e Scrum', 900.00, 60, 4),
('Curso de Inglês', 'Inglês para negócios e viagens', 300.00, 30, 5),
('Curso de JavaScript', 'JavaScript moderno e frameworks', 700.00, 45, 1),
('Curso de UX/UI Design', 'Design de interfaces e experiência do usuário', 650.00, 50, 2);

SELECT * FROM tb_cursos WHERE valor_curso > 500.00;

SELECT * FROM tb_cursos WHERE valor_curso BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome_curso LIKE '%J%';

SELECT c.id_curso, c.nome_curso, c.descricao_curso, c.valor_curso, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria;

SELECT c.id_curso,  c.nome_curso, c.descricao_curso, c.valor_curso, cat.nome_categoria
FROM tb_cursos c
INNER JOIN tb_categorias cat ON c.id_categoria = cat.id_categoria
WHERE cat.nome_categoria = 'Programação';