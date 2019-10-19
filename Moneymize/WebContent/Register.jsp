<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html lang="en">
  <head>
    <title>Register to Moneymize</title>
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
if(session.getAttribute("errorRegisterMessage")=="NO")
{ %>
<script type="text/javascript">
alert("Phone Number already exist");
</script>
<%
}
session.setAttribute("errorRegisterMessage", null);

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
        <div class="card col-md-8 ">
  <div class="card-body">
    <form name="my-form"  action="RegisterS" method="post">
      <div class="form-row">
        <div class="form-group col-md-6">
          <label >Full name</label>
          <input type="text" class="form-control" id="full_name" name="full-name" placeholder="Full name" required>
        </div>
        <div class="form-group col-md-6">
          <label for="inputEmail4">Email</label>
          <input type="email" class="form-control" id="email_address" name="email-address" placeholder="Email" required>
        </div>
      </div>
      <div class="form-row">
         <div class="form-group col-md-6">
          <label >Mobile</label>
          <input type="type" class="form-control" maxlength="10" id="phone_number" name="phone-no" placeholder="Mobile" required>
        </div>
        <div class="form-group col-md-6">
          <label for="inputPassword4">Password</label>
          <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
        </div>
      </div>
      <div class="form-group">
        <label>Initial Wallet Balance</label>
        <input type="number" class="form-control" id="balance" name="wallet" min="0" step="1" placeholder="Initial wallet balance" required>
      </div>
      </div>
      
      <button type="submit" class="btn btn-primary col-md-3" style="margin-left: 17vw;margin-bottom: 20px">Sign in</button>

    </form>
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
<script src=${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
<!-- Control Center for Material Dashboard: parallax effects, scripts for the example pages etc -->
<script src="${pageContext.request.contextPath}/assets/js/black-dashboard.js?v=1.0.0" type="text/javascript"></script></body>
</html>