/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Payment;
import bean.Products;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
 * @author user
 */
public class transactionController extends HttpServlet {

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
        String view = request.getParameter("view");
        String userIDValue = request.getParameter("userID");
          ArrayList<Payment> paymentDate = new ArrayList<Payment>();
         Timestamp  paidDate;
        double  total;
        int productID;
        String size;
        int userID;
        String status;
        String startDate;
        String endDate;
        String paymentStatus;
        int quantity;
        ArrayList<Payment> payment = new ArrayList<Payment>();
        ArrayList<Products> product = new ArrayList<Products>();
        String prodTitle, prodType, prodDescription;
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query2="SELECT * FROM payment WHERE userID = " +  userIDValue;
         String query4="SELECT * FROM payment";
          Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userName, password); 
       Statement st2 = con.createStatement(); 
        ResultSet rs2 = st2.executeQuery(query2);
             Statement st4 = con.createStatement(); 
        ResultSet rs4 = st4.executeQuery(query4);
 
      
        if(view.equals("user")){
             String query="SELECT * FROM rent WHERE paymentStatus='Paid' AND userID = " +  userIDValue;
              Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery(query);
            while(rs.next()){
                total = rs.getInt(2);
                productID = rs.getInt(3);
                if(productID!=0){
                      String queryProduct="SELECT * FROM products WHERE id="+productID;
                      Statement stProduct = con.createStatement(); 
                      ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                        while(rsProduct.next()){
                            prodTitle = rsProduct.getString(2);
                              prodDescription = rsProduct.getString(3);
                             prodType = rsProduct.getString(5);
                            
                              product.add(new Products(prodTitle, prodDescription, prodType));
                        }
                              while(rs2.next()){
                         paidDate=rs2.getTimestamp(5);
                          paymentDate.add(new Payment(paidDate));
                        }
                         
                }
                size = rs.getString(4);
                userID = rs.getInt(5);
                status = rs.getString(6);
                startDate = rs.getString(7);
                endDate = rs.getString(8);
                paymentStatus= rs.getString(9);
                quantity = rs.getInt(10);
                payment.add(new Payment(total, productID, size, userID, status, startDate, endDate, paymentStatus, quantity));
                
                
               
                 
            }
            session.setAttribute("products", product);
             session.setAttribute("payment", payment);
           session.setAttribute("paymentDate", paymentDate);
            
            RequestDispatcher rd = request.getRequestDispatcher("/userTransactionHistory.jsp");
            rd.forward(request, response);
        }
        if(view.equals("admin")){
            String query1="SELECT * FROM rent WHERE paymentStatus='Paid' ";
                 Statement st1 = con.createStatement(); 
        ResultSet rs1 = st1.executeQuery(query1);
        while(rs1.next()){
                total = rs1.getInt(2);
                productID = rs1.getInt(3);
                if(productID!=0){
                      String queryProduct="SELECT * FROM products WHERE id="+productID;
                      Statement stProduct = con.createStatement(); 
                      ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                        while(rsProduct.next()){
                            prodTitle = rsProduct.getString(2);
                              prodDescription = rsProduct.getString(3);
                             prodType = rsProduct.getString(5);
                            
                              product.add(new Products(prodTitle, prodDescription, prodType));
                        } 
                         while(rs4.next()){
                         paidDate=rs4.getTimestamp(5);
                          paymentDate.add(new Payment(paidDate));
                        }
                }
                size = rs1.getString(4);
                userID = rs1.getInt(5);
                status = rs1.getString(6);
                startDate = rs1.getString(7);
                endDate = rs1.getString(8);
                paymentStatus= rs1.getString(9);
                quantity = rs1.getInt(10);
                payment.add(new Payment(total, productID, size, userID, status, startDate, endDate, paymentStatus, quantity));
                
                
               
                 
            }
            session.setAttribute("products", product);
             session.setAttribute("payment", payment);
           session.setAttribute("paymentDate", paymentDate);
            
            RequestDispatcher rd = request.getRequestDispatcher("/transactionAdmin.jsp");
            rd.forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
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
            Logger.getLogger(transactionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(transactionController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(transactionController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(transactionController.class.getName()).log(Level.SEVERE, null, ex);
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