use Error_registry;
-------------------------------------------------

insert into t_Status (CODE, Status)
values (1, 'New');
insert into t_Status (CODE, Status)
values (2, 'Open');
insert into t_Status (CODE, Status)
values (3, 'Solved');
insert into t_Status (CODE, Status)
values (4, 'Closed');
-------------------------------------------------

insert into t_Urgency (CODE, Urgency)
values (1, 'Very urgent');
insert into t_Urgency (CODE, Urgency)
values (2, 'Urgent');
insert into t_Urgency (CODE, Urgency)
values (3, 'Not urgent');
insert into t_Urgency (CODE, Urgency)
values (4, 'Can wait');
-------------------------------------------------

insert into t_Criticality (CODE, Criticality)
values (1, 'Crash');
insert into t_Criticality (CODE, Criticality)
values (2, 'Critical');
insert into t_Criticality (CODE, Criticality)
values (3, 'Not critical');
insert into t_Criticality (CODE, Criticality)
values (4, 'Edit request');
-------------------------------------------------

insert into t_Users (ID, [User_name], First_name, Last_name, [Password])
values (1, 'Lebowski', 'Jeffrey', 'Lebowski', 'CarpetIsStyle');
insert into t_Users (ID, [User_name], First_name, Last_name, [Password])
values (2, 'Cypher', 'Joe', 'Raegan', 'ActorOrSMTH');
insert into t_Users (ID, [User_name], First_name, Last_name, [Password])
values (3, 'Neo', 'Thomas', 'Anderson', 'FollowTheWhiteRabbit777');
-------------------------------------------------