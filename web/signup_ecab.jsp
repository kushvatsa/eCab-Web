<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="java.util.Properties"%>
<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<script language="javascript" type="text/javascript">
function validate1()
{
    
	var name = document.getElementById('name').value.trim();
	var email = document.getElementById('email').value.trim();
     
	var pwd = document.getElementById('pwd').value.trim();
	var rpwd = document.getElementById('rpwd').value.trim();
	var male = document.getElementById('male').checked;
    var female = document.getElementById('female').checked;
	var mno = document.getElementById('mno').value.trim();
	var sques = document.getElementById('sques').value.trim();
	var sans = document.getElementById('sans').value.trim();
	var addr = document.getElementById('addr').value.trim();
       // var erro = document.getElementById('erro').value.trim();
    var letters = /^[A-Za-z]+$/;
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    var numbers = /^[0-9]+$/;
	var alpha = /^[0-9a-z]+$/;
	var alphaspace = /^[a-zA-Z-,]+(\s{0,1}[a-zA-Z-,])*$/;
        
       
	if (name == "" || name == null) 
	{
        alert("Enter Name");
		return false;
    }
	else if (name.length < 3) 
	{
      alert("Name Must be in 3 or more characters");
	  return false;
    }

	else if (!name.match(alphaspace)) 
	{
      alert("Enter characters only in Name");
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
  
       
	
	if (pwd == "" || pwd == null) 
	{
      alert("Enter Password");
	  return false;       
    } 
	else if (pwd.length <= 5) 
	{
      alert("Password Must be in 6 or more characters");
	  return false;
    }
	if(pwd != rpwd)
    {
      alert("Password doesn\'t match");
	  return false;
    }
	
	if (male == false && female == false)  {
        alert("Select Gender");
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
	
	if(sques.length <=0)
		{
			alert("Select Security Question");
			return false;
		}
		else if(sques == "select")
		{
			alert("Select Security Question");
			return false;
		}
		
		if (sans == "" || sans == null) 
	{
        alert("Enter Security Answer");
		return false;
    }
	else if (sans.length >= 20) 
	{
      alert("Answer limit Exceeds");
	  return false;
    }
	
	if (addr == "" || addr == null) 
	{
        alert("Enter Address");
		return false;
    }
	else if (addr.length >= 100) 
	{
      alert("Address limit Exceeds");
	  return false;
    }
}



                         function Check1(str)
                    {
                      
                    if(window.ActiveXObject)
                    {
                        obj=new ActiveXObject("Microsoft.ActiveXObject");
                    }
                    else if(window.XMLHttpRequest)
                    {
                        obj=new XMLHttpRequest();
                    }
                    obj.onreadystatechange=function()
                    {
                        if(obj.readyState<4)
                        {
                           
                         // document.getElementById("cl").innerHTML="<img src='images/preloader.gif' /> ";  
                        }
                        else if(obj.readyState===4&&obj.status===200)
                        {
                             document.getElementById("erro").innerHTML=obj.responseText;
                            
                          
                        }
                    }
                    obj.open("GET","putsec.jsp?error="+str,true);
                    obj.send();
          }
                    				
                     
    </script>
    
<form name="formz1" onSubmit="parent.$.fancybox.close();" target="_parent">
            <h1 style="color:#336699;"><u>Signup</u></h1>
          <table width="477" height="393" border="0" cellpadding="5" cellspacing="5" style="font-size:18px; color:#336699;">
            <tr>
              <td width="132" align="left" valign="top">Name:</td>
              <td width="310" align="left" valign="top"><label for="name"></label>
              <input type="text" name="name" id="name" style="height:25px; width:200px; font-size:18px;" /></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Email:</td>
              <td width="310" align="left" valign="top"><label for="email"></label>
                  <input type="text" name="email" id="email" style="height:25px; width:200px; font-size:18px;" onblur="Check1(this.value)" />
                  <div id="erro"></div>
              </td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Password:</td>
              <td width="310" align="left" valign="top"><label for="pwd"></label>
              <input type="password" name="pwd" id="pwd" style="height:25px; width:200px; font-size:18px;" /></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Re-Password:</td>
              <td width="310" align="left" valign="top"><label for="rpwd"></label>
              <input type="password" name="rpwd" id="rpwd" style="height:25px; width:200px; font-size:18px;" /></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Gender:</td>
              <td width="310" align="left" valign="top">
                <label>
                  <input type="radio" name="gender" value="male" id="male" />
                Male</label>
                <label>
                  <input type="radio" name="gender" value="female" id="female" />
                  Female</label>
             </td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Mobile no:</td>
              <td width="310" align="left" valign="top"><label for="mno"></label>
              <input name="mno" type="text" class="tboxes" id="mno" maxlength="10" style="height:25px; width:200px; font-size:18px;" /></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Security Question:</td>
              <td width="310" align="left" valign="top"><label for="sques"></label>
                <select name="sques" id="sques" style="height:25px; width:200px; font-size:18px;">
                  <option selected="selected">Select</option>
                  <option>Your Childhood Name?</option>
                  <option>First School Name?</option>
                  <option>Mother's Maiden Name?</option>
                  <option>Favourite Actor?</option>
              </select></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Security Answer:</td>
              <td width="310" align="left" valign="top"><label for="sans"></label>
              <input type="text" name="sans" id="sans" style="height:25px; width:200px; font-size:18px;" /></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">Address:</td>
              <td width="310" align="left" valign="top"><label for="addr"></label>
              <textarea name="addr" id="addr" cols="30" rows="7"></textarea></td>
            </tr>
            <tr>
              <td width="132" align="left" valign="top">&nbsp;</td>
              <td width="310" align="left" valign="top"><input type="submit" name="Submit" id="Submit" onClick="return validate1()" value="Submit"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" /> 
            <input type="reset" name="Submit2" id="Submit2" value="Reset"
            style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" />
    </td>
            </tr>
          </table>   
</form>
        <%
            
            
                     if(request.getParameter("Submit")!=null)
                         {
            String pattern = "dd-MM-yyyy";
           String dateInString =new SimpleDateFormat(pattern).format(new java.util.Date());
    String userid = request.getParameter("name");    
    String mail = request.getParameter("email");
     String pwd = request.getParameter("pwd");
    String rpwd = request.getParameter("rpwd");
    String gender1 = request.getParameter("gender");    
    String mobile = request.getParameter("mno");
     String address = request.getParameter("addr");
     String sques = request.getParameter("sques");    
    String sans = request.getParameter("sans");
            if(pwd.equals(rpwd))
            {
         String path= "jdbc:mysql://localhost:3306/ecab";
        //  String place="courierdb";
        Connection mycon;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            mycon = DriverManager.getConnection(path,"root","");
            
              String query2 ="insert into allusers values(?,MD5(?),?,?,?,?,?)";
          
            try{
               
                PreparedStatement myst2=mycon.prepareStatement(query2);
              
               // myst.setString(1,mail);
                
                 
                 myst2.setString(1,mail);
                  myst2.setString(2,pwd);
                   myst2.setString(3,"User");
                  myst2.setString(4,dateInString);
                myst2.setString(5,sques);
                myst2.setString(6,sans);
                 myst2.setString(7,"No");
                
               
                int j= myst2.executeUpdate();
                if(j>0)
                {
                    String query ="insert into user (email,name,gender,mobile,addr,image) values(?,?,?,?,?,?)";
                     PreparedStatement myst=mycon.prepareStatement(query);
                       myst.setString(1,mail);
                      myst.setString(2,userid);
                myst.setString(3,gender1);
                myst.setString(4,mobile);
                myst.setString(5,address);
                 myst.setString(6,"pic.jpg");
                     int i= myst.executeUpdate();
                     if(i>0)
                     {
                                     Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session2 = Session.getInstance(props,
			new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ecabservice739@gmail.com","#qwerty@");
				}
			});
		try {
			Message message = new MimeMessage(session2);
        message.addHeader("Content-type", "text/html; charset=UTF-8");
	message.setFrom(new InternetAddress("ecabservice739@gmail.com"));
	message.setRecipients(Message.RecipientType.TO,	InternetAddress.parse(mail));
	message.setSubject("Welcome to eCab");
        String link="<a href=http://localhost:8080/ecab/authenticate.jsp?email="+ mail +">Click here to authenticate</a>";
        message.setText("You have signed up at our website. Please authenticate your "
                + "emailid by clicking the link below \n" + link);



                response.sendRedirect("welcome_ecab.jsp?msg2=true");
			Transport.send(message);



		}
                catch (MessagingException e)
                {
			throw new RuntimeException(e);
		}
                     
					//out.println("<p style='font-size:18px; color:green;'>Signup Successful</p>" );
                     }
                }
                else{
                out.print("<p style=' font-size:18px; color:Red'>Invalid password<p>");
                }
            } catch (Exception e) {
               //out.print("<p style='font-size:18px; color:Red'>" +"Primary Key Already Taken" + "</p>");
                 out.print(e.getMessage());
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
             else{
                   out.print("<p style='color:Red'>" +"password/confirm password mismatch" + "</p>");
                }
}
                  
%>
