package autochef.core.database;

import java.io.*;
import java.sql.*;
import java.util.*;

import org.postgresql.ds.*;

public class DataSource
{
    static PGPoolingDataSource ds = new PGPoolingDataSource();
    static Properties pr = new Properties();

    static
    {
        // Read application settings
        try
        {
            pr.load(new FileInputStream("/var/lib/tomcat6/webapps/ROOT/WEB-INF/autochef.properties"));
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        // Load the database driver
        try
        {
            Class.forName("org.postgresql.Driver");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        ds.setServerName(pr.getProperty("database.hostname"));
        ds.setDatabaseName(pr.getProperty("database.catalog"));
        ds.setUser(pr.getProperty("database.username"));
        ds.setPassword(pr.getProperty("database.password"));

        ds.setMaxConnections(20);
    }

    public static Connection getConnection() throws SQLException
    {
        return ds.getConnection();
    }
}
