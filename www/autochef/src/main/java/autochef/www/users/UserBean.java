package autochef.www.users;

import autochef.core.ingredients.*;
import autochef.core.users.*;

import java.util.*;

public class UserBean
{
    SelectionBean selectionBean;

    User user = new User();
    String username;
    String password;

    public String getUsername()
    {
        if (user.getUsername() == null && username != null && password != null)
        {
            user.login(username, password);

            username = null;
            password = null;
        }
        return user.getUsername();
    }

    public String getLanguageID()
    {
        return user.getLanguageID();
    }

    public void logout()
    {
        user.logout();
    }

    public Collection<IngredientLink> getIngredients()
    {
        return user.getIngredients();
    }

    public Collection<IngredientLink> getRecipes()
    {
        return user.getRecipes();
    }

    public LinkedList<RecipeIngredient> getRecipeIngredients(Integer recipeID)
    {
        return user.getRecipeIngredients(recipeID);
    }

    public void setAddIngredients(String value)
    {
        user.addIngredients(selectionBean.getSelections());
    }

    public void setRemoveIngredient(String value)
    {
        Integer ingredientID = new Integer(value);
        user.removeIngredient(ingredientID);
    }

    public void setSelectionBean(SelectionBean selectionBean)   { this.selectionBean = selectionBean; }
    public void setUsername(String value)                       { username = value; }
    public void setPassword(String value)                       { password = value; }
}
