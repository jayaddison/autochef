package autochef.core.logging;

import autochef.core.database.*;

import java.sql.*;

public class Searches
{
    public static void logData(String domainid, String searchtext)
    {
        try
        {
            PreparedStatement sqlStatement = DataSource.getConnection().prepareStatement("select fn_logsearch(?, ?)");

            sqlStatement.setString(1, domainid);
            sqlStatement.setString(2, searchtext);

            sqlStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

}
