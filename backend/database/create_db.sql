-- Tabela Aluno

CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    objetivo_prova VARCHAR(100),
    data_cadastro DATE NOT NULL
);

-- Tabela Disciplina

CREATE TABLE disciplina (
    id_disciplina INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- Tabela Professor

CREATE TABLE professor (
    id_professor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    descricao TEXT,
    valor_hora DECIMAL(10,2),
    avaliacao_media DECIMAL(3,2),
    data_cadastro DATE
);

-- Tabela Plano Estudo

CREATE TABLE plano_estudo (
    id_plano INTEGER PRIMARY KEY AUTOINCREMENT,
    data_criacao DATE,
    carga_horaria_semanal INTEGER,
    status VARCHAR(30),
    id_aluno INTEGER UNIQUE,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno)
);

-- Tabela Diagnostico

CREATE TABLE diagnostico (
    id_diagnostico INTEGER PRIMARY KEY AUTOINCREMENT,
    data_realizacao DATE,
    pontuacao_total DECIMAL(5,2),
    percentual_acertos DECIMAL(5,2),
    id_aluno INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno)
);

-- Relação N:N / Diagnostico x Disciplina

CREATE TABLE diagnostico_disciplina (
    id_diagnostico INTEGER,
    id_disciplina INTEGER,

    PRIMARY KEY (
        id_diagnostico,
        id_disciplina
    ),

    FOREIGN KEY (id_diagnostico)
        REFERENCES diagnostico(id_diagnostico),

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
);

-- Questao

CREATE TABLE questao (
    id_questao INTEGER PRIMARY KEY AUTOINCREMENT,
    enunciado TEXT NOT NULL,

    alternativa_a TEXT NOT NULL,
    alternativa_b TEXT NOT NULL,
    alternativa_c TEXT NOT NULL,
    alternativa_d TEXT NOT NULL,
    alternativa_e TEXT NOT NULL,

    gabarito CHAR(1),
    explicacao TEXT,
    nivel_dificuldade VARCHAR(20),

    id_disciplina INTEGER NOT NULL,

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
);

-- Resposta

CREATE TABLE resposta (
    id_resposta INTEGER PRIMARY KEY AUTOINCREMENT,
    data_resposta DATETIME,
    resposta_aluno CHAR(1),
    acertou BOOLEAN,

    id_aluno INTEGER NOT NULL,
    id_questao INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_questao)
        REFERENCES questao(id_questao)
);

-- Cronograma

CREATE TABLE cronograma (
    id_cronograma INTEGER PRIMARY KEY AUTOINCREMENT,
    dia_semana VARCHAR(20),
    horario_inicio TIME,
    horario_fim TIME,
    duracao_minutos INTEGER,
    tipo_atividade VARCHAR(50),

    id_plano INTEGER NOT NULL,
    id_disciplina INTEGER NOT NULL,

    FOREIGN KEY (id_plano)
        REFERENCES plano_estudo(id_plano),

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
);

-- Disponibilidade

CREATE TABLE disponibilidade (
    id_disponibilidade INTEGER PRIMARY KEY AUTOINCREMENT,
    dia_semana VARCHAR(20),
    horario_inicio TIME,
    horario_fim TIME,

    id_professor INTEGER NOT NULL,

    FOREIGN KEY (id_professor)
        REFERENCES professor(id_professor)
);

-- Agendamento

CREATE TABLE agendamento (
    id_agendamento INTEGER PRIMARY KEY AUTOINCREMENT,
    data_agendada DATE,
    horario_inicio TIME,
    horario_fim TIME,
    status VARCHAR(30),

    id_aluno INTEGER NOT NULL,
    id_professor INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_professor)
        REFERENCES professor(id_professor)
);

-- Pagamento

CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    valor DECIMAL(10,2),
    forma_pagamento VARCHAR(50),
    status VARCHAR(30),
    data_pagamento DATE,

    id_agendamento INTEGER UNIQUE,

    FOREIGN KEY (id_agendamento)
        REFERENCES agendamento(id_agendamento)
);

-- Avaliação

CREATE TABLE avaliacao (
    id_avaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
    nota DECIMAL(3,1),
    comentario TEXT,
    data_avaliacao DATE,

    id_aluno INTEGER NOT NULL,
    id_professor INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_professor)
        REFERENCES professor(id_professor)
);

-- Alerta Risco

CREATE TABLE alerta_risco (
    id_alerta INTEGER PRIMARY KEY AUTOINCREMENT,
    tema VARCHAR(100),
    quantidade_erros INTEGER,
    data_alerta DATE,
    nivel_risco VARCHAR(30),

    id_aluno INTEGER NOT NULL,
    id_disciplina INTEGER NOT NULL,

    FOREIGN KEY (id_aluno)
        REFERENCES aluno(id_aluno),

    FOREIGN KEY (id_disciplina)
        REFERENCES disciplina(id_disciplina)
);