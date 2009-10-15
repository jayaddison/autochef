<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="userBean" scope="session" class="autochef.www.users.UserBean" />
<jsp:setProperty name="userBean" property="*" />

<c:if test="${not empty param.logout}"><% userBean.logout(); %></c:if>
<c:choose>
<c:when test="${empty userBean.username}">
<form action="<%= request.getRequestURI() + (request.getQueryString() == null ? "" : "?" + request.getQueryString().replace("logout=1&", "").replace("logout=1", "")) %>" method="post">
<div><strong>login / register</strong></div>
<div><input name="username" size="10" /></div>
<div><input name="password" type="password" size="10" /></div>
<div><input type="submit" value="go" /></div>
</form>
</c:when>
<c:otherwise>
<div><strong>your kitchen</strong></div>
<div><a href="ingredients.jsp">ingredients</a></div>
<div><a href="suggestions.jsp">recipe suggestions</a></div>
<div><a href="settings.jsp">settings</a></div>
<div><a href="<%= "?logout=1" + (request.getQueryString() == null ? "" : "&" + request.getQueryString()) %>">logout</a></div>
</c:otherwise>
</c:choose>
