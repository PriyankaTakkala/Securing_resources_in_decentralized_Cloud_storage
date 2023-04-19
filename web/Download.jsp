<%-- 
    Document   : Download
    Created on : Apr 24, 2020, 3:25:13 PM
    Author     : KishanVenky
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBCon"%>
<%@page import="java.sql.Connection"%>
<%
String fname=request.getParameter("fname");
String t1=request.getParameter("owner");
 try
 {
               
               Connection con=DBCon.getCon();
              Statement st=con.createStatement();
              int i=st.executeUpdate("insert into downloadhistory values('"+t1+"','"+fname+"',now())");
              
if(fname!=null){
  response.sendRedirect("download?"+fname+","+t1);  
}else{
  response.sendRedirect("RequestStatus.jsp?msg=failed");   
}
               
           }catch(Exception e)
{
               out.println(e);
           }
           
           
           
          
%>
