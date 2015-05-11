
package ourservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import sun.misc.BASE64Encoder;


public class Login extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
       HttpSession session=request.getSession();
       PrintWriter out=response.getWriter();
       RequestDispatcher mydi=null;
       ServletConfig config= this.getServletConfig();
       ServletContext mycont=config.getServletContext();
       if(request.getParameter("Signin1")!=null)
                          {
                        String userid = request.getParameter("em");    
                        String pwd = request.getParameter("pwd");           
                        String path=mycont.getInitParameter("PATH");
                         String uname=mycont.getInitParameter("UNAME") ;
                          String pass= mycont.getInitParameter("PASSWORD");
                       Connection mycon;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                mycon = DriverManager.getConnection(path,uname,pass);
                                String query ="select * from allusers where email = ? and password = MD5(?)";
                                 
                                try{
                                    PreparedStatement myst=mycon.prepareStatement(query);
                                   
                                    myst.setString(1,userid);
                                    myst.setString(2, pwd);
                               
                                    ResultSet myrs = myst.executeQuery();
                                    
                                    if(myrs.next())
                                    {
                                       if(myrs.getString("authenticate").equals("Yes"))
                                            { 
                                       String ty=myrs.getString("typeid");
                                        if(ty.equals("User"))
                                        {
                                            
                                             String query1 ="select * from user where email = ?";
                                              PreparedStatement myst1=mycon.prepareStatement(query1);
                                                myst1.setString(1,userid);
                                                  ResultSet myrs1 = myst1.executeQuery();
                                                  if(myrs1.next())
                                                  {
                                                       if(request.getParameter("chk1")!=null)
                                                                 {
                                                        BASE64Encoder bas64 =new BASE64Encoder();
                                               String dig = bas64.encode(myrs1.getString("name").getBytes());
                                             String dig1 = bas64.encode(myrs1.getString("email").getBytes());
                                            Cookie myck = new Cookie("username",dig);
                                            Cookie myck1 = new Cookie("usermail",dig1);
                                                        myck.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck);
                                                        myck1.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck1);
                                                                         }
                                                session.setAttribute("userid", myrs1.getString("name"));
                                             session.setAttribute("email", myrs1.getString("email"));
                                              mydi=request.getRequestDispatcher("usr_home.jsp");
                                                mydi.forward(request, response);
                                                  }
                                             
                                                  
                                                
                                        }
                                        else if(ty.equals("Admin"))
                                        {
                                             String query2 ="select * from admin where email = ?";
                                              PreparedStatement myst2=mycon.prepareStatement(query2);
                                                myst2.setString(1,userid);
                                                 ResultSet myrs2 = myst2.executeQuery();
                                                 if(myrs2.next())
                                                 {
                                           if(request.getParameter("chk1")!=null)
                                                  {
                                                      BASE64Encoder bas64 =new BASE64Encoder();
                                               String dig = bas64.encode(myrs2.getString("name").getBytes());
                                             String dig1 = bas64.encode(myrs2.getString("email").getBytes());
                                            Cookie myck = new Cookie("adminname",dig);
                                            Cookie myck1 = new Cookie("adminmail",dig1);
                                                        myck.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck);
                                                        myck1.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck1);
                                                  }
                                           session.setAttribute("adminid", myrs2.getString("name"));
                                            session.setAttribute("adminemail", myrs2.getString("email"));
                                             mydi=request.getRequestDispatcher("ad_home.jsp");
                                                mydi.forward(request, response); 
                                                 }
                                           
                                                 
                                        }
                                       
                                    
                                    else if(ty.equals("Driver"))
                                        {
                                             String query3 ="select * from driver where email = ?";
                                              PreparedStatement myst3=mycon.prepareStatement(query3);
                                                myst3.setString(1,userid);
                                                 ResultSet myrs3 = myst3.executeQuery();
                                                 if(myrs3.next())
                                                 {
                                                       if(request.getParameter("chk1")!=null)
                                                            {
                                           BASE64Encoder bas64 =new BASE64Encoder();
                                               String dig = bas64.encode(myrs3.getString("name").getBytes());
                                             String dig1 = bas64.encode(myrs3.getString("email").getBytes());
                                            Cookie myck = new Cookie("drivername",dig);
                                            Cookie myck1 = new Cookie("drivermail",dig1);
                                                        myck.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck);
                                                        myck1.setMaxAge(60*60*24*7);
                                                        response.addCookie(myck1);
                                                                }
                                                     session.setAttribute("empid1", myrs3.getString("driver_id"));
                                           session.setAttribute("empid", myrs3.getString("name"));
                                            session.setAttribute("empemail", myrs3.getString("email"));
                                             mydi=request.getRequestDispatcher("emp_home.jsp");
                                                mydi.forward(request, response); 
                                                 }
                                          
                                                 
                                        }
                                }else
                                {

                    out.println("<script type='text/javascript'>alert('Check your email to authenticate yourself')</script>");
              RequestDispatcher rd=null;
              rd=request.getRequestDispatcher("welcome_ecab.jsp");
              rd.include(request, response);


                                }
                                    }
                                    else{
                                         out.print("<script> alert('Wrong username/Password')</script> ");
                                         RequestDispatcher rd=null;
                                         mydi=request.getRequestDispatcher("welcome_ecab.jsp");
                                                mydi.include(request, response);
                                       
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

}
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
