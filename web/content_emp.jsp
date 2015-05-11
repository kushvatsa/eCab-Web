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
			 $("#h1").click(function()
           { 
  $("#h1").fancybox({
      'autoSize':false,
    'width'  : 1100,           // set the width
    'height' : 470,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 

$(document).ready(function(){
			 $("#h2").click(function()
           { 
  $("#h2").fancybox({
      'autoSize':false,
    'width'  : 450,           // set the width
    'height' : 290,           // set the height
    'type'   : 'iframe'      // tell the script to create an iframe
    
  });
		   });
}); 
        </script>
 <div id="content1">
        <br />
        <div class="left_tag">
            <a href="emp_home.jsp">Home</a></div>
        <br />
        <div class="left_tag">
            <a href="emp_book.jsp">Bookings</a></div>
        <br />
        <div class="left_tag">
            <a class="fancybox fancybox.iframe" id="h1" href="emp_help.jsp">Help</a></div>
        <br />
           <div class="left_tag">
            <a href="emp_prebook.jsp">Prev. Bookings</a></div>
        <br />
         <div class="left_tag">
            <a href="emp_cancelbook.jsp">Can. Bookings</a></div>
        <br />
        <div class="left_tag">
            <a class="fancybox fancybox.iframe" id="h2" href="emp_query.jsp">Query</a></div>
        <br />
        
</div>