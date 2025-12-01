%File: grandfather.pl
%Author: Jackson Holt, Transy U
%Course: CS 3234 Principles of Programing Languages
%
%   This is the implementation of the grandfather paradox:
%        It sounds funny, I know,
%        But it really is so,
%        Oh, I’m my own grandpa.
%        I’m my own grandpa.
%        I’m my own grandpa.
%        It sounds funny, I know,
%        But it really is so,
%        Oh, I’m my own grandpa.
%        Now many, many years ago, when I was twenty-three,
%        I was married to a widow who was pretty as could be.
%        This widow had a grown-up daughter who had hair of red.
%        My father fell in love with her, and soon they, too, were wed.
%        This made my dad my son-in-law and changed my very life,
%        My daughter was my mother, cause she was my father’s wife.
%        To complicate the matter, even though it brought me joy,
%        I soon became the father of a bouncing baby boy.
%        My little baby then became a brother-in-law to Dad,
%        And so became my uncle, though it made me very sad.
%        For if he was my uncle, then that also made him brother
%        Of the widow’s grown-up daughter, who, of course, was my stepmother.
%        Father’s wife then had a son who kept him on the run,
%        And he became my grandchild, for he was my daughter’s son.
%        My wife is now my mother’s mother, and it makes me blue,
%        Because, although she is my wife, she’s my grandmother, too.
%        Now if my wife is my grandmother, then I’m her grandchild,
%        And everytime I think of it, it nearly drives me wild,
%        For now I have become the strangest case you ever saw
%        As husband of my grandmother, I am my own grandpa!
%        I’m my own grandpa.
%        I’m my own grandpa.
%        It sounds funny, I know, but it really is so,
%        Oh, I’m my own grandpa.

spouse(X, Y) :- married(X, Y),!.
spouse(X, Y) :- married(Y, X).

wife(Wife, Husband) :-
    spouse(Husband, Wife),
    female(Wife).

husband(Husband, Wife) :-
   spouse(Husband, Wife),
   male(Husband).

child(Parent, Child) :-
    parent(Parent, Child).

father(Parent, Child) :-
    parent(Parent, Child),
    male(Parent).

mother(Parent, Child):-
    parent(Parent, Child),
    female(Parent).

uncle(Uncle, Child) :-
    sibling(Uncle, Parent),
    parent(Parent, Child),
    male(Uncle).

aunt(Aunt, Child) :-
    sibling(Aunt, Parent),
    parent(Parent, Child),
    female(Aunt).

sibling(Sibling1, Sibling2) :-
    parent(Parent1, Sibling1),
    parent(Parent2, Sibling2),
    Parent1 = Parent2.

grandparent(GrandPar, Chil) :- !,
    spouse(GrandPar, Spouse),
    parent(Spouse, Parent),
    parent(Parent, Chil).

grandparent(GrandPar, Child) :- 
    parent(GrandPar, Parent),
    parent(Parent, Child).

grandfather(GrandFather, Child) :- 
    grandparent(GrandFather, Child),
    male(GrandFather).

grandmother(GrandMother, Child) :-
    grandparent(GrandMother, Child),
    female(GrandMother).

grandchild(Grandparent, Child) :-
   grandparent(Grandparent, Child).
 
% genders
male(narrator).
male(father).
male(nar_son).
male(father_son).     % father's son with narrator's stepdaughter
female(widow).
female(step_daughter).

% marriages
married(narrator, widow).
married(father, step_daughter).

%parrent raltionships
parent(widow, step_daughter).         % widow had her daughter before narrator
parent(step_daughter, narrator).      %step relationship
parent(narrator, nar_son).          % narrator + widow baby
parent(widow, nar_son).             % widow + narrator baby
parent(step_daughter, father_son).    % father_son is child of stepdaughter
parent(father, father_son).          % father is parent of father_son
parent(father, narrator).            % narrator is child of father