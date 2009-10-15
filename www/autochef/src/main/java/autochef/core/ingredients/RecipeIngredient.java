package autochef.core.ingredients;

public class RecipeIngredient extends Ingredient
{
    int startTime;
    Boolean available;

    public RecipeIngredient(int ingredientID, String ingredientName, String instructions, int duration, int startTime, Boolean available)
    {
        super(ingredientID, ingredientName, instructions, duration);
        this.startTime = startTime;
        this.available = available;
    }

    public Boolean getAvailability()
    {
        return available;
    }

    public String getStartTime()
    {
        return Integer.toString(startTime);
    }
}
