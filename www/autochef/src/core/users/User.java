package autochef.core.users;

import autochef.core.ingredients.*;
import autochef.core.database.*;

import java.sql.*;
import java.util.*;

import org.postgresql.util.*;

public class User
{
    String username;
    String languageID = "en";

    public void login(String username, String password)
    {
        try
        {
            Connection c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select fn_login(?, ?)");

            sqlStatement.setString(1, username);
            sqlStatement.setString(2, password);

            ResultSet results = sqlStatement.executeQuery();

            if (results.next())
            {
                this.username = results.getString("fn_login");
            }
            c.close();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }
    }

    public void logout()
    {
        username = null;
    }

    public String getUsername()
    {
        return username;
    }

    public String getLanguageID()
    {
        return languageID;
    }

    public Collection<IngredientLink> getIngredients()
    {
        Collection<IngredientLink> ingredients = new LinkedList<IngredientLink>();

        Connection c;
        try
        {
            c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select * from fn_useringredients(?, ?)");

            sqlStatement.setString(1, username);
            sqlStatement.setString(2, languageID);

            ResultSet results = sqlStatement.executeQuery();

            Integer ingredientID;
            String ingredientName;

            while (results.next())
            {
                ingredientID = results.getInt("ingredientid");
                ingredientName = results.getString("ingredientname");

                ingredients.add(new IngredientLink(ingredientID, ingredientName));
            }
            c.close();
            return ingredients;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public Collection<IngredientLink> getRecipes()
    {
        Collection<IngredientLink> recipes = new LinkedList<IngredientLink>();

        Connection c;
        try
        {
            c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select * from fn_userrecipes(?, ?)");

            sqlStatement.setString(1, username);
            sqlStatement.setString(2, languageID);

            ResultSet results = sqlStatement.executeQuery();

            Integer ingredientID;
            String ingredientName;

            while (results.next())
            {
                ingredientID = results.getInt("ingredientid");
                ingredientName = results.getString("ingredientname");

                recipes.add(new IngredientLink(ingredientID, ingredientName));
            }
            c.close();
            return recipes;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public LinkedList<RecipeIngredient> getRecipeIngredients(Integer recipeID)
    {
        LinkedList<RecipeIngredient> ingredients = new LinkedList<RecipeIngredient>();

        Connection c;
        try
        {
            c = DataSource.getConnection();
            PreparedStatement sqlStatement = c.prepareStatement("select * from fn_userrecipeingredients(?, ?, ?)");

            sqlStatement.setString(1, username);
            sqlStatement.setInt(2, recipeID);
            sqlStatement.setString(3, languageID);

            ResultSet results = sqlStatement.executeQuery();

            Integer ingredientID;
            String ingredientName;
            String instructions;
            PGInterval duration;
            PGInterval startTime;
            Boolean available;

            while (results.next())
            {
                ingredientID = results.getInt("ingredientid");
                ingredientName = results.getString("ingredientname");
                instructions = results.getString("instructions");
                duration = (PGInterval)results.getObject("duration");
                startTime = (PGInterval)results.getObject("starttime");
                available = results.getBoolean("available");
                if (results.wasNull()) available = null;

                ingredients.add(new RecipeIngredient(ingredientID, ingredientName, instructions, duration.getMinutes(), startTime.getMinutes(), available));
            }
            c.close();
            return ingredients;
        }
        catch (SQLException e)
        {
            e.printStackTrace();
            return null;
        }
    }

    public void addIngredients(Collection<Integer> ingredientIDs)
    {
    }

    public void removeIngredient(Integer ingredientIDs)
    {
    }
}
