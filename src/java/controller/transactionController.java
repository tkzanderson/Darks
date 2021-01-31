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
        
        
        double  total;
        int productID;
        String size;
        int userID;
        String status;
        String startDate;
        String endDate;
        String paymentStatus;
        ArrayList<Payment> payment = new ArrayList<Payment>();
        ArrayList<Products> product = new ArrayList<Products>();
        String prodTitle, prodType, prodDescription;
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        String query="SELECT * FROM rent WHERE paymentStatus='Paid' AND userID = " +  userIDValue;
          Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userName, password); 
        Statement st = con.createStatement(); 
        ResultSet rs = st.executeQuery(query);
        if(view.equals("user")){
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
                }
                size = rs.getString(4);
                userID = rs.getInt(5);
                status = rs.getString(6);
                startDate = rs.getString(7);
                endDate = rs.getString(8);
                paymentStatus= rs.getString(9);
                payment.add(new Payment(total, productID, size, userID, status, startDate, endDate, paymentStatus));
                
                
               
                 
            }
            session.setAttribute("products", product);
             session.setAttribute("payment", payment);
         
            
            RequestDispatcher rd = request.getRequestDispatcher("/userTransactionHistory.jsp");
            rd.forward(request, response);
        }
        if(view.equals("admin")){
            
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
