use master
go

create database Error_registry
go

use Error_registry;

create table t_Users (
	ID			tinyint   not null,
	[User_name] nchar(20) not null,
	First_name  nchar(20) not null,
	Last_name   nchar(20) not null,
	[Password]  nchar(25) not null,

	constraint PK_User_ID primary key clustered (ID)
)

create table t_Status (
	CODE     tinyint   not null,
	[Status] nchar(20) not null,

	constraint PK_Status_CODE primary key clustered (CODE)
)

create table t_Urgency (
	CODE	tinyint   not null,
	Urgency nchar(20) not null,

	constraint PK_Urgency_CODE primary key clustered (CODE)
)

create table t_Criticality (
	CODE		tinyint   not null,
	Criticality nchar(20) not null,

	constraint PK_Criticality_CODE primary key clustered (CODE)
)

create table t_Errors (
	ID				 tinyint	not null,
	Date_registered  datetime	not null,
	Short_comment    nchar(99)	not null,
	Full_description nchar(999) not null,
	Registered_by    tinyint	not null,
	[Status]		 tinyint	not null,
	Urgency			 tinyint	not null,
	Criticality		 tinyint	not null,

	constraint PK_Error_ID		primary key clustered (ID),
	constraint FK_Registered_by foreign key (Registered_by)
		references t_Users (ID),
	constraint FK_Status   		foreign key ([Status])
		references t_Status (CODE),
	constraint FK_Urgency		foreign key (Urgency)
		references t_Urgency (CODE),
	constraint FK_Criticality	foreign key (Criticality)
		references t_Criticality (CODE)
);

create table t_Error_history (
	ID			tinyint	  not null,
	Date_edited datetime  not null,
	[Action]	nchar(10) not null,
	Comment		nchar(99) not null,
	By_user		tinyint	  not null,

	constraint FK_Error foreign key (ID)
		references t_Errors (ID),
	constraint FK_User foreign key (By_user)
		references t_Users (ID),
);