<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="searchBean" class="autochef.www.content.SearchBean" />
<jsp:setProperty name="searchBean" property="*" />

<h3>Search Results</h3>
<c:if test="${empty searchBean.recipes}">
Sorry, no results matched your query.
</c:if>
<c:forEach var="recipe" items="${searchBean.recipes}">
<div style="width: 250px; float: left;">
<div><a href="display.jsp?recipeID=${recipe.ingredientID}"><img src="images/${recipe.ingredientID}/default.jpg" /></a></div>
<div><a href="display.jsp?recipeID=${recipe.ingredientID}"><em>${recipe.ingredientName}</em></a></div>
</div>
</c:forEach>
