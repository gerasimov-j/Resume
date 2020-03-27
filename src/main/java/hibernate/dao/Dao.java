package hibernate.dao;

import utils.HibernateUtil;
import java.util.List;
import org.hibernate.Session;

public class Dao {

    public <T> List<T> getList(Class<T> tClass, String query) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.createSQLQuery(query).addEntity(tClass).list();
        }
    }

    public <T> T getFirst(Class<T> tClass, String query) {
        return getList(tClass, query).get(0);
    }
}
