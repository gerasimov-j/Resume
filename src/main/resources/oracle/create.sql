CREATE SEQUENCE seq_sex START WITH 1;

create table sex (
  id number DEFAULT seq_sex.nextval NOT NULL ,
  name varchar2(20) not null); 

ALTER TABLE sex ADD (
  CONSTRAINT pk_sex PRIMARY KEY (ID));

CREATE SEQUENCE seq_technologies START WITH 1;
create table technologies (
  id  number DEFAULT seq_technologies.nextval NOT NULL,
  name varchar2(20) not null
);
ALTER TABLE technologies ADD (
  CONSTRAINT pk_technologies PRIMARY KEY (ID));


CREATE SEQUENCE seq_type_of_contact START WITH 1;
create table type_of_contact (
  id  number DEFAULT seq_type_of_contact.nextval NOT NULL,
  name varchar2(20) not null
);
ALTER TABLE type_of_contact ADD (
  CONSTRAINT pk_type_of_contact PRIMARY KEY (ID));

CREATE SEQUENCE seq_people START WITH 1;
create table people (
  id  number DEFAULT seq_people.nextval NOT NULL,
  last_name varchar2(50) not null,
  first_name varchar2(50) not null,
  middle_name varchar2(50),
  birthday date,
  sex_id number);
ALTER TABLE people ADD (
  CONSTRAINT pk_people PRIMARY KEY (ID));
ALTER TABLE people ADD (
  CONSTRAINT fk_people_sex
  FOREIGN KEY (sex_id) REFERENCES sex (id));


CREATE SEQUENCE seq_people_technologies START WITH 1;
create table people_technologies (
  id  number DEFAULT seq_people_technologies.nextval NOT NULL,
  person_id number not null,
  technology_id number not null);
ALTER TABLE people_technologies ADD (
  CONSTRAINT pk_people_technologies PRIMARY KEY (ID));
ALTER TABLE people_technologies ADD (
  CONSTRAINT fk_people_tech_people
  FOREIGN KEY (person_id) REFERENCES people (id));
ALTER TABLE people_technologies ADD (
  CONSTRAINT fk_people_tech_tech
  FOREIGN KEY (technology_id) REFERENCES people (id));

CREATE SEQUENCE seq_contacts START WITH 1;
create table contacts (
  id  number DEFAULT seq_contacts.nextval NOT NULL,
  person_id number not null,
  type_of_contact_id number not null,
  contact_value varchar2(50) not null);
ALTER TABLE contacts ADD (
  CONSTRAINT pk_contacts PRIMARY KEY (ID));
ALTER TABLE contacts ADD (
  CONSTRAINT fk_contacts_people
  FOREIGN KEY (person_id) REFERENCES people (id));
ALTER TABLE contacts ADD (
  CONSTRAINT fk_contacts_cont
  FOREIGN KEY (type_of_contact_id) REFERENCES type_of_contact (id));
