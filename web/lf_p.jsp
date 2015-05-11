<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<script type="text/javascript">
	function time()
{
	var d = new Date();
	
	var a = d.getDate();
	var b = d.getMonth()+1;
	var c = d.getFullYear();
	
	if(a>=1 && a<=9)
	{
	a= "0"+ a;
	}
	if(b>=1 && b<=9)
	{
	b= "0"+ b;
	}
	
	var i = c + "-" + b + "-" + a;
	document.getElementById("pdate").max =i;
}
</script>
          
<script language="javascript" type="text/javascript">  
function validate()
{
	var uname = document.getElementById('uname').value.trim();
	var mno = document.getElementById('mno').value.trim();
	var email = document.getElementById('email').value.trim();
	var date1 = document.getElementById('pdate').value.trim();
	var darea = document.getElementById('darea').value.trim();
	var parea = document.getElementById('parea').value.trim();
	var desc = document.getElementById('desc').value.trim();
	var letters = /^[A-Za-z]+$/;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
       
 
	if (uname == "" || uname == null) 
	{
        alert("Enter Name");
		return false;
    }
	else if (uname.length < 3) 
	{
      alert("Name Must be in 3 or more characters");
	  return false;
    }

	else if (!uname.match(alphaspace)) 
	{
      alert("Enter characters only in Name");
	  return false;    
    }
	if (mno == "" || mno== null) 
	{
        alert("Enter Mobile Number");
		return false;
    }
	else if (mno.length == 9) 
	{
      alert("Mobile Number Must be in 10 characters");
	  return false;
    }

	else if (!mno.match(numbers)) 
	{
      alert("Enter Valid Mobile Number");
	  return false;    
    }
	
	if (email == "" || email == null) 
	{
        alert("Enter Email");
		return false;
    }

	else if (!email.match(mailformat)) 
	{
      alert("Enter Valid Email Address");
	  return false;    
    }
	if (date1 == "" || date1 == null) 
	{
        alert("Enter Date");
		return false;
    }
	if (darea == "" || darea == null) 
	{
        alert("Enter City");
		return false;
    }
	if (parea == "" || parea == null) 
	{
        alert("Enter Pickup Area");
		return false;
    }
	if (desc == "" || desc == null) 
	{
        alert("Enter Description");
		return false;
    }
}
</script>
<body onload="time();">
<h1 style="color:#336699; font-size:26px;"><u>Lost & Found</u></h1> 
<h3 style="font-size:16px;">Have you left your bag, mobile or any other personal item in a eCab? 
Relax! We will try our best to locate and return your item. 3 ways to find your belongings</h3>
<h3 style="font-size:17px; color:#336699;">1. Contact your driver<h3>
<p style="font-size:16px; padding:0px;">eCab chauffeurs are extremely helpful and will try their best to return your items back to you within their means. Try contacting the driver on the same number that you would have received at the time of your booking.</p>
<h3 style="font-size:17px; color:#336699;">2. Tell us about the incident and we will contact you</h3>
<form onsubmit="parent.$.fancybox.close(); " target="_parent">
  <table width="711" height="330" border="0" cellpadding="5" cellspacing="5">
  <tr>
    <td width="119" height="310" valign="top"><table width="119" height="277" border="0" cellpadding="5" cellspacing="5" style="font-weight:bold;">
      <tr>
        <td width="99" height="64">Who?*</td>
      </tr>
      <tr>
        <td height="62">When?*</td>
      </tr>
      <tr>
        <td height="65">Where?*</td>
      </tr>
      <tr>
        <td>What?*</td>
      </tr>
    </table></td>
    <td width="620" valign="top">
    <table width="557" height="277" border="0" cellpadding="5" cellspacing="5" style="font-weight:bold;">
      <tr>
        <td>Your Name</td>
        <td>Your Mobile</td>
        <td>Your email</td>
      </tr>
      <tr>
        <td><label for="name"></label>
          <input type="text" name="uname" id="uname" /></td>
        <td><label for="mno"></label>
          <input type="text" name="mno" id="mno" /></td>
        <td><label for="email"></label>
          <input type="text" name="email" id="email" /></td>
      </tr>
      <tr>
        <td>Date</td>
        <td>Time</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><label for="date"></label>
          <input type="date" name="date" id="pdate" /></td>
        <td><select name="ptime" id="ptime">
          <option value="select" selected="selected">Select</option>
          <option value="12:30 am">12:30 am</option>
          <option value="1:30 am">1:30 am</option>
          <option value="2:30 am">2:30 am</option>
          <option value="3:30 am">3:30 am</option>
          <option value="4:30 am">4:30 am</option>
          <option value="5:30 am">5:30 am</option>
          <option value="6:30 am">6:30 am</option>
          <option value="7:30 am">7:30 am</option>
          <option value="8:30 am">8:30 am</option>
          <option value="9:30 am">9:30 am</option>
          <option value="10:30 am">10:30 am</option>
          <option value="11:30 am">11 :30 am </option>
          <option value="12:30 pm">12:30 pm </option>
          <option value="1:30 pm">1:30 pm</option>
          <option value="2:30 pm ">2:30 pm </option>
          <option value="3:30 pm">3:30 pm</option>
          <option value="4:30 pm">4:30 pm</option>
          <option value="5:30 pm">5:30 pm</option>
          <option value="6:30 pm">6:30 pm</option>
          <option value="7:30 pm">7:30 pm</option>
          <option value="8:30 pm">8:30 pm</option>
          <option value="9:30 pm">9:30 pm</option>
          <option value="10:30 pm">10:30 pm</option>
          <option value="11:30 pm"> 11:30 pm</option>
        </select></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>City</td>
        <td>Pickup Area</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><label for="darea"></label>
          <input type="text" name="darea" id="darea" /></td>
        <td><label for="parea"></label>
          <input type="text" name="parea" id="parea" /></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>Item Description</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29"><label for="desc"></label>
          <textarea name="desc" id="desc" cols="25" rows="5"></textarea></td>
        <td align="right"><input type="submit" name="Submit1" id="Submit1"  
        style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" value="Submit"
         onclick="return validate();" /></td>
        <td>&nbsp;</td>
      </tr>
      </table></td>
  </tr>
