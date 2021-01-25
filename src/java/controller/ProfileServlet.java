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
        
        HttpSession session = request.getSession(true);
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
        String action = request.getParameter("action");
        
        if(action.equals("display")) {
        String newUser = request.getParameter("username");
        String role="";        
        
        String query="SELECT * FROM users WHERE userName=?";
        
        try {
            Class.forName(driver); //2-load and register the driver
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userNameDB, password); //3-establish connection
        
        //Statement st = con.createStatement(); //4-create statement //normal statement
        PreparedStatement st = con.prepareStatement(query); //prepare statement
        
        st.setString(1,newUser);
        ResultSet rs = st.executeQuery();
    
        User users = new User();
        while(rs.next()){
            users.setId(rs.getInt(1));
            users.setUserName(rs.getString(2));
            users.setEmail(rs.getString(4));
            users.setRole(rs.getString(5));
            users.setGender(rs.getString(6));
            users.setShippingAddress(rs.getString(7));
            users.setPhoneNumber(rs.getString(8));
            
            role = users.getRole();
        }
            st.close(); //step7 close connection
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
            int userid = Integer.parseInt(request.getParameter("userid"));
            
            String query = "UPDATE users SET userName=?, email=?, gender=?, shippingAddress=?, phoneNumber=? WHERE id=?";
                
            try {
                Class.forName(driver);  //step2 load and register driver
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
            st.setInt(6, userid);
            
           st.executeUpdate();

            st.close();
            con.close();
            
            RequestDispatcher rd= request.getRequestDispatcher("/userIndex.jsp");
            rd.include(request, response);
            
        }
                
        try (PrintWriter out = response.getWriter()) {
           
                
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
