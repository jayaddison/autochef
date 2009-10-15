package autochef.www.content;

import autochef.core.ingredients.*;
import autochef.core.search.*;

import java.util.*;

public class SearchBean
{
    private String query;

    public void setQuery(String value)
    {
        query = value;
    }

    public Collection<IngredientLink> getRecipes()
    {
        return Search.getRecipes(query, "en");
    }

    public Collection<IngredientLink> getIngredients()
    {
        return Search.getIngredients(query, "en");
    }
}
