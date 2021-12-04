
% matrizCurso(X) :- 
%   disciplinaCurso(X, _, _).

% Escrever 0 para com nota e 1 para sem nota
% N == 0 ->  
% aprovado(X, disciplina, Y) ;
% aprovado(X, disciplina)

:- consult('database.pl').

menu :- repeat,
  write('Escolha uma opção:'),nl,
  write('1. Historico escolar de um estudante'),nl,
  write('2. Matriz curricular de um curso'),nl,
  write('3. Relação de estudantes que já cursaram uma dada disciplina'),nl,
  write('4. Relação de disciplinas que faltam ser cursadas para um dado estudante'),nl,
  read(Choice),
  run_opts(Choice),
  break.


run_opts(N) :-
  N == 1 -> write('Digite o nome do estudante:'), read(X), option_one(X) ;

  N == 2 -> write('Digite o nome do curso (cc ou si):'), read(Curso), option_two(Curso) ; 

  N == 3 -> write('Digite o nome da disciplina:'), read(Disciplina), option_three(Disciplina) ; 

  N == 4 -> write('Digite o nome do estudante:'), read(Estudante), option_four(Estudante) ; 

  N == 5 -> write('').

option_one(Estudante) :- 
  display_historic_table_header,
  cursou(Estudante, Disciplina, Nota), aluno(Estudante, Curso), disciplinaCurso(Curso, Disciplina, Periodo, _),
  (Nota > 60 -> format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Nota, Periodo, "APROVADO"]) ; 
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Nota, Periodo, "REPROVADO"])),
  % format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Nota, Periodo, "MATRICULADO"])),
  fail.

option_two(Curso) :- 
  format("|~t~a~t~28||~t~a~t~22+|~t~a~t~22+|", ["Disciplinas", "Período", "Obrigatoriedade"]), nl,
  format("|~`-t~66||~n"),
  disciplinaCurso(Curso, Disciplina, Periodo, Obrigatoriedade),
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Periodo, Obrigatoriedade]),
  fail.

option_three(Disciplina) :- 
  % write("Deseja incluir um critério de seleção por nota s/n?"), read(R),
  % R == "s" -> write("Digite a nota: "), read(Grade), write(Grade) ; write('').
  format("|~t~a~t~28||~t~a~t~22+|~t~a~t~22+|", ["Disciplina", "Estudante", "Nota"]), nl,
  format("|~`-t~66||~n"),
  cursou(Estudante, Disciplina, Nota),
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Estudante, Nota]),
  fail.


option_four(Estudante) :- 
  findall(Disciplina, aluno(Estudante, disciplinaCurso(Curso, Disciplina)), Disciplinas),
  write(Disciplinas).


display_historic_table_header :- 
  format("|~t~a~t~34||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|", ["Disciplina", "Nota", "Período", "Status"]), nl,
  format("|~`-t~88||~n").

?- menu.

% swipl /home/vinicius/Code/UFJF/LP/test.pl