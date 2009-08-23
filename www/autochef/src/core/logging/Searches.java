package autochef.core.logging;

import autochef.core.database.*;

import java.sql.*;

public class Searches
{
    public static void logData(String domainid, String searchtext)
    {
        try
        {
            Connection c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select fn_logsearch(?)");

            sqlStatement.setString(1, searchtext);

            sqlStatement.executeUpdate();
            c.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

}
