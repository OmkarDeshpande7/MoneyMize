<!DOCTYPE html>
<%@page import="com.Moneymize.Dao.LoginDao"%>
<%@page import="com.Moneymize.info.groupevent"%>
<%@page import="com.Moneymize.info.pendingpersonalrequests"%>
<%@page import="com.Moneymize.info.personalevent"%>
<%@page import="com.Moneymize.info.dailyexpense"%>
<%@page import="com.Moneymize.info.notification"%>
<%@page import="com.Moneymize.info.pendinggrouprequest"%>
<%@page import="com.Moneymize.info.alllog"%>


<%@page import="java.util.ArrayList"%>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Dashboard
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,600,700,800" rel="stylesheet" />
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <!-- Nucleo Icons -->
  <link href="${pageContext.request.contextPath}/assets/css/nucleo-icons.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath}/assets/css/black-dashboard.css?v=1.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath}/assets/demo/demo.css" rel="stylesheet" />
  <style type="text/css">
    html, body {
    max-height: 100%;
}
  </style>
</head>

<body class="" >
  <%
response.setHeader("cache-control","no-cache,no-store,must-revalidate");//http 1.1
response.setHeader("Pragma", "no-cache");//1.0
response.setHeader("Expires", "0");//proxies
session.setAttribute("show", "NO");

if(session.getAttribute("phone")==null){
  response.sendRedirect("index.jsp");}
else if(session.getAttribute("errorMessage")=="NOO")
{
	String uname = (String) session.getAttribute("phone");
	LoginDao daoReload = new LoginDao();
	daoReload.Reloadall(uname, request);
}

