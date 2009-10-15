<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

<head>
<title>autochef</title>
<link rel="stylesheet" type="text/css" href="styles/default.css" />
</head>

<tiles:insertTemplate template="../shared/ga.jsp" />
<body>
<input style="visibility: hidden; height: 0px;" type="submit" />

<div id="header"><tiles:insertTemplate template="../shared/header.jsp" /></div>
<table>
  <tr>
    <td id="menu"><tiles:insertTemplate template="../shared/menu.jsp" /></td>
    <td id="content"><tiles:insertAttribute name="content" /></td>
    <td id="sidebar"><tiles:insertAttribute name="sidebar" /></td>
  </tr>
</table>
<div id="footer"><tiles:insertTemplate template="../shared/footer.jsp" /></div>

</body>
</html>
