<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:useBean id="userBean" scope="session" class="autochef.www.users.UserBean" />
<jsp:useBean id="searchBean" class="autochef.www.content.SearchBean" />
<jsp:setProperty name="searchBean" property="*" />
<jsp:useBean id="selectionBean" class="autochef.www.users.SelectionBean" />
<% userBean.setSelectionBean(selectionBean); %>

<c:forEach var="parameter" items="${param}">
  <c:if test="${fn:startsWith(parameter, 'common')}"><jsp:setProperty name="selectionBean" property="addSelection" value="${parameter.value}" /></c:if>
  <c:if test="${fn:startsWith(parameter, 'search')}"><jsp:setProperty name="selectionBean" property="addSearchSelection" value="${parameter.value}" /></c:if>
  <c:if test="${fn:startsWith(parameter, 'remove')}"><jsp:setProperty name="userBean" property="removeIngredient" value="${parameter.value}" /></c:if>
</c:forEach>
<c:if test="${not empty param.update}"><jsp:setProperty name="userBean" property="addIngredients" value="1" /></c:if>

<h3>Your ingredients</h3>
<p>Here you can enter the ingredients which you currently have available in your kitchen.  Given a full list, <a href="."><em style="color: black;">auto</em><strong style="color: maroon;">chef</strong></a> will be able to discover all of the meals in our collection which you can prepare.</p>
<br />

<form action="ingredients.jsp">
<p><strong>1. Add common ingredients</strong></p>
<!--
<% int i = 0; %>
<c:forEach var="product" items="${databaseBean.commonUserIngredients}">
<jsp:setProperty name="selectionBean" property="selectionCheck" value="${product.ingredientID}" />
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "common" + i++ %>" value="${product.ingredientID}" <c:if test="${selectionBean.selected}">checked</c:if>>${product.ingredientName}</input></div>
</c:forEach>
-->
<br style="clear: both;"/>
<br />

<p><strong>2. Find more ingredients</strong></p>
<div><input name="query" value="${param.query}" /><input type="submit" value="search" /></div>
<br />
<c:if test="${not empty param.query and empty searchBean.ingredients}">
Sorry, no results matched your query.
</c:if>
<% i = 0; %>
<c:forEach var="product" items="${selectionBean.searchSelections}">
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "search" + i++ %>" value="${product.ingredientID}" checked>${product.ingredientName}</input></div>
</c:forEach>
<c:forEach var="ingredient" items="${searchBean.ingredients}">
<jsp:setProperty name="selectionBean" property="selectionCheck" value="${ingredient.ingredientID}" />
<c:if test="${not selectionBean.selected}">
<div style="width: 150px; float: left;"><input type="checkbox" name="<%= "search" + i++ %>" value="${ingredient.ingredientID}">${ingredient.ingredientName}</input></div>
</c:if>
</c:forEach>
<br style="clear: both;"/>
<br />

<p><strong>3. Done - Update my ingredients</strong></p>
<div><input type="submit" name="update" value="update" /></div>
</form>
