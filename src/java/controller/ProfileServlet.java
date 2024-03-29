/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Products;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
 * @author janic
 */
public class ProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession(true);
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
        String action = request.getParameter("action");
        
        if(action.equals("display")) {
        int newUser = Integer.parseInt(request.getParameter("id"));
        String role="";        
        
        String query="SELECT * FROM users WHERE id=?";
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userNameDB, password); 
        
        PreparedStatement st = con.prepareStatement(query); 
        
        st.setInt(1,newUser);
        ResultSet rs = st.executeQuery();
    
        User users = new User();
        while(rs.next()){
            users.setId(rs.getInt(1));
            users.setUserName(rs.getString(2));
            users.setUserPassword(rs.getString(3));
            users.setEmail(rs.getString(4));
            users.setRole(rs.getString(5));
            users.setGender(rs.getString(6));
            users.setShippingAddress(rs.getString(7));
            users.setPhoneNumber(rs.getString(8));
            
            role = users.getRole();
        }
            st.close(); 
            con.close();
            
            
                             
         if("admin".equals(role)){       
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/adminprofile.jsp");
                rd.include(request, response);
         }
         else {
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                rd.include(request, response);
            }
        }
        
        else if(action.equals("update")){
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String shippingAddress = request.getParameter("shippingAddress");
            String phoneNumber = request.getParameter("phoneNumber");
            String userPassword = request.getParameter("userPassword");
            int userid = Integer.parseInt(request.getParameter("userid"));
            String role = request.getParameter("role");
            
            String query = "UPDATE users SET userName=?, email=?, gender=?, shippingAddress=?, phoneNumber=?, userPassword=? WHERE id=?";
                
            try {
                Class.forName(driver);  
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1, userName);
            st.setString(2, email);
            st.setString(3, gender);
            st.setString(4, shippingAddress);
            st.setString(5, phoneNumber);
            st.setInt(7, userid);
            st.setString(6, userPassword);
            
           st.executeUpdate();
           
           User users = new User();
           users.setId(userid);
            users.setUserName(userName);
            users.setUserPassword(userPassword);
            users.setEmail(email);
            users.setRole(role);
            users.setGender(gender);
            users.setShippingAddress(shippingAddress);
            users.setPhoneNumber(phoneNumber);
            
            st.close();
            con.close();
            
            
            if(role.equals("admin")){  
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/adminprofile.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your profile has been updated!');");
                out.println("</script>"); 
         }
         else {
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your profile has been updated!');");
                out.println("</script>");
            }
            
        }
        else if(action.equals("changePassword")){
            
            String newpass = request.getParameter("newpassword");
            String oldpass = request.getParameter("userPassword");
            String role = request.getParameter("role");
            String userName = request.getParameter("userName");
            String email = request.getParameter("email");
            String gender = request.getParameter("gender");
            String shippingAddress = request.getParameter("shippingAddress");
            String phoneNumber = request.getParameter("phoneNumber");
            int userid = Integer.parseInt(request.getParameter("userid"));
           
            String query = "UPDATE users SET userPassword=? WHERE userPassword=?";
                
            try {
                Class.forName(driver);  
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1, newpass);
            st.setString(2, oldpass);
            
            st.executeUpdate();
            
            User users = new User();
            users.setId(userid);
            users.setUserName(userName);
            users.setUserPassword(newpass);
            users.setEmail(email);
            users.setRole(role);
            users.setGender(gender);
            users.setShippingAddress(shippingAddress);
            users.setPhoneNumber(phoneNumber);
            
            
            if(role.equals("admin")){  
                
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/adminprofile.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your password has been updated!');");
                out.println("</script>"); 
         }
         else {
                session.setAttribute("users", users);
                RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your password has been updated!');");
                out.println("</script>");
            }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
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
