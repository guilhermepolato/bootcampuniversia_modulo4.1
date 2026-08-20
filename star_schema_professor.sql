-- Modelo dimensional (star schema) - foco: Professor
-- Grao da fato: professor x disciplina x curso x departamento x data

CREATE TABLE Dim_Professor (
    idProfessor INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Dim_Departamento (
    idDepartamento INT PRIMARY KEY,
    Nome VARCHAR(45),
    Campus VARCHAR(45)
);

CREATE TABLE Dim_Curso (
    idCurso INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Dim_Disciplina (
    idDisciplina INT PRIMARY KEY,
    Nome VARCHAR(100)
);

CREATE TABLE Dim_Data (
    idData INT PRIMARY KEY,
    Data DATE,
    Ano INT,
    Mes INT,
    Trimestre INT
);

CREATE TABLE Fato_Atuacao_Professor (
    idProfessor INT,
    idDepartamento INT,
    idDisciplina INT,
    idCurso INT,
    idData INT,
    Qtd_Disciplinas INT,
    PRIMARY KEY (idProfessor, idDepartamento, idDisciplina, idCurso, idData),
    FOREIGN KEY (idProfessor) REFERENCES Dim_Professor(idProfessor),
    FOREIGN KEY (idDepartamento) REFERENCES Dim_Departamento(idDepartamento),
    FOREIGN KEY (idDisciplina) REFERENCES Dim_Disciplina(idDisciplina),
    FOREIGN KEY (idCurso) REFERENCES Dim_Curso(idCurso),
    FOREIGN KEY (idData) REFERENCES Dim_Data(idData)
);
