<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<tiles:insertTemplate template="templates/main.jsp">
  <tiles:putAttribute name="content" type="template" value="../shared/content/topchefs.jsp" />
  <tiles:putAttribute name="sidebar" type="template" value="../shared/sidebar/topchefs.jsp" />
</tiles:insertTemplate>
