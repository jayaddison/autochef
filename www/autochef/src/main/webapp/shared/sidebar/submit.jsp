<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="submissionBean" class="autochef.www.users.SubmissionBean" scope="session" />

<form action="submit.jsp">

<h3>Submit your recipe</h3>

<div><strong>Recipe Title</strong></div>
<div><input name="recipeName" /></div>
<br />

<c:choose>
  <c:when test="${empty submissionBean.steps}">
The recipe does not yet contain any steps.
  </c:when>
  <c:otherwise>
<div><strong>Preparation Steps</strong></div>
    <c:forEach var="ingredient" items="${submissionBean.steps}">
<div><a href="?remove=${ingredient.ingredientID}">x</a> ${ingredient.ingredientName}</div>
    </c:forEach>
<br />
<br />
<input type="submit" name="submit" value="submit" />
</form>
  </c:otherwise>
</c:choose>
