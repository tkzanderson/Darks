/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Payment;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
public class DisplayPaymentServlet extends HttpServlet {

  

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
        //String action2 = (String)request.getAttribute("action2");
        ArrayList<Payment> payments = new ArrayList<Payment>();
        User users= new User();
        
        int id;
        String filename, path;
        Timestamp paidDate;
        int rentID = Integer.parseInt(request.getParameter("rentID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
        String query="SELECT * FROM payment WHERE rentID=?";
        String query2= "SELECT * FROM users WHERE id=?";
        
        
        Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userNameDB, password); 
        PreparedStatement st = con.prepareStatement(query);
        
        st.setInt(1, rentID);
        ResultSet rs = st.executeQuery();
                             
                
                    while(rs.next()){
                     id = rs.getInt(1);
                     filename = rs.getString(2);
                     path = rs.getString(3);
                     userID = rs.getInt(4);
                     paidDate = rs.getTimestamp(5);
                     rentID = rs.getInt(6);
                     
                payments.add(new Payment(id, userID, filename, path, paidDate, rentID)); }
        
        PreparedStatement st2 = con.prepareStatement(query2);
        
        st2.setInt(1, userID);
        ResultSet rs2 = st2.executeQuery();
        
        while(rs2.next()){
            users.setUserName(rs2.getString(2));
        }
                    
                session.setAttribute("payments", payments);
                session.setAttribute("users", users);
                    RequestDispatcher rd = request.getRequestDispatcher("/adminPayment.jsp");
                    rd.include(request, response);
                
        
        
        
        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet DisplayPaymentServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DisplayPaymentServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
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
            Logger.getLogger(DisplayPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DisplayPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DisplayPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DisplayPaymentServlet.class.getName()).log(Level.SEVERE, null, ex);
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
