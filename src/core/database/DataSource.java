package autochef.core.database;

import java.sql.*;

import org.postgresql.ds.*;

public class DataSource
{
    /*
    static PGPoolingDataSource ds = new PGPoolingDataSource();
    */
    static
    {
        try
        {
            Class.forName("org.postgresql.Driver");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        /*
        ds.setServerName("localhost");

        ds.setDatabaseName("autochef");
        ds.setUser("tomcat55");
        ds.setPassword(null);

        ds.setMaxConnections(10);
        */
    }

    public static Connection getConnection() throws SQLException
    {
        //return ds.getConnection();

        return DriverManager.getConnection("jdbc:postgresql://localhost/autochef", "tomcat55", null);
    }
}
