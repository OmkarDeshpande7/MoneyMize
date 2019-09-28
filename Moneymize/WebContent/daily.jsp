<!doctype html>
<%@page import="com.Moneymize.info.dailyexpense"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Dashboard</title>

 
    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" >


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="#">MoneyMize</a>
  <input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
  <ul class="navbar-nav px-3">
    <li class="nav-item text-nowrap">
      <a class="nav-link" href="${pageContext.request.contextPath}/logout">Sign out</a>
    </li>
  </ul>
</nav>

<div class="container-fluid">
  <div class="row">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
      <div class="sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link" href="dashboard.jsp">
              <span data-feather="home"></span>
              Dashboard <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="wallet.jsp">
              <span data-feather="file"></span>
              Wallet Balance
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="daily.jsp">
              <span data-feather="shopping-cart"></span>
              Daily expense
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="group.jsp">
              <span data-feather="users"></span>
              Group expense
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="personal.jsp">
              <span data-feather="bar-chart-2"></span>
              Personal expense
            </a>
          </li>
                  </ul>
      </div>
    </nav>

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Daily expense</h1>
        </div>
    </main>
    <form action="dailyexenseS" method="post">
        <div style="margin-left: 350px; width:50%">
                      <span style="font-size: 20px"><b>Add a daily expense:</b></span>
                      <br><br>

            <div class="input-group" >
              <select class="custom-select" id="inputGroupSelect04" name="category" >
                <option selected>Choose...</option>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Evening Breakfast">Evening Breakfast</option>
                <option value="Dinner">Dinner</option>
              </select>
             
                
                <input type="text"  class="form-control" placeholder="Amount" name="dailyamount" style="max-width: 500px">

              <div class="input-group-append">
                <button class="btn btn-outline-secondary" type="submit"  style="background-color: #80bfff">Button</button>
              </div>
            </div>
        </div>    
</form>
        <div class="col-md-5" style="margin-left: 350px;margin-top: 50px">
          
              <div class="input-group" >
                  <div class="input-group-prepend">
                    <span class="input-group-text" id=""><b>Show by date:</b><span>
                  </div>
                  <input type="date" class="form-control">
              </div>

        </div>

        <div style="margin-left: 350px;margin-top: 50px" class="col-md-9">
         <table class="table">
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">First</th>
                <th scope="col">Last</th>
                <th scope="col">Handle</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
         </table>
        </div>




  </div>
</div>
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="/docs/4.3/assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
      <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js" integrity="sha384-xrRywqdh3PHs8keKZN+8zzc5TX0GRTLCcmivcbNJWm2rs5C8PRhcEn3czEjhAO9o" crossorigin="anonymous"></script>
      <script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>

<%
response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
response.setHeader("Pragma", "no-cache");//1.0
response.setHeader("Expires", "0");//proxies

if(session.getAttribute("phone")==null)
	response.sendRedirect("index.jsp");

%>

      </body>
</html>
