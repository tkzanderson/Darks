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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        HttpSession session = request.getSession(true);
        String action = request.getParameter("action");
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
     
       if(action.equals("ADD")) {
            String prodTitle= request.getParameter("prodTitle");
            String prodDescription= request.getParameter("prodDescription");
            double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
            String prodType= request.getParameter("prodType");
            String prodImage = request.getParameter("prodImage");
            int active= 1;
            int  promotionStatus = 0;
            double promotionPrice = 0;
            String query = "INSERT INTO products(prodTitle, prodDescription, prodPrice, prodType, prodImage, active, promotionPrice, promotionStatus) VALUES(?,?,?,?,?,?,?,?)"; 

             try {
                Class.forName(driver);  
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password); 
            
            PreparedStatement st = con.prepareStatement(query); 
            st.setString(1, prodTitle);
            st.setString(2,prodDescription);
            st.setDouble(3, prodPrice);
            st.setString(4, prodType);
            st.setString(5, prodImage);
            st.setInt(6, active);
            st.setDouble(7, promotionPrice);
            st.setInt(8, promotionStatus);

            
            st.executeUpdate();

            st.close(); 
            con.close();

            RequestDispatcher rd= request.getRequestDispatcher("/adminIndex.jsp");
            rd.include(request, response);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Product has been inserted!');");
            out.println("</script>"); 
       }
       else if(action.equals("UPDATE")){
           
           int prodid = Integer.parseInt(request.getParameter("upindex"));
           String prodTitle, prodDescription, prodType;
           double prodPrice;
           int id, activate;
            String prodImage;
           String query = "SELECT * FROM products where id="+prodid;
           
           
           try {
                Class.forName(driver); 
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password); 
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery(query);
        
            
            Products products = new Products();
            while(rs.next()){
            products.setId(rs.getInt(1));
            products.setProdTitle(rs.getString(2));
            products.setProdDescription(rs.getString(3));
            products.setProdPrice(rs.getDouble(4));
            products.setProdType(rs.getString(5));
            products.setProdImage(rs.getString(6));
            products.setActivate(rs.getInt(7));}
            
            st.close(); 
            con.close();
            
            session.setAttribute("products", products);
            RequestDispatcher rd= request.getRequestDispatcher("/updateProducts.jsp");
            rd.include(request, response);
           
       }
       
       else if(action.equals("EDIT")){
            String prodTitle= request.getParameter("prodTitle");
            String prodDescription= request.getParameter("prodDescription");
            double prodPrice = Double.parseDouble(request.getParameter("prodPrice"));
            String prodType= request.getParameter("prodType");
            String prodImage = request.getParameter("prodImage");
            int editindex= Integer.parseInt(request.getParameter("editindex"));
            
            String query = "UPDATE products set prodTitle=?, prodDescription=?, prodPrice=?, prodType=?, prodImage=? where id="+editindex; 

             try {
                Class.forName(driver);  
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password); 
            PreparedStatement st = con.prepareStatement(query); 
            st.setString(1, prodTitle);
            st.setString(2,prodDescription);
            st.setDouble(3, prodPrice);
            st.setString(4, prodType);
            st.setString(5, prodImage);

            
            st.executeUpdate();

            st.close(); 
            con.close();

            RequestDispatcher rd= request.getRequestDispatcher("/adminIndex.jsp");
            rd.include(request, response);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Product has been updated!');");
            out.println("</script>"); 
       }
       
       else if(action.equals("DELETE")){
           int delindex= Integer.parseInt(request.getParameter("delindex"));
           
           String query = "DELETE FROM products WHERE id=?";
           try {
                Class.forName(driver);  
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
            }
            Connection con = DriverManager.getConnection(url, userNameDB, password); 
            PreparedStatement st = con.prepareStatement(query);
            
            st.setInt(1, delindex);
             st.executeUpdate(); 
        
            st.close(); 
            con.close();
            
            RequestDispatcher rd= request.getRequestDispatcher("/adminIndex.jsp");
            rd.include(request, response);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Product has been deleted!');");
            out.println("</script>"); 
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
