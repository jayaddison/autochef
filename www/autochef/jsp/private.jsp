<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
<title>autochef</title>
<link rel="stylesheet" type="text/css" href="styles/default.css" />
</head>

<jsp:include page="shared/ga.jsp" />
<body>
<input style="visibility: hidden; height: 0px;" type="submit" />
<div class="header">
<jsp:include page="shared/header.jsp" />
</div>

<table>
<tr>
<td class="menu">
<% String uri = request.getRequestURI(); %>
<jsp:include page="shared/menu.jsp" />
<c:if test="${empty userBean.username}"><jsp:forward page="index.jsp" /></c:if>
</td>
<td class="content">
<jsp:include page='<%= "shared/content/" + uri %>' />
</td>
<td class="sidebar">
<jsp:include page='<%= "shared/sidebar/" + uri %>' />
</td>
</tr>
</table>

</body>
</html>