%>
  <div class="wrapper">
    <div class="sidebar">
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="active">
            <a href="dashboard.jsp">
              <i class="tim-icons icon-chart-pie-36"></i>
              <p>Dashboard</p>
            </a>
          </li>
          <li>
            <a href="wallet.jsp">
              <i class="tim-icons icon-money-coins"></i>
              <p>Wallet Balance</p>
            </a>
          </li>
          <li>
            <a href="daily.jsp">
              <i class="tim-icons icon-align-center"></i>
              <p>Daily expense</p>
            </a>
          </li>
          <li>
            <a href="group.jsp">
              <i class="tim-icons icon-align-center"></i>
              <p>Group events</p>
            </a>
          </li>
          <li>
            <a href="personal.jsp">
              <i class="tim-icons icon-align-center"></i>
              <p>Personal events</p>
            </a>
          </li>
          <li ">
            <a href="analysis.jsp">
              <i class="tim-icons icon-chart-bar-32"></i>
              <p>Analysis</p>
            </a>
          </li>
        </ul>
      </div>
    </div>


    <div class="main-panel">
     <!-- Navbar -->
      <nav class="navbar navbar-expand-lg  navbar-absolute navbar-transparent" >
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle d-inline">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:void(0)">Moneymize</a>
          </div>
           <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
         
          <div class="collapse navbar-collapse" id="navigation">
            <ul class="navbar-nav ml-auto">
              <li>
                <a class="nav-link" href="">Wallet balance : ${walletst}</a>
              </li>
              <li class="dropdown nav-item">
                <a href="javascript:void(0)" class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <div class="notification d-none d-lg-block d-xl-block"></div>
                  <i class="tim-icons icon-bell-55"></i>
                  <p class="d-lg-none">
                    Notifications
                  </p>
                </a>
                <ul class="dropdown-menu dropdown-menu-right dropdown-black dropdown-navbar" style="width: 450px">
                  <%   ArrayList<notification> nevents=(ArrayList<notification>) session.getAttribute("nevents");  
                        if (nevents!=null){
                      for (int i=nevents.size()-1;i>=0;i--) {   
                    	  
                      %>
                      <hr>
                  <li><p class="text" style="font-size: 12px"><%= nevents.get(i).getMessage() + " : " + nevents.get(i).getDate() %></p></li>
                   <%}}%> 
                   <hr>
                </ul>
              </li>
              <li>
                 <a class="nav-link" href="">${user_name}</a>
              </li>
              <li class="nav-item text-nowrap">
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">Sign out</a>
              </li>
              <li class="separator d-lg-none"></li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="modal modal-search fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="SEARCH">
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tim-icons icon-simple-remove"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
      <!-- End Navbar -->
      <div class="content">
        <div class="col-md-12">
          <h5><b>Dashboard</b></h5>
          <hr>
        </div>
        <div class="row col-md-12" >
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">Pending</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>
                     <%   ArrayList<pendingpersonalrequests> requests=(ArrayList<pendingpersonalrequests>) session.getAttribute("requests");  
                        if (requests!=null){
                      for (int i=0;i<requests.size();i++) {   
                      %>
                      <form method="post">
                        <tr>
                          <td>
                            <p class="text"><%= requests.get(i).getAmount() + " -> " + requests.get(i).getLender() %></p>
                          </td>
                          <td><input type="number" name="reqId" value="<%=requests.get(i).getId() %>" hidden></td>
                          <td class="td-actions text-right">
                            <button class="btn btn-success  btn-sm btn-link" type="submit" formaction="acceptS" >Approve</button>
                          </td>
                          <td class="td-actions text-right">
                            <button class="btn btn-danger  btn-sm btn-link" type="submit" formaction="rejectS" >Reject</button>
                          </td>
                        </tr>
                      </form>
                     <%}}%> 
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">Daily Expense</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>
                    	 <%   ArrayList<dailyexpense> devents=(ArrayList<dailyexpense>) session.getAttribute("devents");  
    if (devents!=null){
	for (int i=0;i<devents.size();i++) {   
	%>
                      <tr>
                        <td>
                          <p class="text"><%= devents.get(i).getAmount() + " -> " + devents.get(i).getCategory() %></p>
                        </td>
                      </tr>
                     <%}}%> 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>



 


        <div class="row col-md-12" >
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">Personal Expense</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>

                     <%   ArrayList<personalevent> pevents=(ArrayList<personalevent>) session.getAttribute("pevents");  
                              if (pevents!=null){
                                       for (int i=0;i<pevents.size();i++) {   
                      %>
                      <tr>
                        <td>
                          <p class="text"><%=pevents.get(i).getAmount() + " --> " +  pevents.get(i).getLender() + " had lend money to " + pevents.get(i).getBorrower()%></p>
                        </td>

                         <td class="td-actions text-right">
                            
                        <form action="" method="post">
                      <input type="number" value="<%= pevents.get(i).getEid() %>" name="eid" hidden>
                      <%
                      if (pevents.get(i).getBorrower().equals((String)session.getAttribute("phone")) && pevents.get(i).getAmount() < Integer.parseInt((String)session.getAttribute("walletst"))) {%>
                      <button class="btn btn-success  btn-sm btn-link" type="submit" formaction="payS" >Pay</button>
                      <%}
                      else if (pevents.get(i).getBorrower().equals((String)session.getAttribute("phone")) && pevents.get(i).getAmount() > Integer.parseInt((String)session.getAttribute("walletst"))){%>
                      <button class="btn btn-sm btn-link" style="color:white" formaction="wallet.jsp" type="button" >  Add money to pay</button>
                      <%}%>
                      </form>
                          </td>
                      </tr>
                     <%}}%> 
                      
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">Group Expense</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>
                     <%   ArrayList<groupevent> gevents=(ArrayList<groupevent>) session.getAttribute("gevents");  
                              if (gevents!=null){
                                       for (int i=0;i<gevents.size();i++) {   
                      %>
                      <tr>
                        <td>
                          <p class="text"><%= gevents.get(i).getTotalAmt() + " -> " + gevents.get(i).getOwner() +" : "+ gevents.get(i).getDescription() %></p>
                                               </td>
                                               <td class="td-actions text-right">
                        <form action="" method="post">
                      <input type="number" value="<%= gevents.get(i).getEid() %>" name="eid" hidden>
                       <%if (gevents.get(i).getTotalAmt() < Integer.parseInt((String)session.getAttribute("walletst"))) {%>
                    <button class="btn btn-success  btn-sm btn-link" type="submit" formaction="paygroupmoney" >Pay</button>
                    <%}
                      else{%>
                          <button class="btn  btn-sm btn-link" style="color:white" formaction="wallet.jsp" type="button" > Add money to pay</button>
                      <%}%>
                     
                      </form>
                      
                        </td>
                      </tr>
                     <%}}%> 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>          
        </div>


