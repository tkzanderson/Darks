/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author user
 */
public class ViewPromotionsServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8"); HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        //String action2 = (String)request.getAttribute("action2");
        ArrayList<Products> products = new ArrayList<Products>();
        
        String prodTitle, prodDescription, prodType;
        double prodPrice, promotionPrice;
        int id, activate, promotionStatus;
        String prodImage;
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query="SELECT * FROM products";
        String query2="SELECT * FROM products WHERE active=1";
        
        
        Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userName, password); 
        Statement st = con.createStatement(); 
        Statement st2 = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        ResultSet rs2 = st2.executeQuery(query2);
                             
                if(action.equals("adminview")/*||action2.equals("adminview")*/){
                    while(rs.next()){
                     id = rs.getInt(1);
                     prodTitle = rs.getString(2);
                     prodDescription = rs.getString(3);
                     prodPrice = rs.getDouble(4);
                     prodType = rs.getString(5);
                     prodImage = rs.getString(6);
                     activate = rs.getInt(7);
                     promotionPrice = rs.getDouble(8);
                     promotionStatus = rs.getInt(9);
                products.add(new Products(prodTitle, prodDescription, prodType, prodPrice, id,prodImage, activate, promotionPrice, promotionStatus)); }
                    
                session.setAttribute("products", products);
                    RequestDispatcher rd = request.getRequestDispatcher("/adminViewPromotions.jsp");
                    rd.forward(request, response);
                }
                
                else if(action.equals("userview")){
                    while(rs2.next()){
                     id = rs2.getInt(1);
                     prodTitle = rs2.getString(2);
                     prodDescription = rs2.getString(3);
                     prodPrice = rs2.getDouble(4);
                     prodType = rs2.getString(5);
                     prodImage = rs2.getString(6);
                     
                products.add(new Products(prodTitle, prodDescription, prodType, prodPrice, id, prodImage)); }
                session.setAttribute("products", products);
                    RequestDispatcher rd = request.getRequestDispatcher("/products.jsp");
                    rd.forward(request, response);
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
            Logger.getLogger(ViewPromotionsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewPromotionsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewPromotionsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewPromotionsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
