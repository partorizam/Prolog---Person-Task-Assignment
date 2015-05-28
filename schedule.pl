%% ||Author - Marc Khristian Partoriza  ||
%% ||Date   - January 30th 2014         ||
%% ||Class  - ICS 313 Programming Theory||
%% ||Professor David Chin & Amy Takeyesu||
%%   -----------------------------------
%%
%% schedule(LIST OF PERSONS,
%%          LIST OF TASKS,
%%          RESULTING ASSIGNMENTS)
%%
%%	Assigns Persons to a specified task according to their persons
%%	task capability, task type and whether or not the person has
%%	enough remaning hours to said task.
%%
schedule(Persons, [FirstT | RestT], Result):-
	buildpersonhours(Persons, PersonHours),
        schedule(Persons, [FirstT | RestT], Result, PersonHours).
%% schedule(LIST OF PERSONS,
%%	    LIST OF TASKS,
%%	    RESULTING ASSIGNMENTS,
%%	    LIST OF [PERSONs and their HOURS])
%%
%% Base Clause      - schedule helper functor
%%
schedule(Persons, [], [], PersonHours).
%%
%% Recursive clause - schedule helper functor
%%
schedule(Persons, [FirstT | RestT], [ [FirstP, FirstT] | RestR], PersonHours):-
	%A Person P can be assigned task T if...
        %P is a person functor in the database
	person(FirstP, Tasks, _),

	%P is a member of the Persons argument
	member(FirstP, Persons),
	member([FirstP, HoursP], PersonHours),

	%there is a task functor that describes T with its task type
	%and that task type is a member of P's list of capabilities

	task(FirstT, TCapability, HoursT),
	member(TCapability, Tasks ),

	%P has enough remaining hours to do T
	HoursP >= HoursT,

	%Assigning task T to Person P, reduces their remaining available hours
	NewHoursP is HoursP - HoursT,

	substitute([FirstP, HoursP], [FirstP, NewHoursP], PersonHours, NewPersonHours),
	schedule(Persons, RestT, RestR, NewPersonHours).
%% substitute(OLD_ELEM,
%%	      NEW_ELEM,
%%            OLD_LIST,
%%            NEW_LIST)
%%
%%	Substitutes an element with a new element in a specified list
%%	and returns the new list.
%%
substitute(_, _, [], []).
substitute(O, R, [O|T], [R|T2]) :- substitute(O, R, T, T2).
substitute(O, R, [H|T], [H|T2]) :- H \= O, substitute(O, R, T, T2).
%% buildpersonhours(PERSONS,
%%                  PERSONHOURS)
%%
%%	Builds a list of pairs with a person and their remaining hours
%%	The list is then used to keep track of their hours after
%	assignments.
buildpersonhours([], []).
buildpersonhours([FirstP | RestP], [[FirstP, Hours] | RestPH]):-
	person(FirstP, _, Hours),
	buildpersonhours(RestP, RestPH).














