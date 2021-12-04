:- dynamic(disciplinaCurso/4).
:- dynamic(matriculado/3).
:- dynamic(cursou/3).

disciplina(calculo_1).
disciplina(calculo_2).
disciplina(calculo_3).
disciplina(algoritmos).
disciplina(geo_analitica).
disciplina(algebra_linear).
disciplina(estrutura_de_dados).
disciplina(grafos).

curso(cc).
curso(si).

aluno(vinicius, cc).
aluno(arthur, cc).
aluno(joao, cc).
aluno(camila, cc).
aluno(danielG, cc).
aluno(danielM, cc).
aluno(caio, si).
aluno(pedro, si).
aluno(victor, si).
aluno(igor, si).


% disciplinaCurso(curso, disciplina, periodo) - Requisito: matriz curricular de um curso; (disciplinaCurso(cc, X, Y))
disciplinaCurso(cc, calculo_1, 1, "Obrigatória").
disciplinaCurso(cc, algoritmos, 1, "Obrigatória").
disciplinaCurso(cc, geo_analitica, 1, "Obrigatória").
disciplinaCurso(cc, algebra_linear, 1, "Obrigatória").
disciplinaCurso(cc, calculo_2, 2, "Obrigatória").
disciplinaCurso(cc, estrutura_de_dados, 2, "Obrigatória").
disciplinaCurso(cc, grafos, 3, "Obrigatória").
disciplinaCurso(cc, calculo_3, 3, "Obrigatória").
disciplinaCurso(si, calculo_1, 1, "Obrigatória").
disciplinaCurso(si, algoritmos, 1, "Obrigatória").
disciplinaCurso(si, geo_analitica, 1, "Obrigatória").
disciplinaCurso(si, algebra_linear, 1, "Opcional").
disciplinaCurso(si, calculo_2, 2, "Obrigatória").
disciplinaCurso(si, estrutura_de_dados, 2, "Obrigatória").
disciplinaCurso(si, grafos, 3, "Obrigatória").
disciplinaCurso(si, calculo_3, 3, "Opcional").

% matriculado(nomeEstudante, disciplina, nota) - Requisito: histórico escolar de um estudante; (matriculado(vinicius, X, Y))
cursou(vinicius, calculo_1, 70).
cursou(vinicius, algoritmos, 70).
cursou(vinicius, geo_analitica, 70).
cursou(vinicius, algebra_linear, 70).
cursou(vinicius, estrutura_de_dados, 59).
cursou(arthur, calculo_1, 70).
cursou(arthur, algoritmos, 70).
cursou(arthur, geo_analitica, 70).
cursou(arthur, algebra_linear, 70).
cursou(arthur, estrutura_de_dados, 59).

matriculado(vinicius, calculo_2, "-").
matriculado(vinicius, estrutura_de_dados, "-").
matriculado(arthur, calculo_2, "-").
matriculado(arthur, estrutura_de_dados, "-").


