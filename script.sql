CREATE DATABASE IF NOT EXISTS petcare
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE petcare;

CREATE TABLE IF NOT EXISTS tutor (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    PRIMARY KEY (id)
    UNIQUE KEY uk_tutor_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS pet (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(100) NOT NULL,
    raca VARCHAR(100) NOT NULL,
    data_nasc DATE NOT NULL,
    peso_kg DECIMAL(5, 2) NOT NULL,
    tutor_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_pet_tutor
        FOREIGN KEY (tutor_id) REFERENCES tutor (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS usuario (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_usuario_email (email)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS token (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    usuario_id INT UNSIGNED NOT NULL,
    token VARCHAR(255) NOT NULL,
    expira_em DATETIME NOT NULL,
    PRIMARY KEY (id),
    UNIQUE KEY uk_token_valor (token),
    CONSTRAINT fk_token_usuario
        FOREIGN KEY (usuario_id) REFERENCES usuario (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT IGNORE INTO usuario (id, nome, email, senha_hash) VALUES
    (1, 'Professor Avaliador', 'professor@petcare.com', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi');

INSERT IGNORE INTO tutor (nome, email) VALUES
    ('Maria Silva', 'maria.silva@exemplo.com'),
    ('Renata Borges', 'renata.borges@exemplo.com'),
    ('Raul Seixas', 'raul.seixas@exemplo.com'),
    ('Isaque Oliveira', 'isaque.oliveira@exemplo.com'),
    ('João Santos', 'joao.santos@exemplo.com');

INSERT IGNORE INTO pet (id, nome, especie, raca, data_nasc, peso_kg, tutor_id) VALUES
    (1, 'Thor', 'Cachorro', 'Golden Retriever', '2021-05-14', 32.50, 1),
    (2, 'Luna', 'Gato', 'Siamês', '2022-08-20', 4.20, 1),
    (3, 'Bob', 'Cachorro', 'Bulldog Francês', '2020-11-03', 12.80, 1),
    (4, 'Mia', 'Gato', 'Persa', '2023-01-15', 3.90, 2),
    (5, 'Rex', 'Cachorro', 'Pastor Alemão', '2019-07-22', 36.00, 2),
    (6, 'Mel', 'Cachorro', 'Poodle', '2022-03-10', 6.50, 3),
    (7, 'Nina', 'Gato', 'SRD (Vira-lata)', '2023-06-01', 3.40, 3),
    (8, 'Max', 'Cachorro', 'Beagle', '2021-09-18', 11.20, 4),
    (9, 'Lola', 'Cachorro', 'Shih Tzu', '2022-12-05', 5.80, 5),
    (10, 'Simba', 'Gato', 'Maine Coon', '2020-04-30', 8.75, 5);
