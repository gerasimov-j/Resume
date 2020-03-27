insert into sex (id, name)
   select 1, "Мужской" from dual union all
          select 2, "Женский" from dual union all
          select 3, "Другой" from dual;

insert into technologies (id, name)
   select 1, "Java Core" from dual union all
          select 2, "Java EE" from dual union all
          select 3, "Git" from dual union all
          select 4, "Spring Boot" from dual union all
          select 5, "HTML" from dual union all
          select 6, "Maven" from dual union all
          select 7, "JPA/Hibernate" from dual union all
          select 8, "Spring" from dual union all
          select 9, "REST" from dual;

insert into people (id, last_name, first_name, middle_name, birthday, sex_id)
   select 1, "Петров", "Петр", "Петрович", TO_DATE('12/12/1986', 'DD/MM/YYYY'), 1 from dual union all
          select 2, "Иванов", "Иван", "Иванович", TO_DATE('04/04/1997', 'DD/MM/YYYY'), 1 from dual union all
          select 3, "Морская", "Мария", "Васильевна", TO_DATE('07/11/1999', 'DD/MM/YYYY'), 2 from dual;

insert into people_technologies (person_id, technology_id)
   select 1, 3 from dual union all
          select 1, 4 from dual union all
          select 1, 5 from dual union all
          select 2, 3 from dual union all
          select 2, 2 from dual union all
          select 2, 1 from dual union all
          select 3, 6 from dual union all
          select 3, 9 from dual union all
          select 3, 8 from dual;

insert into type_of_contact (id, name)
   select 1, "Телефон" from dual union all
          select 2, "Email" from dual union all
          select 3, "Skype" from dual union all
          select 4, "Git" from dual union all
          select 5, "LinkedIn" from dual union all
          select 6, "Другое" from dual;

insert into contacts (person_id, type_of_contact_id, contact_value)
   select 1, 1, "+375(29)123-45-67" from dual union all
          select 1, 4, "http://github.com/petya" from dual union all
          select 1, 2, "petrovich@gmail.com" from dual union all
          select 2, 1, "+375(29)87-65-43" from dual union all
          select 2, 4, "http://github.com/vanya" from dual union all
          select 2, 3, "skype:ivanko" from dual union all
          select 3, 1, "+375(29)999-99-99" from dual union all
          select 3, 5, "https://www.linkedin.com/in/mariya/" from dual;