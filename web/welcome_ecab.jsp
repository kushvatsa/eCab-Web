<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="style_ecab/stylezz.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.css">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to eCab</title>
<script src="js/nivo/jquery.nivo.slider.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/nivo/nivo-slider.css">
<link rel="stylesheet" type="text/css" href="style_ecab/nivo/themes/bar/bar.css">
<link rel="stylesheet" type="text/css" href="style_ecab/nivo/themes/dark/dark.css">
<link rel="stylesheet" type="text/css" href="style_ecab/nivo/themes/default/default.css">
<link rel="stylesheet" type="text/css" href="style_ecab/nivo/themes/light/light.css">
<script type="text/javascript" src="js/fancybox/fancy_script.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/fancy_css.css">
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/jquery.fancybox.css">
<script type="text/javascript">
        $(document).ready(function(){
			 $("#l1").click(function()
           { 
  $("#l1").fancybox({
      'autoSize':false,
    'width'  : 650,           // set the width
    'height' : 330,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 
  
$(document).ready(function(){
			 $("#l5").click(function()
           { 
  $("#l5").fancybox({
      'autoSize':false,
    'width'  : 600,           // set the width
    'height' : 700,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 
      $(document).ready(function(){
			 $("#m1").click(function()
           { 
  $("#m1").fancybox({
      'autoSize':false,
    'width'  : 1000,           // set the width
    'height' : 400,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
});

      $(document).ready(function(){
			 $("#tc").click(function()
           { 
  $("#tc").fancybox({
      'autoSize':false,
    'width'  : 1000,           // set the width
    'height' : 1000,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
});
$(document).ready(function(){
			 $("#lf").click(function()
           { 
  $("#lf").fancybox({
      'autoSize':false,
    'width'  : 900,           // set the width
    'height' : 1100,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
});  
     
$(document).ready(function(){
			 $("#tsp").click(function()
           { 
  $("#tsp").fancybox({
      'autoSize':false,
    'width'  : 700,           // set the width
    'height' : 220,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
});  
        </script>
</head>

<body>

    <header>

        <div style="float:left; height:40px; font-size:30px; width:45%; color:white; padding-top:10px; padding-left:5%; font-family:Impact, Haettenschweiler, Arial Narrow Bold, sans-serif;"> eCab

        </div>

            <div class="hf" style=" float:left; height:40px; font-size:20px; width:47%; text-align:right; 
            color:white; padding-right:3%; padding-top:15px;">
            <a class="fancybox fancybox.iframe" id="l1" href="signin_ecab.jsp">Sign in</a>&nbsp;|&nbsp;
            <a class="fancybox fancybox.iframe" id="l5" href="signup_ecab.jsp">Sign up</a>
			
            </div>
    </header>



<div id="mid_work" >
<div style="padding:50px 200px 0 200px">
<div id="wrapper">
        

        <div class="slider-wrapper theme-default">
            <div id="slider" class="nivoSlider">
                <img src="images/banner/1.jpg"  alt="" />
                <img src="images/banner/2.jpg"  alt=""  />
                <img src="images/banner/4.jpg"  alt="" data-transition="slideInLeft" />
                
            </div>
            
        </div>


    </div>
	<script type="text/javascript">
     $(window).load(function() {
        $('#slider').nivoSlider();
    });
    $(document).ready(function (){
    $("#wrapper").fadeIn(2000);
    });
    
</script>
</div>
</div>

<div id="footer">
<div style="clear: both; float: left; width: 530px; height: 30px; margin: 10px 0 0 30px;
            font-size: 14px;">
            <div style="float: left; width: 100px; height: 30px;">
            
                <a class="fancybox fancybox.iframe" id="m1" href="aboutus.jsp">About Us</a>
            </div>
          <div style="float: left; width: 150px; height: 30px;">
               <a class="fancybox fancybox.iframe" id="tc" href="tc_p.jsp">Terms & Conditions</a>
            </div>
            <div style="float: left; width: 110px; height: 30px;">
               <a class="fancybox fancybox.iframe" id="lf" href="lf_p.jsp">Lost & found</a>
            </div>
             <div style="float: left; width: 150px; height: 30px;">
               <a class="fancybox fancybox.iframe" id="tsp" href="trackstatus.jsp">Track Status</a>
            </div>
        </div>
        <div style="float: right; width: 200px; height: 30px; margin: 5px 14px 0 0px; text-align: right;">
               
                        <%= (new java.util.Date()).toLocaleString()%>
            <div style="font-weight: bold;
                margin: 2px 0 0 0;">
                Aman-Kush Productions</div>
              <%
     if(request.getParameter("msg")!=null)
                    {
                      out.println("<script>alert('Password Changed')</script>");
                   //out.println("Password Changed");
                    }
    %>
    
        </div>
</div>
      <%
     if(request.getParameter("msg1")!=null)
                    {
                      out.println("<script>alert('Your Query is Saved. We will contact you as soon as possible  ')</script>");
                   //out.println("Password Changed");
                    }   
     %>
       <%
     if(request.getParameter("msg2")!=null)
                    {
                      out.println("<script>alert('Signup Successful')</script>");
                   //out.println("Password Changed");
                    }   
     %>
      <%
     if(request.getParameter("msg3")!=null)
                    {
                      out.println("<script>alert('Email Verified Now you can Login')</script>");
                   //out.println("Password Changed");
                    }   
     %>
</body>
           
</html>