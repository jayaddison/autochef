package autochef.core.recipes;

import autochef.core.ingredients.*;
import autochef.core.database.*;

import java.sql.*;
import java.util.*;

public class RandomRecipes
{
    public static Collection<IngredientLink> getRecipes(String languageID)
    {
        Collection<IngredientLink> links = new LinkedList<IngredientLink>();

        try
        {
            Connection c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select * from fn_randomrecipes(?)");

            sqlStatement.setString(1, languageID);

            ResultSet results = sqlStatement.executeQuery();

            while (results.next())
            {
                links.add(new IngredientLink(results.getInt(1), results.getString(2)));
            }
            c.close();
            return links;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
}
