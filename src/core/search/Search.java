package autochef.core.search;

import autochef.core.ingredients.*;
import autochef.core.database.*;

import java.sql.*;
import java.util.*;

public class Search
{
    public static Collection<IngredientLink> getRecipes(String searchText, String languageID)
    {
        Collection<IngredientLink> links = new LinkedList<IngredientLink>();
        try
        {
            PreparedStatement sqlStatement = DataSource.getConnection().prepareStatement("select * from fn_searchrecipes(?, ?)");

            sqlStatement.setString(1, searchText);
            sqlStatement.setString(2, languageID);

            ResultSet results = sqlStatement.executeQuery();

            while (results.next())
            {
                links.add(new IngredientLink(results.getInt(1), results.getString(2)));
            }
            return links;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public static Collection<IngredientLink> getIngredients(String searchText, String languageID)
    {
        Collection<IngredientLink> links = new LinkedList<IngredientLink>();
        try
        {
            PreparedStatement sqlStatement = DataSource.getConnection().prepareStatement("select * from fn_searchingredients(?, ?)");

            sqlStatement.setString(1, searchText);
            sqlStatement.setString(2, languageID);

            ResultSet results = sqlStatement.executeQuery();

            while (results.next())
            {
                links.add(new IngredientLink(results.getInt(1), results.getString(2)));
            }
            return links;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }
}
