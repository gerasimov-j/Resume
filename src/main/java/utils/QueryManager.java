package utils;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class QueryManager {

    private static final String CREATE_PATH = System.getProperty("user.dir") + "/src/main/resources/sql/create.sql";
    private static final String INSERT_PATH = System.getProperty("user.dir") + "/src/main/resources/sql/insert.sql";
    private static final String DROP_PATH = System.getProperty("user.dir") + "/src/main/resources/sql/drop.sql";

    private static String getQuery(String path) {
        StringBuilder result = new StringBuilder();
        try {
            Files.lines(Paths.get(path)).forEach(result::append);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result.toString();
    }

    public static String getCreateQuery() {
        return getQuery(CREATE_PATH);
    }
    public static String getInsertQuery() {
        return getQuery(INSERT_PATH);
    }
    public static String getDropQuery() {
        return getQuery(DROP_PATH);
    }
}
