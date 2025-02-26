CREATE DATABASE db_generation_game_online;

USE  db_generation_game_online;

CREATE TABLE tb_classes (
    id_classe INT PRIMARY KEY AUTO_INCREMENT,
    nome_classe VARCHAR(255) NOT NULL,
    descricao_classe VARCHAR(255)
);

CREATE TABLE tb_personagens (
    id_personagem INT PRIMARY KEY AUTO_INCREMENT,
    nome_personagem VARCHAR(255) NOT NULL,
    nivel INT NOT NULL,
    poder_ataque INT NOT NULL,
    poder_defesa INT NOT NULL,
    id_classe INT,
    FOREIGN KEY (id_classe) REFERENCES tb_classes(id_classe)
);

INSERT INTO tb_classes (nome_classe, descricao_classe) VALUES
('Guerreiro', 'Especialista em combate corpo a corpo'),
('Mago', 'Especialista em magias de longa distância'),
('Arqueiro', 'Especialista em ataques à distância com arco e flecha'),
('Ladino', 'Especialista em furtividade e ataques rápidos'),
('Clerigo', 'Especialista em cura e suporte');

SELECT * FROM tb_classes;

INSERT INTO tb_personagens (nome_personagem, nivel, poder_ataque, poder_defesa, id_classe) VALUES
('Aragorn', 30, 2500, 1500, 1),
('Gandalf', 35, 1800, 2200, 2),
('Legolas', 32, 2200, 1300, 3),
('Frodo', 28, 1500, 1000, 4),
('Galadriel', 34, 2100, 1900, 5),
('Boromir', 31, 2300, 1600, 1),
('Saruman', 36, 1900, 2100, 2),
('Gimli', 29, 2400, 1400, 1);

SELECT * FROM tb_personagens;

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome_personagem LIKE '%C%';

SELECT p.*, c.nome_classe, c.descricao_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe;

SELECT p.*, c.nome_classe, c.descricao_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.id_classe = c.id_classe
WHERE c.nome_classe = 'Arqueiro';


