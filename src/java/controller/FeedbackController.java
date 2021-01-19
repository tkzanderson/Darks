/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
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

/**
 *
 * @author User
 */
public class FeedbackController extends HttpServlet {

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
        PrintWriter out=response.getWriter();  
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userNameDB = "root";
        String password = "";
        String query;
            
        Class.forName(driver); //2. load and register the driver
        Connection con = DriverManager.getConnection(url, userNameDB, password); //3. establish the connection
            
        String action = request.getParameter("action");

            if (action.equals("INSERT"))
            {
                query = "INSERT INTO feedback(name, feedback) VALUES(?, ?)";
                PreparedStatement st = con.prepareStatement(query);  //4. create the statement
        
                String name = request.getParameter("name");
                String feedback = request.getParameter("feedback");

                st.setString(1, name);
                st.setString(2, feedback);

                int insertStatus = 0;

                //st.executeUpdate(query); //5. execute the query(normal statement

                st.executeUpdate(); //prepared statement
                System.out.println(insertStatus + "row affected"); //6. process the result

                st.close(); // 7. close the connection
                con.close();
        
                out.println("Successfully inserted feedback !");
                RequestDispatcher rd = request.getRequestDispatcher("feedbackcust.jsp");
                rd.include(request, response);
            }
            else if (action.equals("UPDATE"))
            {
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String feedback = request.getParameter("feedback");
                
                RequestDispatcher rd = request.getRequestDispatcher("updateFeedback.jsp");
                rd.forward(request, response);
           }
            else if (action.equals("DELETE"))
            {
                int id = Integer.parseInt(request.getParameter("id"));
                query = "DELETE FROM feedback WHERE id=?";
                PreparedStatement st = con.prepareStatement(query);  //4. create the statement
                 
                st.setInt(1,id);  
                
                st.executeUpdate();  
                
                st.close(); // 7. close the connection
                con.close();
                
                out.println("Successfully deleted feedback !");
                RequestDispatcher rd = request.getRequestDispatcher("feedbackadmin.jsp");
                rd.include(request, response);
           }
            else if (action.equals("SAVE"))
            {   
                int id = Integer.parseInt(request.getParameter("id"));
                String name = request.getParameter("name");
                String feedback = request.getParameter("feedback");
                
                query = "UPDATE feedback set name=?, feedback=? WHERE id=?";
                PreparedStatement st = con.prepareStatement(query);  //4. create the statement
                
                st.setString(1,name);  
                st.setString(2,feedback);  
                st.setInt(3,id);  
                
                int updateStatus = 0;
                st.executeUpdate();  
                System.out.println(updateStatus + "row affected"); //6. process the result

                st.close(); // 7. close the connection
                con.close();
                
                out.println("Successfully updated feedback !");
                RequestDispatcher rd = request.getRequestDispatcher("feedbackadmin.jsp");
                rd.include(request, response);
                
                //RequestDispatcher rd = request.getRequestDispatcher("feedbackadmin.jsp");
                //rd.forward(request, response);
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
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
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