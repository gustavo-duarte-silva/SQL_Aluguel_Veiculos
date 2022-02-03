-- LOCADORA DE VEICULOS

CREATE DATABASE IF NOT EXISTS aluguel_veiculos;
USE aluguel_veiculos;

CREATE TABLE IF NOT EXISTS marcas(
	id_marcas INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(255) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_marcas)
);

CREATE TABLE IF NOT EXISTS inventario(
	id_inventario INT NOT NULL AUTO_INCREMENT,
    id_marcas INT NOT NULL,
    modelo VARCHAR(255) NOT NULL,
    transmissao VARCHAR(255) NOT NULL,
    motor VARCHAR(255) NOT NULL,
    combustivel VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_inventario),
    FOREIGN KEY (id_marcas) REFERENCES marcas(id_marcas)
);

CREATE TABLE IF NOT EXISTS clientes(
	id_clientes INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_clientes)
);

CREATE TABLE IF NOT EXISTS pagamento(
	id_pagamento INT NOT NULL AUTO_INCREMENT,
    id_clientes INT NOT NULL,
    id_inventario INT NOT NULL,
    valor_aluguel FLOAT NOT NULL,
    data_pagamento DATE NOT NULL,
    PRIMARY KEY (id_pagamento),
    FOREIGN KEY (id_clientes) REFERENCES clientes(id_clientes),
    FOREIGN KEY (id_inventario) REFERENCES inventario(id_inventario)
);

INSERT INTO clientes (nome, sobrenome, endereco)
VALUES 
	('ANDRE', 'LUIZ', 'RUA 1'),
	('ALESSANDRA', 'BONFIM', 'RUA 2'),
    ('ANA', 'LUIZA', 'RUA 3'),
    ('ANA', 'CLAUDIA', 'RUA 4'),
    ('LUIZ', 'AUGUSTO', 'RUA 5'),
    ('FLAVIA', 'ARRUDA', 'RUA 6'),
    ('ALINE', 'DUARTE', 'RUA 7'),
    ('GUSTAVO', 'SANTOS', 'RUA 8'),
    ('GIOVANNA', 'LUZ', 'RUA 9'),
    ('MATHEUS', 'FILHO', 'RUA 10');

INSERT INTO marcas (nome_marca, origem)
VALUES ("BMW", "Alemanha"),
		("Fiat", "Italia"),
        ("Mercedes-Benz", "Alemanha"),
        ("Renault", "França"),
        ("Jaguar", "Inglaterra");
        
INSERT INTO inventario (id_marcas, modelo, transmissao, motor, combustivel)
VALUES(1, "BMW 320i", "Automatico", "2.0", "Flex"),
	(2, "UNO", "Manual", "1.0", "Flex"),
    (2, "Argo", "Manual", "1.0", "Flex"),
    (5, "XF", "Automatico", "2.0", "Gasolina"),
    (4, "Clio", "Manual", "1.0", "Flex"),
    (3, "A 200", "Manual", "1.3", "Gasolina");
    
INSERT INTO pagamento(id_clientes, id_inventario, valor_aluguel, data_pagamento)
VALUES (1, 1, 900, "2022-02-03"),
		(3, 2, 300, "2022-02-04"),
        (6, 4, 1000, "2022-02-04"),
        (7, 5, 350, "2022-02-04"),
        (4, 3, 400, "2022-02-05"),
        (8, 6, 800, "2022-02-05"),
        
        (2, 2, 300, "2022-02-06"),
		(5, 3, 400, "2022-02-06"),
        (10, 1, 900, "2022-02-06"),
        (9, 5, 350, "2022-02-07"),
        (4, 6, 800, "2022-02-07"),
        (3, 4, 1000, "2022-02-07"),
        
        (9, 6, 800, "2022-02-08"),
		(4, 2, 300, "2022-02-08"),
        (5, 4, 1000, "2022-02-08"),
        (3, 5, 350, "2022-02-09"),
        (8, 3, 400, "2022-02-09"),
        (7, 6, 800, "2022-02-09"),
        
        (3, 1, 900, "2022-02-10"),
		(2, 2, 300, "2022-02-10"),
        (1, 4, 1000, "2022-02-10"),
        (4, 5, 350, "2022-02-11"),
        (10, 3, 400, "2022-02-11"),
        (5, 6, 800, "2022-02-11"),
        
        (8, 4, 1000, "2022-02-12"),
		(7, 6, 800, "2022-02-13"),
        (6, 5, 350, "2022-02-13"),
        (2, 1, 900, "2022-02-13"),
        (4, 2, 300, "2022-02-13"),
        (3, 3, 400, "2022-02-14"),
        
        (10, 2, 300, "2022-02-14"),
		(1, 6, 800, "2022-02-14"),
        (6, 4, 1000, "2022-02-14"),
        (9, 5, 350, "2022-02-15"),
        (4, 3, 400, "2022-02-15"),
        (5, 1, 900, "2022-02-15");
        

    
    
