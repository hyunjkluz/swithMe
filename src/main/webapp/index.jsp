<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body>
<h2>SSD Project : SwithMe</h2>
<%session.setAttribute("type", "student"); %>
<a href="<c:url value='/connection/' /><%=session.getAttribute("type")%>">나의 수업</a>
</body>
</html>
