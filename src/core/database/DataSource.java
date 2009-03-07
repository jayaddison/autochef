package autochef.core.database;

import java.io.*;
import java.sql.*;
import java.util.*;

import org.postgresql.ds.*;

public class DataSource
{
    static Properties pr = new Properties();

    static String hostname;
    static String database;
    static String username;
    static String password;

    static
    {
        // Load the database driver
        try
        {
            Class.forName("org.postgresql.Driver");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        // Read application settings
        try
        {
            pr.load(new FileInputStream("/var/lib/tomcat6/webapps/ROOT/WEB-INF/autochef.properties"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        hostname = pr.getProperty("database.hostname");
        database = pr.getProperty("database.catalog");
        username = pr.getProperty("database.username");
        password = pr.getProperty("database.password");
    }

    public static Connection getConnection() throws SQLException
    {
        return DriverManager.getConnection
        (
            "jdbc:postgresql://" + hostname + "/" + database,
            username,
            password
        );
    }
}
