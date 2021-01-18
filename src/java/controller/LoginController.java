/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "darks";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userNameDB = "root";
            String password = "";
            String query = "select * from users where userName=? and userPassword=?";
            
            String userName = request.getParameter("userName");  
            String userPassword = request.getParameter("userPassword");
            String email = null, role = null;
            
            HttpSession session = request.getSession();
            
            try {
            Class.forName(driver); 
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            try (Connection con = DriverManager.getConnection(url, userNameDB, password); PreparedStatement ps = con.prepareStatement(query)) {
                ps.setString(1,userName);
                ps.setString(2,userPassword); 
                
                ResultSet rs=ps.executeQuery();
                
                if(rs.next()){
                    
                    User user = new User();
                    user.setUserName(userName);
                    user.setUserPassword(userPassword);
                    user.setEmail(rs.getString(4));
                    
                    session.setAttribute("User",user);
                    if("admin".equals(rs.getString(5))){
                        RequestDispatcher rd= request.getRequestDispatcher("/adminIndex.jsp");
                        rd.include(request, response);
                        out.println("ADMIN VIEW");
                    }else{
                        RequestDispatcher rd= request.getRequestDispatcher("/userIndex.jsp");
                        rd.include(request, response);
                        out.println("CUSTOMER VIEW");
                    }
                }
                else{
                    out.print("Wrong username or password !");
                    RequestDispatcher rd=request.getRequestDispatcher("/login-register.jsp");
                    rd.include(request,response);
                }
                // 7. close the connection
                
            }

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
