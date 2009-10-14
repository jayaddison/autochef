<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="randomRecipesBean" class="autochef.www.content.RandomRecipesBean" />

<h3>Random recipes</h3>
<c:forEach var="recipe" items="${randomRecipesBean.recipes}">
<div style="width: 250px; float: left;">
<div><a href="recipe.jsp?recipeID=${recipe.ingredientID}"><img src="images/${recipe.ingredientID}/default.jpg" /></a></div>
<div><a href="recipe.jsp?recipeID=${recipe.ingredientID}"><em>${recipe.ingredientName}</em></a></div>
</div>
</c:forEach>
