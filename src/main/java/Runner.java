import hibernate.dao.Dao;
import hibernate.model.Person;
import hibernate.queries.OracleQueryBuilder;
import hibernate.queries.QueryBuilder;
import java.util.List;
import utils.DatabaseCreator;

public class Runner {

    public static void main(String[] args) {
        createDB();
        QueryBuilder builder = new OracleQueryBuilder().select().setTable("people").where()
            .equal("last_name", "Петров").or()
            .equal("last_name", "Иванов");
        Dao dao = new Dao();
        List<Person> people = dao.getList(Person.class, builder.getQuery());
        for (Person person : people) {
            System.out.println(person.toString() + " : " + person.getContacts());
        }
    }

    private static void createDB() {
        DatabaseCreator creator = new DatabaseCreator();
        creator.drop();
        creator.create();
        creator.insert();
    }
}
