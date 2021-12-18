<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>Repo-X Software Repository System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #0000800">
         <div>
            <a href="index.jsp" class="navbar-brand"> Repo-X Software Repository System </a>
          </div>
         </nav>
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">View Software Details</h3>
                    <hr>
       <%
       
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-107-21-211-154.compute-1.amazonaws.com:5432" + "/df9u8gh27dnmmg";
       String DB_USER = "vrqqtcpbhkmzxl";
       String DB_PASSWORD = "5ea26387bf16edd2349b96bbb7fc1f63c2a8c79a89a8197763ec31fa13a402f9";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       %>
       <form action="" method="post">
       <%
       stat = conn.createStatement();
       String u = request.getParameter("u");
       String data = "select * from software where swNum='"+u+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="swNum" value='<%=res.getString("swNum") %>'/>
   			<div class="form-group">
     			<label>Name</label>
     			<input type="text" class="form-control" name="swName" value='<%=res.getString("swName") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Version</label>
     			<input type="text" class="form-control" name="swVer" value='<%=res.getString("swVer") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Description</label>
     			<input type="text" class="form-control" name="swDesc" value='<%=res.getString("swDesc") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Category</label>
     			<input type="text" class="form-control" name="swCat" value='<%=res.getString("swCat") %>'/>
   			</div>
   			<%
            }
   			%>
   			<a href="index.jsp" class="btn btn-default">Back</a>
   			<button type="submit" class="btn btn-warning">Update</button>
   			
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("swNum");
   			String b = request.getParameter("swName");
   			String c = request.getParameter("swVer");
   			String d = request.getParameter("swDesc");
   			String e = request.getParameter("swCat");
   			if(a!=null && b!=null && c!=null && d!=null && e!=null){
   				String query = "update software set swName=?,swVer=?,swDesc=?, swCat=? where swNum='"+a+"'";
   				stmt = conn.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				
   				stmt.executeUpdate();
   				response.sendRedirect("index.jsp");
   			}
   			%>
   			
   			
       
       
       
