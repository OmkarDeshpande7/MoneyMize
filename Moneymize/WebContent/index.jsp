<!DOCTYPE html>

<html lang="en">
  <head>
    <title>Welcome to Moneymize</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--  Fonts and icons  -->
      <!--     Fonts and icons     -->
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

    <!-- Black Dashboard CSS -->
    <link href="${pageContext.request.contextPath}/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  </head>
  <body>

    <%

session.setAttribute("phone",null);
session.setAttribute("events",null);
session.setAttribute("requests",null);

if(session.getAttribute("errorMessage")=="NO")
{ %>
<script type="text/javascript">
alert("Invalid phone number or password");
</script>
<%
}
session.setAttribute("errorMessage", null);
%>

<div class="wrapper ">
  
  <div class="main-panel">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
      <div class="container-fluid">
        <div class="navbar-wrapper">
          <a class="navbar-brand" style="color: white;margin-top: 30px">MoneyMize</a>
        </div>
      </div>
    </nav>
    <!-- End Navbar -->
    <div class="content">
      <div class="container-fluid">
         <!-- your content here -->
        <div class="col-md-5" >
	        <div class="card">
				  <div class="card-body">
				    <form method="post">
				      <div class="form-group">
				        <label>Mobile</label>
				        <input type="text" class="form-control" maxlength="10" id="mobile" name="mobile" placeholder="Enter mobile" required autofocus>
				      </div>
				      <div class="form-group">
				        <label>Password</label>
				        <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
				      </div>

				      <button type="submit" class="btn btn-primary" value="Login" formaction="Login">Submit</button>
				      &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="Register.jsp"><small>New user? Sign up</small></a>
				    </form>
				  </div>
			</div>
		</div>


      </div>
    </div>
    
  </div>
</div>
<!--   Core JS Files   -->
<script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!-- Chartist JS -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets/js/black-dashboard.js?v=1.0.0" type="text/javascript"></script></body>
</html>