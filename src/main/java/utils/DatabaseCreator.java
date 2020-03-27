package utils;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import org.apache.log4j.Logger;

public class DatabaseCreator {

    private static final Logger LOGGER = Logger.getLogger(DatabaseCreator.class);
    private ConnectionManager connectionManager;
    private Statement statement;

    public DatabaseCreator() {
        connectionManager = new ConnectionManager();
    }

    public DatabaseCreator(ConnectionManager manager) {
        connectionManager = manager;
    }

    public void create() {
        executeUpdate(QueryManager.getCreateQuery());
    }

    public void insert() {
        executeUpdate(QueryManager.getInsertQuery());
    }

    public void drop() {
        executeUpdate(QueryManager.getDropQuery());
    }

    private void executeUpdate(String queriesLine) {
        try (Connection connection = connectionManager.getConnection()) {
            statement = connection.createStatement();
            String[] queries = queriesLine.split(";");
            for (String query : queries) {
                executeUpdateWithLog(query);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void executeUpdateWithLog(String query) {
        try {
            LOGGER.info(query);
            statement.executeUpdate(query);
        } catch (SQLException e) {
            LOGGER.warn(e.getMessage());
        }
    }
}
