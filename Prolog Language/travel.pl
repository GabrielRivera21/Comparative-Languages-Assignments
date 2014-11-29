/*
 * travel.pl
 * By Antonio F. Huertas
 * Modified By: Gabriel Rivera Per-ossenkopp
 * Modifications: Added Predicates.
 * This is a knowledge base of fictitious travel information.
 */

% byCar(?Origin, ?Destination)
% True if Destination is reachable from Origin by car.
byCar(bayamon, guaynabo).
byCar(guaynabo, san_juan).
byCar(san_juan, carolina).
byCar(aguadilla, mayaguez).
byCar(mayaguez, san_german).

% byTrain(?Origin, ?Destination)
% True if Destination is reachable from Origin by train.
byTrain(bayamon, aguadilla).
byTrain(aguadilla, cabo_rojo).
byTrain(san_german, ponce).
byTrain(carolina, fajardo).
byTrain(carolina, ponce).

% byPlane(?Origin, ?Destination)
% True if Destination is reachable from Origin by plane.
byPlane(carolina, orlando).
byPlane(carolina, new_york).
byPlane(carolina, paris).
byPlane(paris, tokio).
byPlane(new_york, san_antonio).
byPlane(san_antonio, san_francisco).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/**
 * @author Gabriel Rivera Per-ossenkopp
 * November 29, 2014
 * Description: Predicates functions using the knowledge base above to
 * know if one can travel between two places.
 */
%% travelByCar(?Origin, ?Destination).
% Determines whether it is possible to travel by car between two places
travelByCar(Origin, Destination) :-
     byCar(Origin, MidPoint),
     travelByCar(MidPoint, Destination).
travelByCar(Origin, Destination) :-
     byCar(Origin, Destination).
     
%% travelByTrain(?Origin, ?Destination).
% Determines whether it is possible to travel by train between two places.
travelByTrain(Origin, Destination) :-
     byTrain(Origin, MidPoint),
     travelByTrain(MidPoint, Destination).
travelByTrain(Origin, Destination) :-
     byTrain(Origin, Destination).

%% travelByPlain(?Origin, ?Destination).
% Determines whether it is possible to travel by plane between two places.
travelByPlane(Origin, Destination) :-
     byPlane(Origin, MidPoint),
     travelByPlane(MidPoint, Destination).
travelByPlane(Origin, Destination) :-
     byPlane(Origin, Destination).

%% travel(?Origin, ?Destination).
% Determines where it is possible to travel between two places.
travel(Origin, Destination) :-
     travelByCar(Origin, MidPoint),
     travel(MidPoint, Destination).
travel(Origin, Destination) :-
     travelByTrain(Origin, MidPoint),
     travel(MidPoint, Destination).
travel(Origin, Destination) :-
     travelByPlane(Origin, MidPoint),
     travel(MidPoint, Destination).

travel(Origin, Destination) :-
     byCar(Origin, Destination);
     byTrain(Origin, Destination);
     byPlane(Origin, Destination).