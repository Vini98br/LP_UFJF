% estudante(nomeEstudante, curso: curso)
% curso(nomeCurso)
% disciplina(nomeDisciplina)

disciplina(calculo_1).
disciplina(calculo_2).
disciplina(calculo_3).
disciplina(algoritmos).
disciplina(geo_analitica).
disciplina(algebra_linear).
disciplina(estrutura_de_dados).
disciplina(grafos).

curso(ciencia_da_computacao).
curso(sistema_de_informacao).

aluno(vinicius, ciencia_da_computacao).
aluno(arthur, ciencia_da_computacao).
aluno(joao, ciencia_da_computacao).
aluno(camila, ciencia_da_computacao).
aluno(danielG, ciencia_da_computacao).
aluno(danielM, ciencia_da_computacao).
aluno(caio, sistema_de_informacao).
aluno(pedro, sistema_de_informacao).
aluno(victor, sistema_de_informacao).
aluno(igor, sistema_de_informacao).


% disciplinaCurso(curso, disciplina, periodo) - Requisito: matriz curricular de um curso; (disciplinaCurso(ciencia_da_computacao, X, Y))
disciplinaCurso(ciencia_da_computacao, calculo_1, 1).
disciplinaCurso(ciencia_da_computacao, algoritmos, 1).
disciplinaCurso(ciencia_da_computacao, geo_analitica, 1).
disciplinaCurso(ciencia_da_computacao, algebra_linear, 1).
disciplinaCurso(ciencia_da_computacao, estrutura_de_dados, 2).
disciplinaCurso(ciencia_da_computacao, grafos, 3).

% cursouDisciplina(nomeEstudante, disciplina, nota) - Requisito: histórico escolar de um estudante; (cursouDisciplina(vinicius, X, Y))
cursouDisciplina(vinicius, calculo_1, 70).
cursouDisciplina(vinicius, algoritmos, 70).
cursouDisciplina(vinicius, geo_analitica, 70).
cursouDisciplina(vinicius, algebra_linear, 70).

% matrizCurso(X) :- 
%   disciplinaCurso(X, _, _).

menu :- repeat,
  write('Escolha uma opção:'),nl,
  write('1. Historico escolar de um estudante'),nl,
  write('2. Matriz curricular de um curso'),nl,
  read(Choice),
  write(Choice),
  break.

?- menu.