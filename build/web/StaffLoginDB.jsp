<%@include file="connect.jsp" %>

<%
    String email=request.getParameter("email");
    String pwd=request.getParameter("psw");
    
    String sql="select * from staff where email='"+email+"' and password='"+pwd+"'";
    System.out.println("Sql is "+sql);
    ResultSet rs=st.executeQuery(sql);
    if(rs.next())
    {
        session.setAttribute("mail",rs.getString("email"));
        session.setAttribute("name",rs.getString("name"));
        session.setAttribute("sid",rs.getString("staffid"));
        %>
        <script>
        window.alert("Login Success");
        window.location.assign("StaffHomePage.jsp");
        </script>
        <%
    }
    else
    {
        %>
        <jsp:include page="staffLogin.html"/>
        <center>Username/password Not Match</center>
        <%
    }
    %>