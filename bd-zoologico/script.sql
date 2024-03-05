CREATE TABLE Animal (
    codAnim INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie INT,
    cor VARCHAR(30),
    altura DECIMAL(2 , 2 ),
    classe INT NOT NULL,
    container INT,
    CONSTRAINT pkAnimal PRIMARY KEY (codAnim)
);

CREATE TABLE Classe (
    codClasse INT NOT NULL,
    nomedaClasse VARCHAR(15),
    descricao VARCHAR(1000),
    CONSTRAINT pkClasse PRIMARY KEY (codClasse)
);
    
CREATE TABLE Container (
    codCont INT NOT NULL,
    tipo VARCHAR(10) NOT NULL,
    ala INT,
    CONSTRAINT pkContainer PRIMARY KEY (codCont)
);

CREATE TABLE Ala (
    numeroAla INT NOT NULL,
    classe INT,
    CONSTRAINT pkAla PRIMARY KEY (numeroAla)
);

CREATE TABLE Funcionario (
    matriculaFunc INT NOT NULL,
    Nome VARCHAR(50) NOT NULL,
    CPF BIGINT NOT NULL,
    RG BIGINT,
    CRMV INT,
    cargo INT NOT NULL,
    endereco INT,
    CONSTRAINT pkFuncionario PRIMARY KEY (matriculaFunc)
);

CREATE TABLE Cargo (
    codCargo INT NOT NULL,
    cargo VARCHAR(30) NOT NULL,
    salario DECIMAL(6 , 2 ),
    CONSTRAINT pkCargo PRIMARY KEY (codCargo)
);

CREATE TABLE Endereco (
    codEndereco INT NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero SMALLINT,
    complemento VARCHAR(20),
    cidade INT NOT NULL,
    CEP INT NOT NULL,
    CONSTRAINT pkEndereco PRIMARY KEY (codEndereco)
);

CREATE TABLE Cidade (
    codCid INT NOT NULL,
    nome VARCHAR(20) NOT NULL,
    CONSTRAINT pkCidade PRIMARY KEY (codCid)
);

CREATE TABLE HistoricoConsulta (
    codConsult INT NOT NULL,
    dataConsult DATE NOT NULL,
    hora TIME NOT NULL,
    veterinario INT NOT NULL,
    animal INT NOT NULL,
    CONSTRAINT pkHistorico PRIMARY KEY (codConsult)
);

CREATE TABLE Limpeza (
    codLimp INT NOT NULL,
    dia DATE NOT NULL,
    hora TIME NOT NULL,
    container INT NOT NULL,
    funcionario INT NULL,
    CONSTRAINT pkLimpeza PRIMARY KEY (codLimp)
);

CREATE TABLE Acompanha (
    codAnim INT NOT NULL,
    matriculaFunc INT NOT NULL,
    CONSTRAINT pkAcompanha PRIMARY KEY (codAnim , matriculaFunc)
);

ALTER TABLE Animal ADD CONSTRAINT fkAnimClasse
FOREIGN KEY (classe) REFERENCES Classe(codClasse);

ALTER TABLE Animal ADD CONSTRAINT fkAnimContainer
FOREIGN KEY (container) REFERENCES Container(codCont);

ALTER TABLE Container ADD CONSTRAINT fkContAla
FOREIGN KEY (ala) REFERENCES  Ala(numeroAla);

ALTER TABLE Ala ADD CONSTRAINT fkAlaClasse
FOREIGN KEY (classe) REFERENCES Classe(codClasse);

ALTER TABLE Funcionario ADD CONSTRAINT fkFuncAcompanha
FOREIGN KEY (cargo) REFERENCES Cargo(codCargo);

ALTER TABLE Funcionario ADD CONSTRAINT fkFuncEnderec
FOREIGN KEY (endereco) REFERENCES Endereco(codEndereco);

ALTER TABLE Endereco ADD CONSTRAINT fkEnderCidade
FOREIGN KEY (cidade) REFERENCES Cidade(codCid);

ALTER TABLE HistoricoConsulta ADD CONSTRAINT fkHistVeter
FOREIGN KEY (veterinario) REFERENCES Funcionario(matriculaFunc);

ALTER TABLE HistoricoConsulta ADD CONSTRAINT fkHistAnim
FOREIGN KEY (animal) REFERENCES Animal(codAnim);

ALTER TABLE Acompanha ADD CONSTRAINT fkAcompAnim
FOREIGN KEY (codAnim) REFERENCES Animal(codAnim);

ALTER TABLE Acompanha ADD CONSTRAINT fkAcompVet
FOREIGN KEY (matriculaFunc) REFERENCES Funcionario(matriculaFunc);

ALTER TABLE Limpeza ADD CONSTRAINT fkLimpFunc
FOREIGN KEY (funcionario) REFERENCES Funcionario(matriculaFunc);

ALTER TABLE Limpeza ADD CONSTRAINT fkLimpCont
FOREIGN KEY (container) REFERENCES Container(codCont);

SELECT * FROM HistoricoConsulta