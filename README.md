# 📊 Projeto 4 – Primeiros Passos com Power BI
# 🌟 Modelagem Dimensional: Star Schema 

## 🎯 Objetivo

Este projeto tem por objetivo a criação de um esquema dimensional – star schema – com base no diagrama relacional disponibilizado com Power BI.

## 🗄️ Modelo Relacional de Origem

O diagrama relacional que serviu como base para este projeto engloba as seguintes entidades:
* Universidade e Departamento.
* Professor, Curso e Disciplina.
* Entidades associativas e de dependência (Disciplina & Curso, Pré-requisitos das disciplinas e Pré-requisitos).
* Aluno e Matriculado.

## 🛠️ Modelagem Aplicada

A arquitetura do esquema estrela foi estruturada com o seguinte **nível de granularidade para a tabela fato**: *Professor x Disciplina x Curso x Departamento x Data*.

### 📌 Tabela Fato: `Fato_Atuacao_Professor`
| Coluna | Tipo | Descrição |
|---|---|---|
| `idProfessor` | INT (FK) | Identificador do professor responsável |
| `idDepartamento` | INT (FK) | Identificador do departamento do professor |
| `idDisciplina` | INT (FK) | Identificador da disciplina ministrada |
| `idCurso` | INT (FK) | Identificador do curso ao qual a disciplina pertence |
| `idData` | INT (FK) | Identificador da data de oferta da disciplina |
| `Qtd_Disciplinas` | INT | Medida quantitativa utilizada para contagem |

### 🧩 Tabelas Dimensão
* **`Dim_Professor`**: `idProfessor`, `Nome`.
* **`Dim_Departamento`**: `idDepartamento`, `Nome`, `Campus`.
* **`Dim_Curso`**: `idCurso`, `Nome`.
* **`Dim_Disciplina`**: `idDisciplina`, `Nome`.
* **`Dim_Data`**: `idData`, `Data`, `Ano`, `Mes`, `Trimestre`.

## 💡 Premissas Assumidas

Para viabilizar a análise e a construção do modelo dimensional, as seguintes premissas foram adotadas na modelagem:
* **Enriquecimento de Dados:** O modelo relacional original disponibiliza apenas identificadores (IDs). Os campos descritivos (como `Nome`) nas dimensões de Professor, Curso e Disciplina foram incluídos de forma hipotética para dar sentido às análises.
* **Perspectiva Temporal:** O modelo de origem não contempla dados temporais. A dimensão `Dim_Data` foi introduzida assumindo a existência de uma data de oferta para cada disciplina, seguindo as orientações estabelecidas no enunciado do desafio.
* **Recorte de Escopo:** Como decisão de design, os dados das entidades de Aluno e de Matrícula foram removidos da modelagem final.

## ⚙️ Ferramenta Utilizada

A modelagem foi desenvolvida e validada utilizando o **MySQL Workbench**. O processo envolveu:
1. A criação de um script SQL (`star_schema_professor.sql`) contendo as instruções de `CREATE TABLE` para as 6 tabelas que compõem o esquema.
2. A geração automática do diagrama visual através da funcionalidade de engenharia reversa (**File > Import > Reverse Engineer MySQL Create Script**).
3. A habilitação da opção *"Place imported objects on a diagram"* para a disposição visual das entidades.

## 📸 Resultado Final

![Diagrama Star Schema](diagramastarschema.png) 

O esquema gerado consolida a tabela fato `Fato_Atuacao_Professor` no centro do diagrama, conectando-se diretamente às cinco dimensões periféricas. A total ausência de relacionamentos diretos entre as dimensões (sem normalizações adicionais) atesta a aderência ao formato clássico de estrela (Star Schema).

## 📂 Estrutura do Repositório

```text
.
├── README.md
├── star_schema_professor.sql
└── diagrama_star_schema.png
```

## 📚 Sobre o Bootcamp

Este projeto faz parte do **Bootcamp Universia – Primeiros Passos em Power BI**, oferecido pela **DIO (Digital Innovation One)**, cujo objetivo é desenvolver fundamentos de Business Intelligence por meio de atividades práticas utilizando o Microsoft Power BI.

---

## 👨‍💻 Autor

**Guilherme Polato**

Graduado em Análise e Desenvolvimento de Sistemas, com foco em Análise de Dados e Business Intelligence.

---

## ⭐ Considerações Finais

Este repositório representa uma etapa importante da minha evolução na área de Dados. Conforme avanço nos estudos, novos projetos serão adicionados ao meu portfólio, demonstrando a aplicação prática de conceitos de Business Intelligence, modelagem de dados e criação de dashboards com Power BI.

