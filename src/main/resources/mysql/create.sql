create table sex (
  id int not null auto_increment,
  name varchar(20) not null,
  primary key (id)
);

create table technologies (
  id int not null auto_increment,
  name varchar(20) not null,
  primary key (id)
);

create table type_of_contact (
  id int not null auto_increment,
  name varchar(20) not null,
  primary key (id)
);

create table people (
  id int not null auto_increment,
  last_name varchar(50) not null,
  first_name varchar(50) not null,
  middle_name varchar(50),
  birthday date,
  sex_id int,
  primary key (id),
  foreign key (sex_id) references sex (id)
);

create table people_technologies (
  id int not null auto_increment,
  person_id int not null,
  technology_id int not null,
  primary key (id),
  foreign key (person_id) references people (id),
  foreign key (technology_id) references technologies (id)
);

create table contacts (
  id int not null auto_increment,
  person_id int not null,
  type_of_contact_id int not null,
  contact_value varchar(50) not null,
  primary key (id),
  foreign key (person_id) references people (id),
  foreign key (type_of_contact_id) references type_of_contact (id)
);
