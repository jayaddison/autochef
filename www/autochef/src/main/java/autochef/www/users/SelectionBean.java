package autochef.www.users;

import autochef.core.ingredients.*;

import java.util.*;

public class SelectionBean
{
    Integer selectionCheck;

    SortedSet<Integer> selections = new TreeSet<Integer>();
    SortedSet<Integer> searchSelections = new TreeSet<Integer>();
    SortedSet<Integer> nativeSelections = new TreeSet<Integer>();

    public void setAddSelection(String value)
    {
        Integer ingredientID = new Integer(value);

        selections.add(ingredientID);
    }

    public void setAddSearchSelection(String value)
    {
        Integer ingredientID = new Integer(value);
        
        selections.add(ingredientID);
        searchSelections.add(ingredientID);
    }

    public void setAddNativeSelection(String value)
    {
        Integer ingredientID = new Integer(value);
        
        nativeSelections.add(ingredientID);
    }

    public Collection<Ingredient> getSearchSelections()
    {
        List<Ingredient> results = new LinkedList<Ingredient>();

        for (Integer ingredientID : searchSelections)
        {
            /*
            results.add(Database.getIngredientByID(ingredientID));
            */
        }
        return results;
    }

    void clearSelections()
    {
        selections.clear();
        searchSelections.clear();
        nativeSelections.clear();
    }

    public boolean isSelected()
    {
        return selections.contains(selectionCheck);
    }

    public boolean isNativeSelected()
    {
        return nativeSelections.contains(selectionCheck);
    }

    public void setSelectionCheck(String value)         { selectionCheck = new Integer(value); }
    Collection<Integer> getNativeSelections()           { return nativeSelections; }
    Collection<Integer> getSelections()                 { return selections; }
}
