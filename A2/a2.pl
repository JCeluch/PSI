%opis grafu
dungeon(entryroom, dormitory, 5).
dungeon(entryroom, armory, 2).
dungeon(dormitory, kitchen, 1).
dungeon(dormitory, shrine, 6).
dungeon(dormitory, jail, 3).
dungeon(dormitory, armory, 5).
dungeon(dormitory, guardpost, 4).
dungeon(kitchen, chapel, 3).
dungeon(chapel, bath, 1).
dungeon(shrine, jail, 2).
dungeon(bath, laboratory, 6).
dungeon(jail, guardpost, 5).
dungeon(courthall, masterbedroom, 4).
dungeon(courthall, forge, 4).
dungeon(armory, courthall, 3).
dungeon(laboratory, latrines, 2).
dungeon(laboratory, eatinghall, 2).
dungeon(masterbedroom, observatory, 1).
dungeon(forge, garden, 7).
dungeon(forge, eatinghall, 3).
dungeon(forge, guardpost, 4).
dungeon(eatinghall, nursery, 2).
dungeon(eatinghall, guardpost, 6).
dungeon(latrines, nursery, 3).
dungeon(observatory, garden, 3).
dungeon(nursery, exitroom, 4).
dungeon(garden, barracks, 7).
dungeon(barracks, eatinghall, 1).

% graf nieskierowany
neighborroom(X, Y, C) :- dungeon(X, Y, C).
neighborroom(X, Y, C) :- dungeon(Y, X, C).

run(X,Y) :-
        go(X, Y, [X], 0).

go(X, X, T, C) :-
        write(T), nl,
        write("Cost: "), write(C), nl.

%lista węzłów zakazanych
%avoid([jail,latrines,bath]).

%poszukiwanie drogi
go(X,Y,T,Cost) :-
        neighborroom(X, Z, C),
        \+ member(Z, T),
        Sum is Cost + C,
        go(Z, Y, [Z|T], Sum).

%sprawdzenie, czy element występuje w liście
member(X,[X|_]).
member(X,[_|H]) :- member(X,H).