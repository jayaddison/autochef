<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>Your recipe options</h3>
<c:if test="${empty userBean.recipes}">
<a href="."><em style="color: black;">auto</em><strong style="color: maroon;">chef</strong></a> could not find any recipes which match your listed ingredients; you could try listing any other ingredients you may have in your kitchen, or alternatively submit your own recipe if you have a meal you can prepare with what you have.
</c:if>

<c:forEach var="recipe" items="${userBean.recipes}">
<div style="width: 250px; float: left;">
<div><a href="recipe.jsp?recipeID=${recipe.ingredientID}"><img src="images/${recipe.ingredientID}/default.jpg" /></a></div>
<div><a href="recipe.jsp?recipeID=${recipe.ingredientID}"><em>${recipe.ingredientName}</em></a></div>
</div>
</c:forEach>
