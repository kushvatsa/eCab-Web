
<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="sun.misc.BASE64Decoder"%>
<div id="head">
        <div style="float: left; font-size: 25px; color: #ffffff; width: 200px; height: 40px;
            padding-left: 9px; padding-top: 20px;">
            eCab
        </div>
        <div style="float: right; color: #FFFFFF; font-size: 15px; width: 200px; height: 60px;
            text-align: right;">
            <div style="clear: both; width: 191px; color: #ffffff; height: 22px; padding: 8px 9px 0 0;">
                &nbsp;
                <%
                    Cookie myco[]=request.getCookies();
                  
                    if(myco!=null)
                    {
                        for(int x=0;x<myco.length;x++)
                        {
                        if(myco[x].getName().equals("username"))
                        {
                             byte[] valueDecoded= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("userid", new String(valueDecoded));
                              
                        }
                        if(myco[x].getName().equals("usermail"))
                        {
                             byte[] valueDecoded1= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("email", new String(valueDecoded1));
                        }
                         if(myco[x].getName().equals("adminname"))
                        {
                            byte[] valueDecoded= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("adminid", new String(valueDecoded));
                        }
                          if(myco[x].getName().equals("adminmail"))
                        {
                             byte[] valueDecoded1= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("email", new String(valueDecoded1));
                        }
                          if(myco[x].getName().equals("drivername"))
                        {
                            byte[] valueDecoded= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("empid", new String(valueDecoded));
                        }
                            if(myco[x].getName().equals("drivermail"))
                        {
                            byte[] valueDecoded= Base64.decodeBase64(myco[x].getValue().getBytes());
                            session.setAttribute("empemail", new String(valueDecoded));
                        }
                        }
                        
                    }
                    
                    
                    %>
                <%
                    if(session.getAttribute("userid")!=null)
                    {
                        
                         out.println("Welcome "+session.getAttribute("userid")); 
                         %>
                         </div>
                        <div style="clear: both; width: 191px; color: #ffffff; height: 22px; padding: 8px 9px 0 0;">
                         <%
                         out.println("<a href='Logout.jsp' class='logouts'>Logout</a>");
                         
                         }
                    else if(session.getAttribute("adminid")!=null)
                    {
                         out.println("Welcome "+session.getAttribute("adminid")); 
                         %>
                         </div>
                        <div style="clear: both; width: 191px; color: #ffffff; height: 22px; padding: 8px 9px 0 0;">
                         <%
                         out.println("<a href='Logout.jsp' class='logouts'>Logout</a>");
                         
                         }
                      else  if(session.getAttribute("empid")!=null)
                    {
                         out.println("Welcome "+session.getAttribute("empid")); 
                         %>
                         </div>
                        <div style="clear: both; width: 191px; color: #ffffff; height: 22px; padding: 8px 9px 0 0;">
                         <%
                         out.println("<a href='Logout.jsp' class='logouts'>Logout</a>");
                         
                         }
                    else{
                            out.print("Welcome Guest");
                    %> </div>
           <div style="clear: both; width: 191px; color: #ffffff; height: 22px; padding: 8px 9px 0 0;">
                <%
                             out.print("<a href='Logout.jsp' class='logouts'>SignIn</a>");
                            
                                          }
                                        
                %>
                </div>
        </div>
    </div>