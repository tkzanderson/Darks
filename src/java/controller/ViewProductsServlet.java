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
public class ViewProductsServlet extends HttpServlet {

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
            throws ServletException, IOException,ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        //String action2 = (String)request.getAttribute("action2");
        ArrayList<Products> products = new ArrayList<Products>();
        
        String prodTitle, prodDescription, prodType;
        double prodPrice;
        int id, activate;
        String prodImage;
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query="SELECT * FROM products";
        String query2="SELECT * FROM products WHERE active=1 AND promotionStatus =0";
        
        
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
                     
                products.add(new Products(prodTitle, prodDescription, prodType, prodPrice, id,prodImage, activate)); }
                    
                session.setAttribute("products", products);
                    RequestDispatcher rd = request.getRequestDispatcher("/adminViewProducts.jsp");
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

                
                
                
        
//        if(action.equals("dress")){
//                query = "SELECT * FROM products WHERE prodType='dress'";
//
//                Statement st = con.createStatement(); 
//                ResultSet rs = st.executeQuery(query);
//                
//                while(rs.next()){
//                     id = rs.getInt(1);
//                     prodTitle = rs.getString(2);
//                     prodDescription = rs.getString(3);
//                     prodPrice = rs.getDouble(4);
//                     prodType = rs.getString(5);
//                     prodImage = rs.getString(6);
//                     
//                     products.add(new Products(prodTitle, prodDescription, prodType, prodPrice, id,prodImage));
//            
//                }
//                
//                session.setAttribute("products", products);
//
//                RequestDispatcher rd = request.getRequestDispatcher("/dress.jsp");
//                rd.forward(request, response);
//        }
//        else if(action.equals("suit")){
//            query = "SELECT * FROM products WHERE prodType='dress'";
//            Statement st = con.createStatement(); 
//            ResultSet rs = st.executeQuery(query);
//            session.setAttribute("rs",rs);
//                
//            RequestDispatcher rd = request.getRequestDispatcher("/suit.jsp");
//            rd.forward(request, response);
//        }
        
       
        
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
            Logger.getLogger(ViewProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewProductsServlet.class.getName()).log(Level.SEVERE, null, ex);
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
