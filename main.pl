% Autores:
% % Vinicius Soranço 201735003
% % Arthur Dornelas 201735004

:- consult('database.pl').

menu :- repeat,
  write('Escolha uma opção:'),nl,
  write('0. Gerenciar dados'),nl,
  write('1. Historico escolar de um estudante'),nl,
  write('2. Matriz curricular de um curso'),nl,
  write('3. Relação de estudantes que já cursaram uma dada disciplina'),nl,
  write('4. Relação de disciplinas que faltam ser cursadas para um dado estudante'),nl,
  write('5. Relacao de estudantes de um dado curso'), nl,
  write('6. Relacao de cursos que cont�m uma dada disciplina'),nl,
  write('7. Fechar programa'),nl,
  read(Choice),
  run_opts(Choice),
  break.


run_opts(N) :-
  N == 0 -> menu_data();

  N == 1 -> write('Digite o nome do estudante:'), read(X), option_one(X) ;

  N == 2 -> write('Digite o nome do curso (cc ou si):'), read(Curso), option_two(Curso) ;

  N == 3 -> write('Digite o nome da disciplina:'), read(Disciplina), option_three(Disciplina) ;

  N == 4 -> write('Digite o nome do estudante:'), read(Estudante), option_four(Estudante) ;

  N == 5 -> write('Digite o nome do curso:'), read(Curso), option_five(Curso);

  N == 6 -> write('Digite o nome da disciplina:'), read(Disciplina), option_six(Disciplina); 

  N == 7 -> break.

menu_data() :-
  write('Escolha uma opção:'),nl,
  write('0. Cadastrar Estudante'),nl,
  write('1. Remover Estudante'),nl,
  write('2. Editar Estudante'),nl,
  write('3. Cadastrar Curso'),nl,
  write('4. Remover Curso'),nl,
  write('5. Editar Curso'), nl,
  write('6. Cadastrar Disciplina'),nl,
  write('7. Remover Disciplina'),nl,
  write('8. Editar Disciplina'),nl,
  write('9. Cadastrar Disciplina em Curso'),nl,
  write('10. Remover Disciplina em Curso'),nl,
  write('11. Editar Disciplina em Curso'),nl,
  write('12. Cadastrar Estudante em Disciplina'),nl,
  write('13. Remover Estudante em Disciplina'),nl,
  write('14. Editar Estudante em Disciplina'),nl,
  read(Choice),
  run_opts_data(Choice),
  break.

run_opts_data(N) :-
  N == 0 -> add_estudante ;
  N == 1 -> delete_estudante ;
  N == 2 -> edit_estudante ;
  N == 3 -> add_curso;
  N == 4 -> delete_curso;
  N == 5 -> edit_curso;
  N == 6 -> add_disciplina;
  N == 7 -> delete_disciplina;
  N == 8 -> edit_disciplina;
  N == 9 -> add_disciplina_curso;
  N == 10 -> delete_disciplina_curso;
  N == 11 -> edit_disciplina_curso;
  N == 12 -> add_estudante_disciplina;
  N == 13 -> delete_estudante_disciplina;
  N == 14 -> edit_estudante_disciplina.

add_estudante :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  write('Aluno Cadastrado'), nl,
  assert(aluno(X, Y)),
  menu,
  fail.

edit_estudante :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  retract(aluno(X,Y)),
  write('Novo nome do estudante:'), nl,
  read(W),
  write('Novo curso do estudante:'), nl,
  read(Z),
  write('Aluno editado'), nl,
  write(W), nl,
  assert(aluno(W,Z)),
  menu,
  fail.

delete_estudante :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  retract(aluno(X,Y)),
  write('Aluno excluido'),
  menu,
  fail.

add_curso :-
  write('Nome do curso:'), nl,
  read(X),
  assert(curso(X)),
  write('Curso Cadastrado'), nl,
  write(X), nl,
  menu,
  fail.

edit_curso :-
  write('Nome do curso:'), nl,
  read(X),
  retract(curso(X)),
  write('Novo nome do curso:'), nl,
  read(X),
  assert(curso(X)),
  write('Curso editado'), nl,
  write(X), nl,
  menu,
  fail.

delete_curso :-
  write('Nome do curso:'), nl,
  read(X),
  retract(curso(X)),
  retractall(aluno(_, X)),
  write('Curso excluido'),
  menu,
  fail.

add_disciplina :-
  write('Nome da disciplina:'), nl,
  read(X),
  write('Disciplina Cadastrada'), nl,
  write(X), nl,
  assert(disciplina(X)),
  menu,
  fail.

edit_disciplina :-
  write('Nome da disciplina:'), nl,
  read(X),
  retract(disciplina(X)),
  write('Novo nome da disciplina:'), nl,
  read(X),
  write('Disciplina editada'), nl,
  write(X), nl,
  assert(disciplina(X)),
  menu,
  fail.

delete_disciplina :-
  write('Nome da disciplina:'), nl,
  read(X),
  retract(disciplina(X)),
  retractall(cursou(_, X, _)),
  write('Disciplina excluida'),
  menu,
  fail.

