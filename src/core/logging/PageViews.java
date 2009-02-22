package autochef.core.logging;

import autochef.core.database.*;

import java.sql.*;

public class PageViews
{
    public static void logData(String serverip, String clientip, String requesturl, String referer, String useragent, String acceptlanguage)
    {
        try
        {
            Connection c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select fn_logpageview(?, ?, ?, ?, ?, ?)");

            sqlStatement.setString(1, serverip);
            sqlStatement.setString(2, clientip);
            sqlStatement.setString(3, requesturl);
            sqlStatement.setString(4, referer);
            sqlStatement.setString(5, useragent);
            sqlStatement.setString(6, acceptlanguage);

            sqlStatement.executeQuery();
            c.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }
}
