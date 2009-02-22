package autochef.core.logging;

import autochef.core.database.*;

import java.sql.*;

public class Exits
{
    public static void logData(String pageviewid, String sourceid, String supplierid, String ingredientid)
    {
        try
        {
            Connection c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select fn_logexit(?, ?, ?, ?)");

            sqlStatement.setString(1, pageviewid);
            sqlStatement.setString(2, sourceid);
            sqlStatement.setString(3, supplierid);
            sqlStatement.setString(4, ingredientid);

            sqlStatement.executeUpdate();
            c.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
