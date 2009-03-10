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
            PreparedStatement sqlStatement = c.prepareStatement("select fn_logexit(?, ?, ?)");

            sqlStatement.setString(1, sourceid);
            sqlStatement.setString(2, supplierid);
            sqlStatement.setString(3, ingredientid);

            sqlStatement.executeUpdate();
            c.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
