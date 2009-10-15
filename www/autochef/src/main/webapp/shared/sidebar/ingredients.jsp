<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="userBean" scope="session" class="autochef.www.users.UserBean" />

<div><strong>Ingredients List</strong></div>

<c:if test="${empty userBean.ingredients}">
You currently have no ingredients listed.
</c:if>
<c:forEach var="ingredient" items="${userBean.ingredients}">
<div><a href="?remove=${ingredient.ingredientID}">x</a> ${ingredient.ingredientName}</div>
</c:forEach>

<div><strong>Shopping List</strong></div>
