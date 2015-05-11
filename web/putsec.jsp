<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="java.sql.*" %>
<%
        if(request.getParameter("parea")!=null)
                                     {
                                         //Thread.sleep(1000);
                            String s=request.getParameter("parea");
                             String path2="jdbc:mysql://localhost/ecab";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon1;
                                    try
                                         {
                  
                                       mycon1=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                                        String query ="SELECT DISTINCT pickarea from routeid where pickarea!=? ";
                                     PreparedStatement myst=mycon1.prepareStatement(query);
                                          myst.setString(1,s);
                                             ResultSet myrs= myst.executeQuery();
                                                     out.println("<select name='daddr' id ='daddr' style='width:150px;'>");
                                                    if(myrs.next())
                                                    {
                                                           out.println("<option value='Select'>Select</option>");
                                                         do
                                                         { 
                                                   out.println("<option value='"+myrs.getString(1)+"'>"+myrs.getString(1)+"</option>");
                                                             } 
                                                        while(myrs.next());
                                                        
                                                    }else{
                                                         out.println("<option>No City</option>");
                                                    }
                                                        out.println("</select>");
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon1.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 }
                              }
        
        
        if(request.getParameter("error")!=null)
        {
            String a= request.getParameter("error");
            
                            
                             String path3="jdbc:mysql://localhost/ecab";
                               Class.forName("com.mysql.jdbc.Driver");
                                     Connection mycon3;
                                    try
                                         {
                  
                                       mycon3=DriverManager.getConnection(path3,"root","");
                                        String query1 ="select * from allusers where email = ? ";
                                 
                                              try
                                                    {
                                       PreparedStatement myst1=mycon3.prepareStatement(query1);
                                  
                                         myst1.setString(1,a);
                                       
                                             ResultSet myrs1= myst1.executeQuery();
                                            
                                                     
                                                    if(myrs1.next())
                                                    {
                                                          out.println("Email already exist");
                                                        
                                                    }
                                                     
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon3.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 }
            
            
            
        }
  

                    if(request.getParameter("show")!=null)
                                     {
                                         //Thread.sleep(1000);
                                         String unid1= null;
                            String s=request.getParameter("show");
                                String dateReceived =session.getAttribute("pdate").toString();
                        DateFormat userDateFormat = new SimpleDateFormat("yyyy-mm-dd");
                        DateFormat dateFormatNeeded = new SimpleDateFormat("dd-mm-yyyy");
                        java.util.Date date = userDateFormat.parse(dateReceived);
                        String cd1 = dateFormatNeeded.format(date);
                           
                                    try
                                         {
                                                  String path2="jdbc:mysql://localhost/ecab";
                                                Class.forName("com.mysql.jdbc.Driver");
                                                       Connection mycon1;
                                       mycon1=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                    PreparedStatement ps41=mycon1.prepareStatement("select * from cabstatus where date=? and Status=?");
                                ps41.setString(1,cd1);
                                 ps41.setString(2,"Active");
                            ResultSet rs41=ps41.executeQuery();
                            if(rs41.next()&&rs41.getString("date").equals(cd1))
                            { 
                               String s1=null ;
                                do
                                {  
                                 s1 = s1 +","+rs41.getString("cab_id") ;       
                                   }while(rs41.next());
                                unid1=s1.substring(5);
                             
                             }
                                   
                                   else
                                   {
                                       
                             PreparedStatement ps51=mycon1.prepareStatement("select * from cabs where type=?");
                             ps51.setString(1,s);
                             ResultSet rs51=ps51.executeQuery();
                          
                              if(rs51.next())
                                                    {
                                                        
                                                     int n= Integer.parseInt(rs51.getString("ratekm"));
                                                        int cal=Integer.parseInt(session.getAttribute("km").toString())*n;
                                                           session.setAttribute("v_type",s);
                                                             session.setAttribute("v_name",rs51.getString("vehiclename"));
                                                           session.setAttribute("v_regno",rs51.getString("registerno"));
                                                            session.setAttribute("v_rate",rs51.getString("ratekm"));
                                                              session.setAttribute("v_rid",rs51.getString("cab_id"));
                                                           session.setAttribute("bill",cal);
                                                        
                                      out.println(" <table width='400' height='481' cellpadding='5' cellspacing='10' style='border:#000 solid 1px;'>"+
                                            "<tr>"+
                                             " <td width='350' height='150'><img src='cabimg/"+rs51.getString(7)+"' width='370' height='200'></td>"+
                                            "</tr><tr>"+
                                              "<td valign='top'><table width='350'cellspacing='5' cellpadding='5'>"+
                                                "<tr>"+
                                                  "<td width='104' class='t1'>Name:</td>"+
                                                  "<td width='123' class='t2'>"+rs51.getString(1)+"</td>"+
                                                "</tr><tr>"+
                                                  "<td class='t1'>Type</td>"+
                                                  "<td class='t2'>"+rs51.getString(2)+"</td>"+   
                                              "</tr><tr>"+
                                                  "<td class='t1'>Rate/km</td>"+
                                                  "<td class='t2'>"+rs51.getString(4)+"</td>"+
                                                  "</tr><tr>"+
                                                  "<td class='t1'>Capacity</td>"+
                                                  "<td class='t2'>"+rs51.getString(5)+"</td>"+
                                                   "</tr><tr>"+
                                                  "<td class='t1'>Cab No.</td>"+
                                                  "<td class='t2'>"+rs51.getString(3)+"</td>"+
                                                 " </tr></table></td></tr></table>");

                                                    }
                                                         }    
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon1.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 }
                                     if(unid1!=null)
                                     {
                                    try
                                         {
                                                 String path2="jdbc:mysql://localhost/ecab";
                                                    Class.forName("com.mysql.jdbc.Driver");
                                                          Connection mycon42;
                                       mycon42=DriverManager.getConnection(path2,"root","");
                                              try
                                                    {
                                        String query ="select * from cabs where cab_id NOT IN ("+unid1+") and type=?";
                                        
                                     PreparedStatement myst42=mycon42.prepareStatement(query);
        
                                       myst42.setString(1,s);
                                           
                                             ResultSet myrs42= myst42.executeQuery();
                                                        
                                                    if(myrs42.next())
                                                    {
                                                      int n= Integer.parseInt(myrs42.getString("ratekm"));
                                                        int cal=Integer.parseInt(session.getAttribute("km").toString())*n;
                                                           session.setAttribute("v_type",s);
                                                             session.setAttribute("v_name",myrs42.getString("vehiclename"));
                                                           session.setAttribute("v_regno",myrs42.getString("registerno"));
                                                            session.setAttribute("v_rate",myrs42.getString("ratekm"));
                                                              session.setAttribute("v_rid",myrs42.getString("cab_id"));
                                                           session.setAttribute("bill",cal);
                                                        
                                      out.println(" <table width='400' height='481' cellpadding='5' cellspacing='5' style='border:#000 solid 1px;'>"+
                                            "<tr>"+
                                             " <td width='350' height='150'><img src='cabimg/"+myrs42.getString(7)+"' width='370' height='200'></td>"+
                                            "</tr><tr>"+
                                              "<td valign='top'><table width='350'cellspacing='5' cellpadding='5'>"+
                                                "<tr>"+
                                                  "<td width='104' class='t1'>Name:</td>"+
                                                  "<td width='123' class='t2'>"+myrs42.getString(1)+"</td>"+
                                                "</tr><tr>"+
                                                  "<td class='t1'>Type</td>"+
                                                  "<td class='t2'>"+myrs42.getString(2)+"</td>"+   
                                              "</tr><tr>"+
                                                  "<td class='t1'>Rate/km</td>"+
                                                  "<td class='t2'>"+myrs42.getString(4)+"</td>"+
                                                  "</tr><tr>"+
                                                  "<td class='t1'>Capacity</td>"+
                                                  "<td class='t2'>"+myrs42.getString(5)+"</td>"+
                                                   "</tr><tr>"+
                                                  "<td class='t1'>Cab No.</td>"+
                                                  "<td class='t2'>"+myrs42.getString(3)+"</td>"+
                                                 " </tr></table></td></tr></table>");
  
                                                        
                                                    }
                           
                                            }
                                            catch(Exception e)
                                              {
                                                  out.println("Error in Query " + e.getMessage());
                                              }
                                            finally
                                            {
                                                mycon42.close();
                                            }
                                        }
                                        catch(Exception e)
                                         {
                                            out.println("Error in Connection " + e.getMessage());
                                                 } 
               
               
               }
            
                              }
                    
 
    %>