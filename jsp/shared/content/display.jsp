<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="userBean" scope="session" class="autochef.www.users.UserBean" />
<jsp:useBean id="recipeBean" scope="request" class="autochef.www.content.RecipeBean" />
<% recipeBean.setUserBean(userBean); %>
<jsp:setProperty name="recipeBean" property="*" />

<table>
<tr>
<td>
<img align="right" src="images/${recipeBean.recipe.ingredientID}/default.jpg" />
<h3>${recipeBean.recipe.ingredientName}</h3>
<div><strong>Ingredients:</strong></div>
<ul>
<c:forEach var="recipe" items="${recipeBean.availableIngredients}">
<li class="available"><div>${recipe.ingredientName}</div></li>
</c:forEach>
<c:forEach var="recipe" items="${recipeBean.unavailableIngredients}">
<li class="unavailable"><div>${recipe.ingredientName}</div></li>
</c:forEach>
</ul>
<div><strong>Servings: 2</strong></div>
<div><strong>Preparation Time: ${recipeBean.preparationTime} minutes</strong></div>
<c:if test="${not empty recipeBean.unavailableIngredients}">
<br />
<a href="">add missing ingredients to shopping list</a>
</c:if>
</td>
</tr>
<c:forEach var="recipe" items="${recipeBean.recipeSteps}" varStatus="status">
<tr><td><div><strong>Step ${status.count} - ${recipe.ingredientName}</strong></div></td></tr>
</c:forEach>
</table>

<script>
var steps = new Array()
var starttimes = new Array();
var durations = new Array();

<c:forEach var="recipe" items="${recipeBean.recipeSteps}" varStatus="status">
steps[${status.index}] = "${recipe.ingredientName}";
starttimes[${status.index}] = ${recipe.startTime};
durations[${status.index}] = ${recipe.duration};
</c:forEach>

function coordinates(control)
{
    var top = left = 0;
    if (control.offsetParent)
    {
        top = control.offsetTop
        left = control.offsetLeft

        while (control = control.offsetParent)
        {
            top += control.offsetTop
            left += control.offsetLeft
        }
    }
    return [top, left];
}

function ingredientOptions(control, ingredientID)
{
    var coords = coordinates(control);

    var tooltip = document.createElement("div");
    tooltip.appendChild(document.createTextNode("lols"));
    tooltip.style.position = "absolute";
    tooltip.style.top = coords[0] + control.offsetHeight + "px";
    tooltip.style.left = coords[1] + "px";
    tooltip.style.backgroundColor = "silver";
    control.appendChild(tooltip);

    return false;
}
</script>
