<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<% String uri = request.getRequestURI(); %>

<jsp:useBean id="pageBean" scope="request" class="autochef.www.common.PageBean" />
<jsp:setProperty name="pageBean" property="serverName" value="${pageContext.request.serverName}" />
<jsp:setProperty name="pageBean" property="clientAddress" value="${pageContext.request.remoteAddr}" />
<jsp:setProperty name="pageBean" property="requestURL" value="${pageContext.request.requestURI}" />
<jsp:setProperty name="pageBean" property="referer" value="${header['referer']}" />
<jsp:setProperty name="pageBean" property="userAgent" value="${header['user-agent']}" />
<jsp:setProperty name="pageBean" property="acceptLanguage" value="${header['accept-language']}" />
<%
    pageBean.logData();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
<title>autochef</title>
<link rel="stylesheet" type="text/css" href="styles/default.css" />
</head>

<body>
<input style="visibility: hidden; height: 0px;" type="submit" />
<div class="header">
<jsp:include page="shared/header.jsp" />
</div>

<table>
<tr>
<td class="menu">
<jsp:include page="shared/menu.jsp" />
</td>
<td class="content">
<jsp:include page="<%= "shared/content/" + uri %>" />
</td>
<td class="sidebar">
<jsp:include page="<%= "shared/sidebar/" + uri %>" />
</td>
</tr>
</table>

</body>
</html>
