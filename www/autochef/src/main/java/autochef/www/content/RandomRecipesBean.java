package autochef.www.content;

import autochef.core.ingredients.*;
import autochef.core.recipes.*;

import java.util.*;

public class RandomRecipesBean
{
    public Collection<IngredientLink> getRecipes()
    {
        return RandomRecipes.getRecipes("en");
    }
}
