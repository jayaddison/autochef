package autochef.www.users;

import autochef.core.ingredients.*;

import java.util.*;

public class SubmissionBean
{
    SelectionBean selectionBean;

    int recipeDuration;
    String recipeName;

    int stepDuration;
    String stepName;
    String stepInstructions;

    int stepID = 0;
    List<Ingredient> steps = new LinkedList<Ingredient>();
    Map<Integer, Collection<Integer>> nativeDependencies = new TreeMap<Integer, Collection<Integer>>();
    Map<Integer, Collection<Integer>> qualifiedDependencies = new TreeMap<Integer, Collection<Integer>>();

    public void setAddStep(String value)
    {
        Collection<Integer> nativeStepIngredients = new LinkedList<Integer>(selectionBean.getNativeSelections());
        Collection<Integer> qualifiedStepIngredients = new LinkedList<Integer>(selectionBean.getSelections());

        steps.add(new Ingredient(stepID, stepName, stepInstructions, stepDuration));
        nativeDependencies.put(new Integer(stepID), nativeStepIngredients);
        qualifiedDependencies.put(new Integer(stepID), qualifiedStepIngredients);

        selectionBean.clearSelections();
        stepID++;
    }

    public void setSubmitRecipe(String value)
    {
        Map<Integer, Integer> stepKeyMap = new TreeMap<Integer, Integer>();

        /*
        // insert steps into database, retrieving the inserted key ids
        for (Ingredient step : steps)
        {
            Integer nativeIngredientID = new Integer(step.getIngredientID());
            Integer qualifiedIngredientID = Database.addIngredient(step);

            stepKeyMap.put(nativeIngredientID, qualifiedIngredientID);
        }

        // insert dependencies from nativedeps, matched up via stepKeyMap
        for (Integer nativeStepID : nativeDependencies.keySet())
        {
            for (Integer nativeDepID : nativeDependencies.get(nativeStepID))
            {
                Database.addDependency(stepKeyMap.get(nativeStepID), stepKeyMap.get(nativeDepID));
            }
        }

        // insert dependencies for qualified items
        for (Integer qualifiedStepID : qualifiedDependencies.keySet())
        {
            for (Integer qualifiedDepID : qualifiedDependencies.get(qualifiedStepID))
            {
                Database.addDependency(qualifiedStepID, qualifiedDepID);
            }
        }
        */

        selectionBean.clearSelections();
        nativeDependencies.clear();
        qualifiedDependencies.clear();
        steps.clear();
        stepID = 0;
    }

    public void setRecipeName(String value)                     { recipeName = value; }
    public void setStepName(String value)                       { stepName = value; }
    public void setStepDuration(String value)                   { stepDuration = Integer.parseInt(value); }
    public void setStepInstructions(String value)               { stepInstructions = value; }
    public void setSelectionBean(SelectionBean selectionBean)   { this.selectionBean = selectionBean; }
    public Collection<Ingredient> getSteps()                    { return steps; }
}
