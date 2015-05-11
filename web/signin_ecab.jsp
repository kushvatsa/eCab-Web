<%@ page import="java.io.*,java.sql.*, javax.servlet.*" %>
<style type="text/css">
.hf a
{
    Text-decoration:none;
     font-size:18px; 
     color:#336699; 
     text-align:center; 
}
.hf a:hover
{
    text-decoration: underline;
}

.hf a:active
{
    font-weight: bold;
}
</style> 

<script language="javascript" type="text/javascript">  
function validate1()
{
	var em = document.getElementById('em').value.trim();
    var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
 
	
	if (em == "" || em == null) 
	{
        
		document.getElementById('ans').innerHTML = "Enter Email";
    }

	else if (!em.match(mailformat)) 
	{
      document.getElementById('ans').innerHTML = "Enter Valid Email Address";
    
    }
	else
	{
		document.getElementById('ans').innerHTML ="";
	}
	
	if(em == "admin")
	{
		document.getElementById('ans').innerHTML ="";
	}
}

function validate2()
{
	var pwd = document.getElementById('pwdl').value.trim();
 
	if (pwd == "" || pwd == null) 
	{
          document.getElementById('answ').innerHTML = "Enter Password";
	       
    } 
	else if (pwd.length <= 5) 
	{
       document.getElementById('answ').innerHTML = "Password Must be in 6 or more characters";
	
    }
	else
	{
		document.getElementById('answ').innerHTML ="";
	}
	
	
}

function validatezz()
{
	var em = document.getElementById('em').value.trim();
	var pwd = document.getElementById('pwdl').value.trim();
	
	if (em == "" || em == null && pwd == "" || pwd == null ) 
	{
        alert("Enter Email and Password");
		return false;
    }
	
	if (em == "" || em == null) 
	{
        alert("Enter Email");
		return false;
    }

	if (pwd == "" || pwd == null) 
	{
          alert("Enter Password");
	  return false;       
    } 
	
}
</script>
<body>
  <form method="post" id="form1" onSubmit="parent.$.fancybox.close();"  name="form1" action="welcome"  target="_parent">
  <h1 style="color:#336699; font-size:26px;"><u>Signin</u></h1>
  
    <table width="497" border="0" cellspacing="5" align="center" cellpadding="5" style="font-size:20px;">
      <tr>
        <td width="90" height="52" style="color:#336699;">Email:</td>
        <td width="283"><label for="em">
        <input type="text" name="em" id="em" onBlur="validate1();" style="height:30px; width:250px; font-size:20px;">
        <div id="ans" style="color:red; font-size:16px;"></div>
        </label></td>
      </tr>
      <tr>
        <td height="58" style="color:#336699;">Password:</td>
        <td><label for="pwdl">
        <input type="password" name="pwd" id="pwdl" onBlur="validate2();" style="height:30px; width:250px; font-size:20px;">
        <div id="answ" style="color:red; font-size:16px;"></div></label></td>
      </tr>
      
        <tr>
        <td></td>
        <td style=" font-size:20px; color:#336699;" >
        <label for="chk1">
        <input type="checkbox" name="chk1" id="chk1"/>Stay Signed in </label>
          </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td align="right"><input type="submit" name="Signin1" id="Signin1" onClick="return validatezz();"
        style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;" value="Signin"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
        <div class="hf" style="clear:both; text-align:right;"><a class="fancybox fancybox.iframe" id="l2" href="changepwd.jsp">Forgot Password?</a>
        </div>
        </td>
      </tr>
    </table>
  </form>
  </body>