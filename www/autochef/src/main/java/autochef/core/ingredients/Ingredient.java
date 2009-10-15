package autochef.core.ingredients;

public class Ingredient implements Comparable<Ingredient>
{
    int ingredientID;
    String ingredientName;
    String instructions;
    int duration;

    public Ingredient(int ingredientID, String ingredientName, String instructions, int duration)
    {
        this.ingredientID = ingredientID;
        this.ingredientName = ingredientName;
        this.instructions = instructions;
        this.duration = duration;
    }

    public int compareTo(Ingredient i)
    {
        return (ingredientID == i.ingredientID ? 0 : (ingredientID < i.ingredientID ? -1 : 1));
    }

    public String getIngredientID()             { return Integer.toString(ingredientID); }
    public String getIngredientName()           { return ingredientName; }
    public String getInstructions()             { return instructions; }
    public String getDuration()                 { return Integer.toString(duration); }
}
