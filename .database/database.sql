-- Apaga o banco de dados.
-- PERIGO! Só use isso em modo de desenvolvimento.
DROP DATABASE IF EXISTS mardechocolate;

-- Cria o banco de dados "novamente".
-- PERIGO! Só use isso em modo de desenvolvimento.
CREATE DATABASE mardechocolate
    -- Seleciona a tabela de caracteres UTF-8 (acentuação).
    CHARACTER SET utf8mb4
    -- Permite buscas case-insensitive (A=a, ç=c, ã=a).
    COLLATE utf8mb4_unicode_ci;

-- Seleciona o banco de dados
-- Todos comandos seguintes sejam para este banco de dados
USE mardechocolate;

-- Cria a tabela da entidade "usuario"
-- Prefixo dos atributos → u_
CREATE TABLE usuario (
    u_id INT PRIMARY KEY AUTO_INCREMENT,
    u_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    u_nome VARCHAR(127) NOT NULL,
    u_nascimento DATE NOT NULL,
    u_email VARCHAR(255) NOT NULL,
    u_senha VARCHAR(63) NOT NULL,
    u_foto VARCHAR(255),
    u_status ENUM ('on', 'off', 'del') DEFAULT 'on'
);

-- Cria a tabela da entidade "produtos"
-- Prefixo dos atributos → t_
CREATE TABLE produtos (
    t_id INT PRIMARY KEY AUTO_INCREMENT,
    t_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    t_foto VARCHAR(255),
    t_usuario INT NOT NULL,
    t_nome VARCHAR(127) NOT NULL,
    t_descricao TEXT,
    t_localizacao VARCHAR(255),
    t_status ENUM ('on', 'off', 'del') DEFAULT 'on',
    FOREIGN KEY (t_usuario) REFERENCES usuario(u_id)
);

-- -------------------------------------- --
-- Insere alguns dados "fake" nas tabelas --
-- -------------------------------------- --

-- Tabela 'usuario'
INSERT INTO usuario (
    u_nome,
    u_nascimento,
    u_email,
    u_senha,
    u_foto
) VALUES (
    'Chocolate Oliveira',
    '1997-07-20',
    'chocolateoliveira@email.com',
    SHA1('Senha123'), -- Criptografa a senha do usuário
    "https://picsum.photos/200"
), (
    'Doce Ferreira',
    '1996-11-17',
    'doceferreira@email.com',
    SHA1('Senha123'),
      "https://picsum.photos/201"
);

-- Tabela 'produtos'
INSERT INTO produtos (
    t_foto,
    t_usuario,
    t_nome,
    t_descricao,
    t_localizacao
) VALUES 
('https://picsum.photos/210', '1', 'Bolo de Chocolate', 'Bolo de chocolate com recheio cremoso e cobertura de ganache', 'São Paulo, SP'),
('https://picsum.photos/211', '2', 'Cupcakes de Baunilha', 'Cupcakes fofinhos de baunilha com frosting de morango', 'Rio de Janeiro, RJ');


-- Inserções da IA (veja o prompt no material da aula 11)
INSERT INTO produtos (t_foto, t_usuario, t_nome, t_descricao, t_localizacao) VALUES
  
('https://picsum.photos/212', '2', 'Bolo de Chocolate', 'Bolo de chocolate com cobertura cremosa e granulado', 'São Paulo, SP'),
('https://picsum.photos/213', '1', 'Bolo Floral', 'Bolo decorado com flores naturais e cobertura de chantilly', 'Rio de Janeiro, RJ'),
('https://picsum.photos/214', '1', 'Docinhos para Festa', 'Variedade de docinhos tradicionais de festa, como brigadeiro e beijinho', 'Belo Horizonte, MG'),
('https://picsum.photos/215', '2', 'Torta de Limão', 'Torta cremosa de limão com base crocante e cobertura de merengue', 'Porto Alegre, RS'),
('https://picsum.photos/216', '2', 'Macaron', 'Macaron colorido recheado com ganache de chocolate belga', 'Curitiba, PR'),
('https://picsum.photos/217', '1', 'Brownie de Chocolate', 'Brownie denso e úmido com pedaços de nozes', 'Salvador, BA'),
('https://picsum.photos/218', '1', 'Pavlova', 'Sobremesa crocante por fora e macia por dentro, com frutas vermelhas', 'Florianópolis, SC'),
('https://picsum.photos/219', '1', 'Bolo Recheado de Morango', 'Bolo de baunilha recheado com morangos frescos e chantilly', 'Recife, PE'),
('https://picsum.photos/220', '2', 'Cheesecake de Framboesa', 'Cheesecake com calda de framboesa e base de biscoito amanteigado', 'Fortaleza, CE'),
('https://picsum.photos/221', '1', 'Pão de Mel', 'Pão de mel coberto com chocolate meio amargo e recheado com doce de leite', 'Campinas, SP');
