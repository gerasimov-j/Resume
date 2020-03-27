create table sex (
  id number(10) not null,
  name varchar2(20) not null,
  primary key (id)
);

-- Generate ID using sequence and trigger
create sequence sex_seq start with 1 increment by 1;

create or replace trigger sex_seq_tr
 before insert on sex for each row
 when (new.id is null)
begin
 select sex_seq.nextval into :new.id from dual;
end;
/

create table technologies (
  id number(10) not null,
  name varchar2(20) not null,
  primary key (id)
);

-- Generate ID using sequence and trigger
create sequence technologies_seq start with 1 increment by 1;

create or replace trigger technologies_seq_tr
 before insert on technologies for each row
 when (new.id is null)
begin
 select technologies_seq.nextval into :new.id from dual;
end;
/

create table type_of_contact (
  id number(10) not null,
  name varchar2(20) not null,
  primary key (id)
);

-- Generate ID using sequence and trigger
create sequence type_of_contact_seq start with 1 increment by 1;

create or replace trigger type_of_contact_seq_tr
 before insert on type_of_contact for each row
 when (new.id is null)
begin
 select type_of_contact_seq.nextval into :new.id from dual;
end;
/

create table people (
  id number(10) not null,
  last_name varchar2(50) not null,
  first_name varchar2(50) not null,
  middle_name varchar2(50),
  birthday date,
  sex_id number(10),
  primary key (id),
  foreign key (sex_id) references sex (id)
);

-- Generate ID using sequence and trigger
create sequence people_seq start with 1 increment by 1;

create or replace trigger people_seq_tr
 before insert on people for each row
 when (new.id is null)
begin
 select people_seq.nextval into :new.id from dual;
end;
/

create table people_technologies (
  id number(10) not null,
  person_id number(10) not null,
  technology_id number(10) not null,
  primary key (id),
  foreign key (person_id) references people (id),
  foreign key (technology_id) references technologies (id)
);

-- Generate ID using sequence and trigger
create sequence people_technologies_seq start with 1 increment by 1;

create or replace trigger people_technologies_seq_tr
 before insert on people_technologies for each row
 when (new.id is null)
begin
 select people_technologies_seq.nextval into :new.id from dual;
end;
/

create table contacts (
  id number(10) not null,
  person_id number(10) not null,
  type_of_contact_id number(10) not null,
  contact_value varchar2(50) not null,
  primary key (id),
  foreign key (person_id) references people (id),
  foreign key (type_of_contact_id) references type_of_contact (id)
);

-- Generate ID using sequence and trigger
create sequence contacts_seq start with 1 increment by 1;

create or replace trigger contacts_seq_tr
 before insert on contacts for each row
 when (new.id is null)
begin
 select contacts_seq.nextval into :new.id from dual;
end;
/
