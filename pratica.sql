-- PASSO 1 - INSERT

INSERT INTO matriculas (aluno_id, turma_id) VALUES
(1, 7),
(2, 7),
(3, 7),
(4, 8),
(5, 8),
(6, 8),
(7, 9),
(8, 9),
(9, 9),
(10, 7);

INSERT INTO notas (matricula_id, nota) VALUES
(21, 8.5),
(22, 7.0),
(23, 9.2),
(24, 6.5),
(25, 5.8),
(26, 8.0),
(27, 7.5),
(28, 9.0),
(29, 6.2),
(30, 8.8);

-- PASSO 2 - UPDATE

UPDATE notas
SET nota = nota * 10;

-- PASSO 2 - SELECTS

SELECT
    c.nome AS curso,
    t.ano,
    p.nome AS professor
FROM turmas t
INNER JOIN cursos c ON t.curso_id = c.id
INNER JOIN professores p ON t.professor_id = p.id
ORDER BY t.ano, c.nome;

SELECT
    p.nome AS professor,
    a.nome AS aluno,
    c.nome AS curso,
    t.ano
FROM professores p
INNER JOIN turmas t ON p.id = t.professor_id
INNER JOIN cursos c ON t.curso_id = c.id
INNER JOIN matriculas m ON t.id = m.turma_id
INNER JOIN alunos a ON m.aluno_id = a.id
WHERE t.ano = 2025
ORDER BY p.nome, a.nome;

SELECT
    a.nome AS aluno,
    c.nome AS curso,
    t.ano,
    n.nota
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id
INNER JOIN turmas t ON m.turma_id = t.id
INNER JOIN cursos c ON t.curso_id = c.id
INNER JOIN notas n ON m.id = n.matricula_id
ORDER BY t.ano, c.nome, a.nome;

SELECT
    a.nome AS aluno,
    c.nome AS curso,
    t.ano,
    n.nota,
    CASE
        WHEN n.nota >= 60 THEN 'APROVADO'
        ELSE 'REPROVADO'
    END AS situacao
FROM alunos a
INNER JOIN matriculas m ON a.id = m.aluno_id
INNER JOIN turmas t ON m.turma_id = t.id
INNER JOIN cursos c ON t.curso_id = c.id
INNER JOIN notas n ON m.id = n.matricula_id
ORDER BY t.ano, c.nome, a.nome;

-- PASSO 3 - DELETE

DELETE FROM notas
WHERE matricula_id IN (5,25);

DELETE FROM matriculas
WHERE aluno_id = 5;

DELETE FROM alunos
WHERE id = 5;