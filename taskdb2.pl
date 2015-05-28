%%
%% Person(ID,
%%        TASK_CAPABILITIES,
%%	  AVAILABLE_HOURS)
%%
%%   How many hours each person has available and what classes of tasks
%%   they are capable of performing.
%%
person(p1, [a], 15).
person(p2, [b], 20).
person(p3, [a,c], 30).
person(p4, [b,d], 25).
%%
%% task(ID,
%%      REQUIRED_HOURS,
%%	TASK_CLASS)
%%
%%   How long each task requires and what class it falls under.
%%
task(t1, a, 15).
task(t2, a, 25).
task(t3, b, 20).
task(t4, b, 10).
task(t5, c, 5).
task(t6, d, 12).
