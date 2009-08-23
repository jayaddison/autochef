<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="randomRecipesBean" class="autochef.www.content.RandomRecipesBean" />

<div><strong>random recipe:</strong></div>
<c:forEach var="recipe" items="${randomRecipesBean.recipes}" begin="0" end="0">
<div><a href="display.jsp?recipeID=${recipe.ingredientID}"><img src="images/${recipe.ingredientID}/default.jpg" /></a></div>
<div><a href="display.jsp?recipeID=${recipe.ingredientID}"><em>${recipe.ingredientName}</em></a></div>
</c:forEach>