</table>
    <%
                     if(request.getParameter("Submit1")!=null)
       {
    String userid = request.getParameter("uname");    
    String mail = request.getParameter("email");
     String mobile = request.getParameter("mno");
     String date = request.getParameter("date");
    String time = request.getParameter("ptime");
    String city = request.getParameter("darea");    
     String parea = request.getParameter("parea");
     String desc = request.getParameter("desc");    
    
          
         String path= "jdbc:mysql://localhost:3306/ecab";
        
        Connection mycon;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            mycon = DriverManager.getConnection(path,"root","");
            String query ="insert into lostfound values(?,?,?,?,?,?,?,?)";
    
          
            try{
                PreparedStatement myst=mycon.prepareStatement(query);
                myst.setString(1,userid);
                myst.setString(2,mobile);
                myst.setString(3,mail);
                myst.setString(4,date);
                myst.setString(5,time);
                myst.setString(6,city);
                myst.setString(7,parea);
                myst.setString(8,desc); 
                int i= myst.executeUpdate();
               
                if(i>0)
                {
					//out.println("<p style='font-size:18px; color:green;'>Query Saved</p>" );
                     response.sendRedirect("welcome_ecab.jsp?msg1=true");
                }
                else{
                out.print("<p style=' font-size:18px; color:Red'>Query Not Saved<p>");
                }
            } catch (Exception e) {
               out.print("Error in Query"+e.getMessage() );
            }
            finally
            {
                mycon.close();
            }
        }
        catch(Exception e)
        {
            out.print("Error in connection"+e.getMessage() );
        }
    
        
            }
            
            
                  
%>


</form>
<h3 style="font-size:17px; color:#336699;">3. Email us </h3>
<p style="font-weight:bold;">ecabservice739@gmail.com</p>
</body>