<div class="row col-md-12" >
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">group Pending request</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>
                     <%   ArrayList<pendinggrouprequest> pendinggroupevent=(ArrayList<pendinggrouprequest>) session.getAttribute("pendinggroupevent");  
                        if (pendinggroupevent!=null){
                      for (int i=0;i<pendinggroupevent.size();i++) {   
                      %>
                      <form method="post">
                        <tr>
                          <td>
                            <p class="text"><%= pendinggroupevent.get(i).getAmount() + " -> " + pendinggroupevent.get(i).getOwner() %></p>
                          </td>
                          <td><input type="number" name="reqId" value="<%=pendinggroupevent.get(i).getId() %>" hidden></td>
                          <td class="td-actions text-right">
                            <button class="btn btn-success  btn-sm btn-link" type="submit" formaction="acceptgrouprequest" >Approve</button>
                          </td>
                          <td class="td-actions text-right">
                            <button class="btn btn-danger  btn-sm btn-link" type="submit" formaction="rejectgrouprequest" >Reject</button>
                          </td>
                        </tr>
                      </form>
                     <%}}%> 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6" >
            <div class="card card-tasks" style="max-height:220px ">
              <div class="card-header ">
                <h6 class="title d-inline">All Transaction</h6>
              </div>
              <div class="card-body " >
                <div class="table-full-width table-responsive" style="max-height:160px ">
                  <table class="table">
                    <tbody>
                     <%   ArrayList<alllog> logevent=(ArrayList<alllog>) session.getAttribute("logevent");  
    if (logevent!=null){
	for (int i=0;i<logevent.size();i++) {   
	%>
                      <tr>
                        <td>
                          <p class="text" style="font-weight:bold;"><%= logevent.get(i).getAmount() + " -> " + logevent.get(i).getDescription() %></p>
                        </td>
                      </tr>
                     <%}}%> 
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>



      </div>
      
    </div>
  </div>
  <div class="fixed-plugin">
    <div class="dropdown show-dropdown">
      <a href="#" data-toggle="dropdown">
        <i class="fa fa-cog fa-2x"> </i>
      </a>
      <ul class="dropdown-menu">
        <li class="header-title"> Sidebar Background</li>
        <li class="adjustments-line">
          <a href="javascript:void(0)" class="switch-trigger background-color">
            <div class="badge-colors text-center">
              <span class="badge filter badge-primary active" data-color="primary"></span>
              <span class="badge filter badge-info" data-color="blue"></span>
              <span class="badge filter badge-success" data-color="green"></span>
            </div>
            <div class="clearfix"></div>
          </a>
        </li>
        <li class="adjustments-line text-center color-change">
          <span class="color-label">LIGHT MODE</span>
          <span class="badge light-badge mr-2"></span>
          <span class="badge dark-badge ml-2"></span>
          <span class="color-label">DARK MODE</span>
        </li>
        
      </ul>
    </div>
  </div>
  <!--   Core JS Files   -->
  <script src="${pageContext.request.contextPath}/assets/js/core/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/assets/js/plugins/perfect-scrollbar.jquery.min.js"></script>
  <!--  Google Maps Plugin    -->
  <!-- Place this tag in your head or just before your close body tag. -->

  <!-- Chart JS -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/chartjs.min.js"></script>
  <!--  Notifications Plugin    -->
  <script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap-notify.js"></script>
  <!-- Control Center for Black Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="${pageContext.request.contextPath}/assets/js/black-dashboard.min.js?v=1.0.0"></script><!-- Black Dashboard DEMO methods, don't include it in your project! -->
  <script src="${pageContext.request.contextPath}/assets/demo/demo.js"></script>



  <script>

  
    $(document).ready(function() {
    	<%-- <%
    	if(!session.getAttribute("errorMessage").equals("NOO"))
    	{
    	LoginDao obj = new LoginDao(); 
    	obj.checkpendingrequest((String)session.getAttribute("phone"), request);
    	obj.checkPersonalevent((String)session.getAttribute("phone"), request);
    	obj.groupevent((String)session.getAttribute("phone"), request);
    	}%> --%>
      $().ready(function() {
        $sidebar = $('.sidebar');
        $navbar = $('.navbar');
        $main_panel = $('.main-panel');

        $full_page = $('.full-page');

        $sidebar_responsive = $('body > .navbar-collapse');
        sidebar_mini_active = true;
        white_color = false;

        window_width = $(window).width();

        fixed_plugin_open = $('.sidebar .sidebar-wrapper .nav li.active a p').html();



        $('.fixed-plugin a').click(function(event) {
          if ($(this).hasClass('switch-trigger')) {
            if (event.stopPropagation) {
              event.stopPropagation();
            } else if (window.event) {
              window.event.cancelBubble = true;
            }
          }
        });

        $('.fixed-plugin .background-color span').click(function() {
          $(this).siblings().removeClass('active');
          $(this).addClass('active');

          var new_color = $(this).data('color');

          if ($sidebar.length != 0) {
            $sidebar.attr('data', new_color);
          }

          if ($main_panel.length != 0) {
            $main_panel.attr('data', new_color);
          }

          if ($full_page.length != 0) {
            $full_page.attr('filter-color', new_color);
          }

          if ($sidebar_responsive.length != 0) {
            $sidebar_responsive.attr('data', new_color);
          }
        });

        $('.switch-sidebar-mini input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (sidebar_mini_active == true) {
            $('body').removeClass('sidebar-mini');
            sidebar_mini_active = false;
            blackDashboard.showSidebarMessage('Sidebar mini deactivated...');
          } else {
            $('body').addClass('sidebar-mini');
            sidebar_mini_active = true;
            blackDashboard.showSidebarMessage('Sidebar mini activated...');
          }

          // we simulate the window Resize so the charts will get updated in realtime.
          var simulateWindowResize = setInterval(function() {
            window.dispatchEvent(new Event('resize'));
          }, 180);

          // we stop the simulation of Window Resize after the animations are completed
          setTimeout(function() {
            clearInterval(simulateWindowResize);
          }, 1000);
        });

        $('.switch-change-color input').on("switchChange.bootstrapSwitch", function() {
          var $btn = $(this);

          if (white_color == true) {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').removeClass('white-content');
            }, 900);
            white_color = false;
          } else {

            $('body').addClass('change-background');
            setTimeout(function() {
              $('body').removeClass('change-background');
              $('body').addClass('white-content');
            }, 900);

            white_color = true;
          }


        });

        $('.light-badge').click(function() {
          $('body').addClass('white-content');
        });

        $('.dark-badge').click(function() {
          $('body').removeClass('white-content');
        });
      });
    });
  </script>
  <script>
    $(document).ready(function() {
      // Javascript method's body can be found in assets/js/demos.js
      demo.initDashboardPageCharts();

    });
  </script>
  
  <script>
    window.TrackJS &&
      TrackJS.install({
        token: "ee6fab19c5a04ac1a32a645abde4613a",
        application: "black-dashboard-free"
      });
  </script>
</body>

</html>