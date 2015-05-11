<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!DOCTYPE html>
<head>
<link href="style_ecab/StyleSheet.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Feedback</title>
<%
    response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
    %>


  <%
   if(session.getAttribute("userid")==null)
   {
       response.sendRedirect("welcome_ecab.jsp");
   }
   
   %>
   <script language="javascript" type="text/javascript">
function validate1()
{
	var rating_0 = document.getElementById('rating_0').checked;
	var rating_1 = document.getElementById('rating_1').checked;
	var rating_2 = document.getElementById('rating_2').checked;
	var rating_3 = document.getElementById('rating_3').checked;
	var rating_4 = document.getElementById('rating_4').checked;
	var txtar = document.getElementById('txtar').value.trim();
 
	if (rating_0 == false && rating_1 == false && rating_2 == false && rating_3 == false && rating_4 == false)  
	{
        alert("Select Rating");
		return false;
    }
	

	if (txtar == "" || txtar == null) 
	{
        alert("Enter FeedBack in Text Area");
		return false;
    }
}
</script>
<script type="text/javascript">
        function sizeshow() {
            var clientheight = document.documentElement.clientHeight;
            var clientwidth = document.documentElement.clientWidth;
          

            var setheight = parseInt(clientheight - 60 - 40 - 2);
            var setwidth = parseInt(clientwidth - 130 - 170 - 7);

            document.getElementById("content1").style.height = setheight + 'px';
            document.getElementById("contentmid").style.height = setheight + 'px';
            document.getElementById("content2").style.height = setheight + 'px';

            
            document.getElementById("contentmid").style.width = setwidth + 'px';
           

            return true;
        }
    </script>
</head>

<body onload=" return sizeshow();" onresize="return sizeshow();">

   
  <%@include file="header.jsp"%>
  <%@include file="contentusr1.jsp" %>
    <div id="contentmid">
         <div id="sub_menu"><u>Feedback:</u>

         </div>
         <form name="form1" method="post" action="">
         <p style=" font-size:20px; color:#336699; padding:5px 0 0 50px">How would you rate your experience using eCab?</p>
         <p style=" font-size:15px; color:red; padding:0 0 0 50px">1-Minimum ---- 5-Maximum</p>
         <p style=" font-size:15px; color:#336699; padding:5px 0 0 50px">
           <label>
             <input type="radio" name="rating" value="1" id="rating_0">
             1</label>
           <label>
             <input type="radio" name="rating" value="2" id="rating_1">
             2</label>
           <label>
             <input type="radio" name="rating" value="3" id="rating_2">
             3</label>
           <label>
             <input type="radio" name="rating" value="4" id="rating_3">
             4</label>
           <label>
             <input type="radio" name="rating" value="5" id="rating_4">
             5</label>
         </p>
         <p style=" font-size:20px; color:#336699; padding:5px 0 0 50px">Your Feedback</p>
         <p style=" font-size:15px; color:#336699; padding:5px 0 0 50px"><textarea name="txtar" id="txtar" cols="30" rows="5"></textarea></p>
         
         <p style="padding:5px 0 0 50px"><input type="submit" name="Submit1" id="Submit" value="Submit" onClick="return validate1()"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /></p>
          <%
                     if(request.getParameter("Submit1")!=null)
       {
        
    String rate1 = request.getParameter("rating");
     String feed1 = request.getParameter("txtar");
     String uname1=session.getAttribute("userid").toString();
   
           
         String path= "jdbc:mysql://localhost:3306/ecab";
        //  String place="courierdb";
        Connection mycon;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            mycon = DriverManager.getConnection(path,"root","");
            String query ="insert into feedback values(?,?,?)";
    
            try{
                PreparedStatement myst=mycon.prepareStatement(query);
                myst.setString(1,rate1);
                 myst.setString(2,uname1);
                myst.setString(3,feed1);    
                int i= myst.executeUpdate();
               
                if(i>0)
                {
                    out.print("<p style='padding: 0 0 0 25px; color:Green;'>Feedback Saved</p>");
              
                    }
                
                else{
                   out.print("<p style='padding: 0 0 0 25px; color:Red;'>Feedback Not Saved</p>");
                  
                }
            } catch (Exception e) {
               out.println("Error due to"+e.getMessage());
            }
            finally
            {
                mycon.close();
            }
        }
        catch(Exception e)
        {
            out.println("Error in connection"+e.getMessage() );
        }
                }
                         
%>
         </form>
    </div>
   
    <div id="content2">
        
    </div>
    
  <%@include file="usr_footer.jsp" %>

</body>

</html>