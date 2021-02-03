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
 * @author janic
 */
public class PaymentServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(true);
       
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
        
        int userID = Integer.parseInt(request.getParameter("userID"));
        int rentID = Integer.parseInt(request.getParameter("rentID"));
         
        double total = 0;
        String status = "APPROVED";
        
        String query="SELECT * FROM rent WHERE id=?";
        String query2 ="SELECT * FROM users WHERE id=?";
        try {
            Class.forName(driver); 
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userNameDB, password); 
        
        
        PreparedStatement st = con.prepareStatement(query); 
        
        st.setInt(1,rentID);
        ResultSet rs = st.executeQuery();
    
        
        while(rs.next()){
            total += rs.getDouble(2); 
            
        }
        
        PreparedStatement st2 = con.prepareStatement(query2); 
        
        st2.setInt(1,userID);
        ResultSet rs2 = st2.executeQuery();
    
        
        User users = new User();
        while(rs2.next()){
            users.setId(rs2.getInt(1));
            users.setUserName(rs2.getString(2));
            users.setEmail(rs2.getString(4));
            users.setShippingAddress(rs2.getString(7));
            users.setPhoneNumber(rs2.getString(8));
        }
        
            st.close(); 
            con.close();
            
            
        
        session.setAttribute("total", total);
        session.setAttribute("users", users);
        session.setAttribute("rentID", rentID);
        RequestDispatcher rd = request.getRequestDispatcher("/paymentform.jsp");
        rd.include(request, response);
            
        
        
        
        
        
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
        } catch (SQLException ex) {
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(PaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
