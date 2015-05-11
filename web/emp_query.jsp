<%@page import="java.sql.*"%>
<script language="javascript" type="text/javascript">
function validate()
		{
			var qarea = document.getElementById('qarea').value.trim();
	
	if (qarea== "" || qarea== null) 
	{
            alert("Enter Your Query");
            return false;
    }

    }
</script>
<form action="" method="get">
  <table width="400" border="0" align="left" cellpadding="5" cellspacing="5">
    <tr>
      <td style="color:#336699; font-size:26px;">Query:-</td>
    </tr>
    <tr>
      <td><label for="qarea"></label>
      <textarea name="qarea" id="qarea" cols="45" rows="10"></textarea></td>
    </tr>
    <tr>
      <td align="right"><input type="submit" name="Submit" onclick="return validate();" id="Submit" value="Submit"
      style="color:#ffffff; background-color:#336699; width:80px; height:30px; border-radius:7px;"></td>
    </tr>
  </table>
     <%
                     if(request.getParameter("Submit")!=null)
       {
        
    String driverid = session.getAttribute("empid1").toString();
     String query = request.getParameter("qarea");
     String drivername=session.getAttribute("empid").toString();
   
           
         String path= "jdbc:mysql://localhost:3306/ecab";
        //  String place="courierdb";
        Connection mycon;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            mycon = DriverManager.getConnection(path,"root","");
            String query1 ="insert into driver_query values(?,?,?)";
    
            try{
                PreparedStatement myst=mycon.prepareStatement(query1);
                myst.setString(1,driverid);
                 myst.setString(2,drivername);
                myst.setString(3,query);    
                int i= myst.executeUpdate();
               
                if(i>0)
                {
                    out.print("<p style='padding: 0 0 0 25px; color:Green;'>Query Saved</p>");
              
                    }
                
                else{
                   out.print("<p style='padding: 0 0 0 25px; color:Red;'>Query Not Saved</p>");
                  
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