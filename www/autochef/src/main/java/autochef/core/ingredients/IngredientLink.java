package autochef.core.ingredients;

public class IngredientLink
{
    Integer ingredientID;
    String ingredientName;

    public IngredientLink(Integer ingredientID, String ingredientName)
    {
        this.ingredientID = ingredientID;
        this.ingredientName = ingredientName;
    }

    public Integer getIngredientID()
    {
        return ingredientID;
    }

    public String getIngredientName()
    {
        return ingredientName;
    }
}
