<script src="js/jquery.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/jquery-ui.css">
<script type="text/javascript" src="js/fancybox/fancy_script.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.js"></script>
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/fancy_css.css">
<link rel="stylesheet" type="text/css" href="style_ecab/fancybox/jquery.fancybox.css">
<script type="text/javascript">
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
    'width'  : 1200,           // set the width
    'height' : 1000,           // set the height
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
<div id="footer">
        <div style="clear: both; float: left; width: 700px; height: 30px; margin: 10px 0 0 30px;
            font-size: 14px;">
            <div style="float: left; width: 100px; height: 30px;">
            
                <a class="fancybox fancybox.iframe" id="m1" href="aboutus.jsp">About Us</a>
            </div>
          <div style="float: left; width: 150px; height: 30px;">
               <a class="fancybox fancybox.iframe" id="tc" href="tc_p.jsp">Terms & Conditions</a>
            </div>
            <div style="float: left; width: 120px; height: 30px;">
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
                Kush Vatsa</div>
        </div>
    </div>