/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.*;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class RegisterController extends HttpServlet {

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
     
       
        
        String userName= request.getParameter("userName");
        String userPassword= request.getParameter("userPassword");
         String confirmUserPassword= request.getParameter("confirmUserPassword");
        String email= request.getParameter("email");
        String gender= request.getParameter("gender");
        String shippingAddress= request.getParameter("shippingAddress");
        String phoneNumber= request.getParameter("phoneNumber");
        
        if(userPassword.length()<6){
            try (PrintWriter out = response.getWriter()) {
                RequestDispatcher rd= request.getRequestDispatcher("/login-register.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Password must at least consist of 6 characters');");
                out.println("</script>");
            }
        }
        
        else if(!(userPassword.equals(confirmUserPassword))){
            try (PrintWriter out = response.getWriter()) {
                RequestDispatcher rd= request.getRequestDispatcher("/login-register.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Confirmation password is not match with input password, please try again');");
                out.println("</script>");
            }   
        }
        else{
              User user = new User();
        user.setUserName(userName);
        user.setUserPassword(userPassword);
        user.setEmail(email);
        
        String query = "INSERT INTO users(userName, userPassword, email, role, gender, shippingAddress, phoneNumber) VALUES(?,?,?,?,?,?,?)"; //prepared statement
        
         try {
            Class.forName(driver);  //step2 load and register driver
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        Connection con = DriverManager.getConnection(url, userNameDB, password); //step3 establish connection
        //Statement st = con.createStatement();   //step4 create statement normal statement
        PreparedStatement st = con.prepareStatement(query); //preparedstatement
        st.setString(1, userName);
        st.setString(2, userPassword);
        st.setString(3, email);
        st.setString(4, "customer");
        st.setString(5, gender);
        st.setString(6, shippingAddress);
        st.setString(7, phoneNumber);

        
        //st.executeUpdate(query);    //step5 execute the query
        st.executeUpdate();
        
        
        st.close(); //step7 close connection
        con.close();
        
        session.setAttribute("User",user);
      
        try (PrintWriter out = response.getWriter()) {
                  RequestDispatcher rd= request.getRequestDispatcher("/userIndex.jsp");
        rd.include(request, response);
         out.println("<script type=\"text/javascript\">");
                     out.println("alert('You has sucessfully register, welcome to Darks Dress and Suit Renting');");
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
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
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
