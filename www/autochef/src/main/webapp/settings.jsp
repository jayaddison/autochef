<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty userBean.username}"><jsp:forward page="index.jsp" /></c:if>
<tiles:insertTemplate template="templates/main.jsp">
  <tiles:putAttribute name="content" type="template" value="../shared/content/settings.jsp" />
  <tiles:putAttribute name="sidebar" type="template" value="../shared/sidebar/settings.jsp" />
</tiles:insertTemplate>
