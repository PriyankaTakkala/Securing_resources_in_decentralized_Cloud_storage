<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DBCon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="" />
<meta name="keywords" content="" />
<title>Securing Resources in Decentralized Cloud Storage</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="tablestyle.css" />
</head>
<body>
<div id="wrapper">
	<div id="header">
		<div id="logo">
			<h3><font size="" color="white">Securing Resources in Decentralized Cloud Storage</font></h3>
		</div>
		<div id="slogan">
			
		</div>
	</div>
	<div id="menu">
		<ul>
			<li class="first current_page_item"><a href="OwnerHome.jsp">Homepage</a></li>
			
			<li><a href="FileUpload.jsp">File Upload</a></li>
			<li><a href="ViewFiles.jsp">View Files </a></li>
                        <li><a href="ViewFileRequest.jsp">View File Request</a></li>
                        <li><a href="Logout.jsp">Logout</a></li>
		</ul>
		<br class="clearfix" />
	</div>
	<div id="splash">
		<img class="pic" src="images/cloud.jpg" width="870" height="230" alt="" />
	</div>
	<br/>
        <%String t1=(String)session.getAttribute("t1");%>
        <h2><b><center>Welcome <%=t1%>!
	</center></b></h2>
        <center>
	<table style="margin-bottom: 100px;">
            <tr><th>Request By</th>
                <th>FileName</th>
            <th>Keyword</th>
            <th>File Size</th>
            <th>Accept Here</th>
                 <th>Reject Here</th>
            </tr>
           <%
           try{
               
               Connection con=DBCon.getCon();
              Statement st=con.createStatement();
              ResultSet r=st.executeQuery("select * from request r,files f where f.id=r.fid and  r.status='waiting'");
              while(r.next()){
                  String status=r.getString("r.status");
                %>
                <tr>
                    <td><%=r.getString("r.sender")%></td>
                    <td><%=r.getString("f.filename")%></td>
                    <td><%=r.getString("f.keyword")%></td>
                    <td><%=r.getString("f.size")%> bytes</td>
                    

<td><a href="Accept.jsp?fid=<%=r.getString("r.fid")%>&id=<%=r.getString("r.id")%>">Accept</a></td>
<td><a href="Reject.jsp?fid=<%=r.getString("r.fid")%>&id=<%=r.getString("r.id")%>">Reject</a></td>
                    
                    
                </tr>  
                
                <%
              }
               
           }catch(Exception e){
               out.println(e);
           }
           
           
           
           %> 
        </table>	
        
        
        </center>
</p>
</body>
</html>
