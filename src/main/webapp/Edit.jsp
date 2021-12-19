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

<style type="text/css">
body {
	font-family: "Cardo";
}

.footer_area {
  background-color: #000080;
  position: relative;
  z-index: 9;
  overflow: hidden;
  margin-top: 0px;
  margin-bottom: 0px;}

.footer_shape_1 {
  position: absolute;
  bottom: -30px;
  left: 0;
  z-index: -1; }
  .footer_shape_1 img {
    width: 130px;
    opacity: 0.31; }

@media (max-width: 767px) {
  .footer_widget .footer_logo a img {
    width: 160px; } }
.footer_widget .footer_title {
  margin-top: 30px; }
  .footer_widget .footer_title .title {
    font-size: 52px;
    color: #38424D; }
    @media (max-width: 767px) {
      .footer_widget .footer_title .title {
        font-size: 38px; } }
    .footer_widget .footer_title .title span {
      color: #D59A57; }
.footer_widget .footer_menu {
  margin-top: 30px; }
  .footer_widget .footer_menu li {
    display: inline-block;
    margin: 0 20px; }
    .footer_widget .footer_menu li a {
      font-size: 16px;
      color: #38424D;
      -webkit-transition: all 0.3s ease-out 0s;
      -moz-transition: all 0.3s ease-out 0s;
      -ms-transition: all 0.3s ease-out 0s;
      -o-transition: all 0.3s ease-out 0s;
      transition: all 0.3s ease-out 0s; }
      .footer_widget .footer_menu li a:hover {
        color: #D59A57; }

.footer_copyright {
  border-top: 2px solid #D59A57;
  padding: 40px 0; }

</style>
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #000080">
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
   			<button type="submit" class="btn btn-warning" style="background-color: #007bff; color:#ffff;"  >Update</button>
   			
   			</form>
   			</div></div><br><br>
   			<footer id="footer" class="footer_area">
        <div class="footer_copyright text-center" style="color:white">
        	<p>Copyright © <script>
              var CurrentYear = new Date().getFullYear()
              document.write(CurrentYear)
            </script>. All Rights Reserved, by Repo-X <a href= "index.jsp"></a></p></div></footer>
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
   			
   			
       
       
       
