package utils;

import utils.ConnectionManager;
import hibernate.model.Contact;
import hibernate.model.ContactType;
import hibernate.model.Person;
import hibernate.model.Sex;
import hibernate.model.Technology;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Environment;

public class HibernateUtil {

    private static StandardServiceRegistry registry;
    private static SessionFactory sessionFactory;

    public static void buildSessionFactory() {
        if (sessionFactory == null) {
            try {
                StandardServiceRegistryBuilder registryBuilder = new StandardServiceRegistryBuilder();
                Map<String, Object> settings = new HashMap<>();
                settings.put(Environment.DRIVER, "oracle.jdbc.OracleDriver");
                settings.put(Environment.URL, ConnectionManager.getURL());
                settings.put(Environment.USER, ConnectionManager.getUser());
                settings.put(Environment.PASS, ConnectionManager.getPassword());
                settings.put(Environment.HBM2DDL_AUTO, "update");
                settings.put(Environment.SHOW_SQL, true);
                settings.put(Environment.ENABLE_LAZY_LOAD_NO_TRANS, true);
                registryBuilder.applySettings(settings);
                registry = registryBuilder.build();
                MetadataSources sources = new MetadataSources(registry);
                sources.addAnnotatedClass(Person.class);
                sources.addAnnotatedClass(Sex.class);
                sources.addAnnotatedClass(Technology.class);
                sources.addAnnotatedClass(ContactType.class);
                sources.addAnnotatedClass(Contact.class);
                Metadata metadata = sources.getMetadataBuilder().build();
                sessionFactory = metadata.getSessionFactoryBuilder().build();
            } catch (Exception e) {
                shutdown();
                e.printStackTrace();
            }
        }
    }

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) {
            buildSessionFactory();
        }
        return sessionFactory;
    }

    public static void shutdown() {
        if (registry != null) {
            StandardServiceRegistryBuilder.destroy(registry);
        }
        if (sessionFactory != null) {
            sessionFactory.close();
        }
    }

}