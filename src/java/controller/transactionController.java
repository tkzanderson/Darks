/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Payment;
import bean.Products;
import bean.User;
import bean.rent;
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
        
        ArrayList<User> users = new ArrayList<User>();
        ArrayList<Payment> payment = new ArrayList<Payment>();
        ArrayList<Products> product = new ArrayList<Products>();
        ArrayList<rent> renting = new ArrayList<rent>();
        
        ArrayList<Payment> payment1 = new ArrayList<Payment>();
        ArrayList<Products> product1 = new ArrayList<Products>();
        ArrayList<rent> renting1 = new ArrayList<rent>();
        
        ArrayList<Payment> payment2 = new ArrayList<Payment>();
        ArrayList<Products> product2 = new ArrayList<Products>();
        ArrayList<rent> renting2 = new ArrayList<rent>();
        //payment modal
        Timestamp  paidDate;
        int userIDPayment;
        int tempRentID;
        int rentIDPayment;
        
        //rent modal
        int quantity;
        int userID;
        int rentID;
        double totalprice;
        String size;
        String status;
        String startDate;
        String endDate;
        int productID;
        int tempProductID;        
        //product modal
        String prodTitle;
        String prodType;
        String prodDescription;
        
        //user modal
        String userNameModal;
        int tempUserID;
        
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        
        Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userName, password); 
      
      
          
 
      
        if(view.equals("user")){
            String query="SELECT * FROM rent WHERE (status='PAID' OR status='COMPLETED') AND userID = " +  userIDValue;    //Get the user transaction renting that had been paid
            Statement st = con.createStatement(); 
            ResultSet rs = st.executeQuery(query);
            while(rs.next()){
                rentID = rs.getInt(1);
                totalprice = rs.getDouble(2);
                productID = rs.getInt(3);
                if(productID!=0){
                    String queryProduct="SELECT * FROM products WHERE id="+productID;
                    Statement stProduct = con.createStatement(); 
                    ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                    String query2="SELECT * FROM payment WHERE rentID = " +  rentID; //customer view
                    Statement st2 = con.createStatement(); 
                    ResultSet rs2 = st2.executeQuery(query2);
                        while(rsProduct.next()){
                            tempProductID=rsProduct.getInt(1);
                            prodTitle = rsProduct.getString(2);
                            prodDescription = rsProduct.getString(3);
                            prodType = rsProduct.getString(5);
                            if(productID==tempProductID){
                                product.add(new Products(prodTitle, prodDescription, prodType));
                            }
                        } 
                        
                        while(rs2.next()){
                            paidDate=rs2.getTimestamp(5);
                            rentIDPayment=rs2.getInt(6);
                        
                            if(rentID==rentIDPayment){
                                payment.add(new Payment(paidDate));
                            }
                        }
                }
                size = rs.getString(4);
                userID = rs.getInt(5);
                status = rs.getString(6);
                startDate = rs.getString(7);
                endDate = rs.getString(8);
               
                quantity = rs.getInt(9);
                renting.add(new rent(quantity, userID, rentID, totalprice, size,  status, startDate, endDate));
            }
            session.setAttribute("products", product);
            session.setAttribute("payment", payment);
            session.setAttribute("renting", renting);
            try (PrintWriter out = response.getWriter()) {
                RequestDispatcher rd = request.getRequestDispatcher("/userTransactionHistory.jsp");
                out.println(userIDValue);
                rd.include(request, response);
            }
        }
        
   
        
        if(view.equals("admin")){
            String query1="SELECT * FROM rent WHERE status='PAID'"; //Get the product that havent been return
            Statement st1 = con.createStatement(); 
            ResultSet rs1 = st1.executeQuery(query1);
            while(rs1.next()){
                rentID = rs1.getInt(1);
                totalprice = rs1.getDouble(2);
                productID = rs1.getInt(3);
                size = rs1.getString(4);
                userID = rs1.getInt(5);
                if(productID!=0){
                    String queryProduct="SELECT * FROM products WHERE id="+productID;
                    Statement stProduct = con.createStatement(); 
                    ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                    String query4="SELECT * FROM payment WHERE rentID = " +  rentID;
                    Statement st4 = con.createStatement(); 
                    ResultSet rs4 = st4.executeQuery(query4);
                    String query10="SELECT * FROM users WHERE id = " +  userID;
                    Statement st10 = con.createStatement(); 
                    ResultSet rs10 = st10.executeQuery(query10);
                    while(rsProduct.next()){
                        tempProductID=rsProduct.getInt(1);
                        prodTitle = rsProduct.getString(2);
                        prodDescription = rsProduct.getString(3);
                        prodType = rsProduct.getString(5);
                        if(productID==tempProductID){
                           product.add(new Products(prodTitle, prodDescription, prodType));
                        }
                    } 
                    
                    while(rs4.next()){
                        paidDate=rs4.getTimestamp(5);
                        rentIDPayment=rs4.getInt(6);
                        
                        if(rentID==rentIDPayment){
                            payment.add(new Payment(paidDate));
                        }
                    }
                        
                    while(rs10.next()){
                        tempUserID=rs10.getInt(1);
                        userNameModal=rs10.getString(2);
                      
                        if(userID==tempUserID){
                            users.add(new User(userNameModal));
                        }
                    }
                }
                
                status = rs1.getString(6);
                startDate = rs1.getString(7);
                endDate = rs1.getString(8);
                quantity = rs1.getInt(9);
                renting.add(new rent(quantity, userID, rentID, totalprice, size,  status, startDate, endDate));
            }
          
            String query5="SELECT * FROM rent WHERE status='COMPLETED'"; //Get the product that had been returned
            Statement st5 = con.createStatement(); 
            ResultSet rs5 = st5.executeQuery(query5);
            while(rs5.next()){
                rentID = rs5.getInt(1);
                totalprice = rs5.getDouble(2);
                productID = rs5.getInt(3);
                if(productID!=0){
                    String queryProduct="SELECT * FROM products WHERE id="+productID;
                    Statement stProduct = con.createStatement(); 
                    ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                    String query7="SELECT * FROM payment WHERE rentID = "+ rentID; //admin view
                    Statement st7 = con.createStatement(); 
                    ResultSet rs7 = st7.executeQuery(query7);
                    while(rsProduct.next()){
                        tempProductID =rsProduct.getInt(1);
                        prodTitle = rsProduct.getString(2);
                        prodDescription = rsProduct.getString(3);
                        prodType = rsProduct.getString(5);
                        if(productID==tempProductID){
                            product1.add(new Products(prodTitle, prodDescription, prodType));
                        }
                    } 
                    
                    while(rs7.next()){
                        paidDate=rs7.getTimestamp(5);
                        rentIDPayment=rs7.getInt(6);
                        if(rentID==rentIDPayment){
                              payment1.add(new Payment(paidDate));
                        }
                    }
                }
                size = rs5.getString(4);
                userID = rs5.getInt(5);
                status = rs5.getString(6);
                startDate = rs5.getString(7);
                endDate = rs5.getString(8);
                quantity = rs5.getInt(9);
                renting1.add(new rent(quantity, userID, rentID, totalprice, size,  status, startDate, endDate));
            }  
            
            String query6="SELECT * FROM rent WHERE status='PAID' OR status='COMPLETED'";   //Get all the product that had been paid
            Statement st6 = con.createStatement(); 
            ResultSet rs6 = st6.executeQuery(query6);
         
            while(rs6.next()){
                rentID = rs6.getInt(1);
                totalprice = rs6.getDouble(2);
                productID = rs6.getInt(3);
                if(productID!=0){
                    String queryProduct="SELECT * FROM products WHERE id="+productID;
                    Statement stProduct = con.createStatement(); 
                    ResultSet rsProduct = stProduct.executeQuery(queryProduct);
                    String query8="SELECT * FROM payment WHERE rentID = "+ rentID;  //admin view
                    Statement st8 = con.createStatement(); 
                    ResultSet rs8 = st8.executeQuery(query8);
                    while(rsProduct.next()){
                        tempProductID =rsProduct.getInt(1);
                        prodTitle = rsProduct.getString(2);
                        prodDescription = rsProduct.getString(3);
                        prodType = rsProduct.getString(5);
                        if(productID==tempProductID){
                            product2.add(new Products(prodTitle, prodDescription, prodType));
                        }
                    } 
                    
                    while(rs8.next()){
                        paidDate=rs8.getTimestamp(5);
                        rentIDPayment=rs8.getInt(6);
                        if(rentID==rentIDPayment){
                            payment2.add(new Payment(paidDate));
                        }
                    }
                }
                size = rs6.getString(4);
                userID = rs6.getInt(5);
                status = rs6.getString(6);
                startDate = rs6.getString(7);
                endDate = rs6.getString(8);
                quantity = rs6.getInt(9);
                renting2.add(new rent(quantity, userID, rentID, totalprice, size,  status, startDate, endDate));
            } 
            
            session.setAttribute("users", users);
            session.setAttribute("products", product);
            session.setAttribute("payment", payment);
            session.setAttribute("renting", renting);
            session.setAttribute("products1", product1);
            session.setAttribute("payment1", payment1);
            session.setAttribute("renting1", renting1);
            session.setAttribute("products2", product2);
            session.setAttribute("payment2", payment2);
            session.setAttribute("renting2", renting2);
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