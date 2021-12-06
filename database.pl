% Autores:
% % Vinicius Soranço 201735003
% % Arthur Dornelas 201735004

:- dynamic(disciplinaCurso/3).
:- dynamic(matriculado/3).
:- dynamic(cursou/3).
:- dynamic(aluno/2).
:- dynamic(disciplina/1).
:- dynamic(curso/1).

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
aluno(bruno, cc).
aluno(henrique, cc).
aluno(leornardo, cc).
aluno(rafael, cc).
aluno(caio, si).
aluno(pedro, si).
aluno(victor, si).
aluno(igor, si).
aluno(maria, si).
aluno(gabriel, si).
aluno(marcelo, si).
aluno(bruna, si).
aluno(yasmim, si).
aluno(isabela, si).

disciplinaCurso(cc, calculo_1, 1).
disciplinaCurso(cc, algoritmos, 1).
disciplinaCurso(cc, geo_analitica, 1).
disciplinaCurso(cc, algebra_linear, 1).
disciplinaCurso(cc, calculo_2, 2).
disciplinaCurso(cc, estrutura_de_dados, 2).
disciplinaCurso(cc, grafos, 3).
disciplinaCurso(cc, calculo_3, 3).
disciplinaCurso(si, calculo_1, 1).
disciplinaCurso(si, algoritmos, 1).
disciplinaCurso(si, geo_analitica, 1).
disciplinaCurso(si, algebra_linear, 1).
disciplinaCurso(si, calculo_2, 2).
disciplinaCurso(si, estrutura_de_dados, 2).
disciplinaCurso(si, grafos, 3).
disciplinaCurso(si, calculo_3, 3).

cursou(vinicius, calculo_1, 70).
cursou(vinicius, algoritmos, 70).
cursou(vinicius, geo_analitica, 70).
cursou(vinicius, algebra_linear, 70).
cursou(vinicius, estrutura_de_dados, 59).
cursou(arthur, calculo_1, 61).
cursou(arthur, algoritmos, 70).
cursou(arthur, geo_analitica, 70).
cursou(arthur, algebra_linear, 70).
cursou(arthur, estrutura_de_dados, 59).
