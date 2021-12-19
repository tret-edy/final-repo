<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<html>
<head>
  <title>Repo-X Software Repository System</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style type="text/css">
.footer_area {
  background-color: #000080;
  position: relative;
  z-index: 9;
  overflow: hidden;}
  
.footer_copyright text-center {
  position: relative;}

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
  margin-top: 30px;}
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
  padding: 40px 0;}
body {
  font-family: "Cardo";
  font-weight: normal;
  font-style: normal;
   }
 .table {
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    background-color: #17a2;}
 .btn-primary{
  background-color: #ffc160; 
 border-color: #6c757d;}       
.table td, .table th{
    padding: 0.3rem;
    vertical-align: top;}
tbc {
  
}</style>
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
                <img src="images/logo.png" class="img-fluid" alt=""><br><br><br><br>
                    <h3 class="text-center">List of Softwares</h3>
                    <hr>
    <div class="text-center">
         <a href="Add.jsp" class="btn btn-primary" >Add New Software</a>
    </div>
<p></p>
<table class="table table-bordered table-striped table-hover">
   <thead style="background-color: #000000">
       <tr style="color: white">
         <th>No.</th>
         <th>Name</th>
         <th>Version</th>
         <th>Description</th>
         <th>Category</th>
         <th class="text-center">Action</th>
        </tr>
    </thead>
    <tbody>
       <%
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-107-21-211-154.compute-1.amazonaws.com:5432" + "/df9u8gh27dnmmg";
       String DB_USER = "vrqqtcpbhkmzxl";
       String DB_PASSWORD = "5ea26387bf16edd2349b96bbb7fc1f63c2a8c79a89a8197763ec31fa13a402f9";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       Class.forName(DB_DRIVER);
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       stat = conn.createStatement();
       String data = "select * from software order by swNum";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td><%=res.getString("swNum")%></td>
         <td><%=res.getString("swName")%></td>
         <td><%=res.getString("swVer")%></td>
         <td><%=res.getString("swDesc")%></td>
         <td><%=res.getString("swCat")%></td>
         <td class="text-center">
           <a href='Edit.jsp?u=<%=res.getString("swNum")%>' class="btn btn-warning" style= "background-color: #37fd12; border-color: #37fd12 ;">Edit</a>
           <a href='Delete.jsp?d=<%=res.getString("swNum")%>' class="btn btn-danger">Delete</a>
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
</div></div>
<br><br><br><br><br>
<footer id="footer" class="footer_area">
        <div class="footer_copyright text-center" style="color:white">
        	<p>Copyright © <script>
              var CurrentYear = new Date().getFullYear()
              document.write(CurrentYear)
            </script>. All Rights Reserved, by Repo-X <a href= "index.jsp"></a></p></div></footer>
</body>
</html>