insert into sex (id, name)
  values (1, "Мужской"),
         (2, "Женский"),
         (3, "Другой");

insert into technologies (id, name)
  values (1, "Java Core"),
         (2, "Java EE"),
         (3, "Git"),
         (4, "Spring Boot"),
         (5, "HTML"),
         (6, "Maven"),
         (7, "JPA/Hibernate"),
         (8, "Spring"),
         (9, "REST");

insert into people (id, last_name, first_name, middle_name, birthday, sex_id)
  values (1, "Петров", "Петр", "Петрович", TO_DATE('12/12/1986', 'DD/MM/YYYY'), 1),
         (2, "Иванов", "Иван", "Иванович", TO_DATE('04/04/1997', 'DD/MM/YYYY'), 1),
         (3, "Морская", "Мария", "Васильевна", TO_DATE('07/11/1999', 'DD/MM/YYYY'), 2);

insert into people_technologies (person_id, technology_id)
  values (1, 3),
         (1, 4),
         (1, 5),
         (2, 3),
         (2, 2),
         (2, 1),
         (3, 6),
         (3, 9),
         (3, 8);

insert into type_of_contact (id, name)
  values (1, "Телефон"),
         (2, "Email"),
         (3, "Skype"),
         (4, "Git"),
         (5, "LinkedIn"),
         (6, "Другое");

insert into contacts (person_id, type_of_contact_id, contact_value)
  values (1, 1, "+375(29)123-45-67"),
         (1, 4, "http://github.com/petya"),
         (1, 2, "petrovich@gmail.com"),
         (2, 1, "+375(29)87-65-43"),
         (2, 4, "http://github.com/vanya"),
         (2, 3, "skype:ivanko"),
         (3, 1, "+375(29)999-99-99"),
         (3, 5, "https://www.linkedin.com/in/mariya/");