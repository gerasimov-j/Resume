package hibernate.queries;

import static org.junit.Assert.assertEquals;

import hibernate.dao.Dao;
import hibernate.model.Person;
import hibernate.model.Sex;
import java.util.List;
import org.junit.Test;

public class QueryBuilderTest {

    Dao dao = new Dao();
    QueryBuilder builder = new OracleQueryBuilder();

    @Test
    public void getMaria() {
        builder.clear();
        builder = builder.select().setTable("people").where()
            .equal("last_name", "Морская").and()
            .equal("first_name", "Мария").and()
            .equal("middle_name", "Васильевна");
        Person person = dao.getFirst(Person.class, builder.getQuery());
        builder.clear();
        assertEquals(person.getLastName(), "Морская");
        assertEquals(person.getFirstName(), "Мария");
        assertEquals(person.getMiddleName(), "Васильевна");
    }

    @Test
    public void getOvOrWomen() {
        builder.clear();
        builder = builder.select().setTable("sex").where().equal("name", "Женский");
        Sex women = dao.getFirst(Sex.class, builder.getQuery());
        builder.clear();
        builder = builder.select().setTable("people").where()
            .like("last_name", "%ов").or()
            .equal("sex_id", Long.toString(women.getId()));
        List<Person> people = dao.getList(Person.class, builder.getQuery());
        builder.clear();
        List<Person> allPeople = dao.getList(Person.class, builder.select().setTable("people").getQuery());
        builder.clear();
        assertEquals(people, allPeople);
    }
}