# LoginProject

一个简单的登录功能

采用servlet和mybatis进行开发,maven进行管理

index.jsp的两种写法:
```jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<body>
<h2>Hello World!</h2>


<h2>${sessionScope.user.userName}</h2>
</body>
</html>
```


```jsp

<%@ page import="com.fire.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
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
```

页面展示如下:

![login_page](./src/main/webapp/img/image.png)