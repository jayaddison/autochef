package autochef.www.content;

import autochef.www.users.*;
import autochef.core.ingredients.*;

import java.util.*;

public class RecipeBean
{
    UserBean userBean;

    RecipeIngredient recipe;
    Collection<RecipeIngredient> recipeSteps = new LinkedList<RecipeIngredient>();
    Set<Ingredient> availableIngredients = new TreeSet<Ingredient>();
    Set<Ingredient> unavailableIngredients = new TreeSet<Ingredient>();

    int preparationTime;

    public void setUserBean(UserBean userBean)
    {
        this.userBean = userBean;
    }

    public void setRecipeID(String value)
    {
        Integer recipeID = new Integer(value);
        LinkedList<RecipeIngredient> ingredients = userBean.getRecipeIngredients(recipeID);

	recipe = ingredients.removeLast();

        for (RecipeIngredient ingredient : ingredients)
        {
            Boolean availability = ingredient.getAvailability();
            if (availability == Boolean.TRUE)
            {
                availableIngredients.add(ingredient);
            }
            else if (availability == Boolean.FALSE)
            {
                unavailableIngredients.add(ingredient);
            }
            else
            {
                recipeSteps.add(ingredient);
            }
        }
    }

    public Collection<RecipeIngredient> getRecipeSteps()              { return recipeSteps; }
    public Collection<Ingredient> getAvailableIngredients()     { return availableIngredients; }
    public Collection<Ingredient> getUnavailableIngredients()   { return unavailableIngredients; }
    public String getPreparationTime()                          { return recipe.getStartTime(); }
    public Ingredient getRecipe()                               { return recipe; }
}
