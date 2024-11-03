<%@ page import="com.fire.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2>Hello World!</h2>
<%
    if (session.getAttribute("user") == null) {
        out.println("<h2>No user logged in.</h2>");
    } else {
        User user = (User) session.getAttribute("user");
        out.println("<h2>Welcome, " + user.getUserName() + "!</h2>");
    }
%>
</body>
</html>
