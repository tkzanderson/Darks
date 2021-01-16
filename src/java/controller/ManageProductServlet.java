/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Products;
import bean.User;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author janic
 */
public class ManageProductServlet extends HttpServlet {
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
        
        HttpSession session = request.getSession();
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
     
       
        String prodTitle= request.getParameter("prodTitle");
        String prodDescription= request.getParameter("prodDescription");
        double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
        String prodType= request.getParameter("prodType");
        String prodImage = request.getParameter("prodImage");
        int active= Integer.parseInt(request.getParameter("active"));
        String query = "INSERT INTO products(prodTitle, prodDescription, prodPrice, prodType, prodImage, active) VALUES(?,?,?,?,?,?)"; //prepared statement
        
         try {
            Class.forName(driver);  //step2 load and register driver
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userNameDB, password); //step3 establish connection
        //Statement st = con.createStatement();   //step4 create statement normal statement
        PreparedStatement st = con.prepareStatement(query); //preparedstatement
        st.setString(1, prodTitle);
        st.setString(2,prodDescription);
        st.setDouble(3, prodPrice);
        st.setString(4, prodType);
        st.setString(5, prodImage);
        st.setInt(6, active);
        
        //st.executeUpdate(query);    //step5 execute the query
        st.executeUpdate();
        
        st.close(); //step7 close connection
        con.close();
        
        RequestDispatcher rd= request.getRequestDispatcher("/adminIndex.jsp");
        rd.include(request, response);
        
        response.setContentType("text/html;charset=UTF-8");
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
            Logger.getLogger(ManageProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ManageProductServlet.class.getName()).log(Level.SEVERE, null, ex);
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
