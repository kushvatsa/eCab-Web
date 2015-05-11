<%
   Cookie myck = new Cookie("username","0");
   myck.setMaxAge(0);
   response.addCookie(myck);
    Cookie myck1 = new Cookie("usermail","0");
   myck1.setMaxAge(0);
   response.addCookie(myck1);
session.setAttribute("userid", null);
session.removeAttribute("userid");
session.setAttribute("emai", null);
session.removeAttribute("emai");
session.setAttribute("empid", null);
session.removeAttribute("empid");
session.setAttribute("empid1", null);
session.removeAttribute("empid1");
session.setAttribute("adminid", null);
session.removeAttribute("adminid");
 session.invalidate();
response.sendRedirect("welcome_ecab.jsp");
%>