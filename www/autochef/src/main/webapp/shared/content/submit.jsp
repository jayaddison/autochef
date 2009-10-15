<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="selectionBean" class="autochef.www.users.SelectionBean" />
<jsp:useBean id="submissionBean" class="autochef.www.users.SubmissionBean" scope="session" />
<jsp:setProperty name="submissionBean" property="*" />
<% submissionBean.setSelectionBean(selectionBean); %>

<c:forEach var="parameter" items="${param}">
  <c:if test="${fn:startsWith(parameter, 'common')}"><jsp:setProperty name="selectionBean" property="addSelection" value="${parameter.value}" /></c:if>
  <c:if test="${fn:startsWith(parameter, 'search')}"><jsp:setProperty name="selectionBean" property="addSearchSelection" value="${parameter.value}" /></c:if>
  <c:if test="${fn:startsWith(parameter, 'native')}"><jsp:setProperty name="selectionBean" property="addNativeSelection" value="${parameter.value}" /></c:if>
</c:forEach>
<c:if test="${not empty param.add}"><jsp:setProperty name="submissionBean" property="addStep" value="1" /></c:if>
<c:if test="${not empty param.submit}"><jsp:setProperty name="submissionBean" property="submitRecipe" value="1" /></c:if>

<form action="submit.jsp">
<h3>Add a step to the preparation of the recipe</h3>

<div><strong>Step Name</strong></div>
<div><input name="stepName" /></div
<br />

<div><strong>Duration (minutes)</strong></div>
<div><input size="3" name="stepDuration" /></div>
<br />

<h3>Ingredients required during this step</h3>

<div><strong>Common ingredients:</strong></div>
<!--
<% int i = 0; %>
<c:forEach var="product" items="${databaseBean.commonRecipeIngredients}">
<jsp:setProperty name="selectionBean" property="selectionCheck" value="${product.ingredientID}" />
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "common" + i++ %>" value="${product.ingredientID}" <c:if test="${selectionBean.selected}">checked</c:if>>${product.ingredientName}</input></div>
</c:forEach>
-->
<br style="clear: both;" />
<br />

<div><strong>Search for other ingredients:</strong></div>
<div><input name="query" value="${param.query}" /><input type="submit" value="search" /></div>
<br />
<!-- ((missing) empty search results and) empty selections so far -->
<c:if test="${empty selectionBean.searchSelections}">
Sorry, no results matched your query.
</c:if>
<!--
<% i = 0; %>
<c:forEach var="product" items="${selectionBean.searchSelections}">
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "search" + i++ %>" value="${product.ingredientID}" checked>${product.ingredientName}</input></div>
</c:forEach>
<c:forEach var="product" items="${databaseBean.products}">
<jsp:setProperty name="selectionBean" property="selectionCheck" value="${product.ingredientID}" />
<c:if test="${not selectionBean.selected}">
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "search" + i++ %>" value="${product.ingredientID}">${product.ingredientName}</input></div>
</c:if>
</c:forEach>
-->
<br style="clear: both;" />
<br />

<div><strong>Results from other steps:</strong></div>
<% i = 0; %>
<c:forEach var="product" items="${submissionBean.steps}">
<jsp:setProperty name="selectionBean" property="selectionCheck" value="${product.ingredientID}" />
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "native" + i++ %>" value="${product.ingredientID}" <c:if test="${selectionBean.nativeSelected}">checked</c:if>>${product.ingredientName}</input></div>
</c:forEach>
<br style="clear: both;" />
<br />

<div><strong>Detailed Instructions for this step</strong></div>
<textarea name="stepInstructions" rows="10" cols="80"></textarea>
<div>
<input type="submit" name="add" value="add step" />
</div>
</form>