add_disciplina_curso :-
  write('Nome da disciplina:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  write('Periodo:'), nl,
  read(Z),
  assert(disciplinaCurso(Y, X, Z)),
  write('Adicionada'),
  menu,
  fail.

edit_disciplina_curso :-
  write('Nome da disciplina:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  write('Periodo:'), nl,
  read(Z),
  retract(disciplinaCurso(Y, X, Z)),
  write('Novo nome da disciplina:'), nl,
  read(X),
  write('Novo nome do curso:'), nl,
  read(Y),
  write('Novo periodo:'), nl,
  read(Z),
  assert(disciplinaCurso(Y, X, Z)),
  write('Editada'),
  menu,
  fail.

delete_disciplina_curso :-
  write('Nome da disciplina:'), nl,
  read(X),
  write('Nome do curso:'), nl,
  read(Y),
  write('Periodo:'), nl,
  read(Z),
  retract(disciplinaCurso(Y, X, Z)),
  write('Deletada'),
  menu,
  fail.

add_estudante_disciplina :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome da disciplina:'), nl,
  read(Y),
  write('Nota:'), nl,
  read(Z),
  assert(cursou(X, Y, Z)),
  write('Adicionado'),
  menu,
  fail.

edit_estudante_disciplina :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome da disciplina:'), nl,
  read(Y),
  write('Nota:'), nl,
  read(Z),
  retract(cursou(X, Y, Z)),
  write('Novo nome do estudante:'), nl,
  read(X),
  write('Novo nome da disciplina:'), nl,
  read(Y),
  write('Nova nota:'), nl,
  read(Z),
  assert(cursou(X, Y, Z)),
  write('Editado'),
  menu,
  fail.

delete_estudante_disciplina :-
  write('Nome do estudante:'), nl,
  read(X),
  write('Nome da disciplina:'), nl,
  read(Y),
  write('Nota:'), nl,
  read(Z),
  retract(cursou(X, Y, Z)),
  write('Deletado'),
  menu,
  fail.

option_one(Estudante) :-
  format("|~t~a~t~34||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|", ["Disciplina", "Nota", "Período", "Status"]), nl,
  format("|~`-t~88||~n"),
  cursou(Estudante, Disciplina, Nota), aluno(Estudante, Curso), disciplinaCurso(Curso, Disciplina, Periodo),
  (Nota > 60 -> format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Nota, Periodo, "APROVADO"]) ;
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Nota, Periodo, "REPROVADO"])),
  fail.

option_two(Curso) :-
  format("|~t~a~t~28||~t~a~t~22+|", ["Disciplinas", "Período"]), nl,
  format("|~`-t~44||~n"),
  disciplinaCurso(Curso, Disciplina, Periodo),
  format("|~t~a~t~22||~t~a~t~22+|~n", [Disciplina, Periodo]),
  fail.

option_three(Disciplina) :-
  write("Deseja incluir um critério de seleção por nota s/n?"), read(R),
  R == 's' -> write("Digite a nota: "), read(Grade),
  format("|~t~a~t~28||~t~a~t~22+|~t~a~t~22+|", ["Disciplina", "Estudante", "Nota"]), nl,
  format("|~`-t~66||~n"),
  cursou(Estudante, Disciplina, Grade),
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Estudante, Grade]),
  fail ;
  format("|~t~a~t~28||~t~a~t~22+|~t~a~t~22+|", ["Disciplina", "Estudante", "Nota"]), nl,
  format("|~`-t~66||~n"),
  cursou(Estudante, Disciplina, Nota),
  format("|~t~a~t~22||~t~a~t~22+|~t~a~t~22+|~n", [Disciplina, Estudante, Nota]),
  fail.

disciplinaEstudante(Estudante, Disciplina) :-
  aluno(Estudante, C), disciplinaCurso(C, Disciplina, _).

option_four(Estudante) :-
  findall(DisciplinaNaoCursada, disciplinaEstudante(Estudante, DisciplinaNaoCursada), DisciplinasCurso),
  findall(DisciplinaCursada, cursou(Estudante, DisciplinaCursada, _), DisciplinasCursadas),
  subtract(DisciplinasCurso, DisciplinasCursadas, R),
  write("Disciplinas que faltam ser cursadas: "),
  writeln(R),
  menu.

func(Curso, Estudante) :- 
  aluno(Estudante, Curso), cursou(Estudante, _,  _).

option_five(Curso) :-
  write("Se deseja incluir um critério de seleção por nota digite 'n' ou se desajar incluir critério de seleção por IRA, digite 'i', senão aperte 'c' para buscar sem criterio"), read(R),
  R == 'n' -> write("Digite a nota: "), read(Nota), nl, 
  findall(Estudante, func(Curso, Estudante), Notas),
  write('Alunos: '),
  sort(Notas, X),
  writeln(X),
  fail ; 
  format("|~t~a~t~27||~t~a~t~22+|", ["Curso", "Estudante"]), nl,
  format("|~`-t~44||~n"),
  aluno(Estudante, Curso),
  format("|~t~a~t~22||~t~a~t~22+|~n", [Curso, Estudante]),
  fail.

option_six(Disciplina) :-
  format("|~t~a~t~36||~t~a~t~22+|", ["Disciplina", "Cursos"]), nl,
  format("|~`-t~44||~n"),
  disciplinaCurso(Curso, Disciplina, _), curso(Curso),
  format("|~t~a~t~22||~t~a~t~22+|~n", [Disciplina, Curso]),
  fail.

?- menu.
