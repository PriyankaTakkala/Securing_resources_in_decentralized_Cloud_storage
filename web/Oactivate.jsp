<%-- 
    Document   : Oactivate
    Created on : Feb 29, 2020, 10:29:22 AM
    Author     : Venkat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.DBCon"%>
<%@page import="java.sql.*"%>
<%
    String t1=request.getParameter("t1");
    try
    {
        Connection con=DBCon.getCon();
        Statement st=con.createStatement();
        int i=st.executeUpdate("update user set t8='Activated' where t1='"+t1+"' and t7='Owner'");
        if(i>0)
        {
            %>
            <script type="text/javascript">
                window.alert("Data Owner Activated Sucessfully");
                window.location="CloudScreen.jsp";
                </script>
            <%
        }
else
{
%>
            <script type="text/javascript">
                window.alert("Unable To Activate Data Owner Right Now");
                window.location="CloudScreen.jsp";
                </script>
            <%
}
    }
    catch(Exception e)
    {
        out.println(e);
    }
    %>
