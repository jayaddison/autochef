package autochef.core.logging;

import autochef.core.database.*;

import java.sql.*;

public class Events
{
    public static void logData(String severity, String component, String event, String message)
    {
        try
        {
            PreparedStatement sqlStatement = DataSource.getConnection().prepareStatement("select fn_logevent(?, ?, ?, ?)");

            sqlStatement.setString(1, severity);
            sqlStatement.setString(2, component);
            sqlStatement.setString(3, event);
            sqlStatement.setString(4, message);

            sqlStatement.executeUpdate();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
