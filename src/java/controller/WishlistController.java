/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

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
import java.util.StringTokenizer;
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
 * @author User
 */
public class WishlistController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet WishlistController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet WishlistController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession(true);

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        ArrayList products= (ArrayList) session.getAttribute("wishlist");

        String action = request.getParameter("action");
        if (action.equals("VIEW"))
        {
            request.setAttribute("output", "VIEW");
            session.setAttribute("wishlist", products);
              
            RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
            rd.forward(request, response);
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
        PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            HttpSession session = request.getSession(true);
            ArrayList products= (ArrayList) session.getAttribute("wishlist");
            String output = request.getParameter("output");
            
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "darks";
            String url = "jdbc:mysql://localhost/" + dbName + "?";
            String userNameDB = "root";
            String password = "";
            String prodTitle, prodImage;
            double prodPrice;
            int id;
            
            if (output.equals("ADD"))
            {
                id = Integer.parseInt(request.getParameter("id"));
                
                String query = "SELECT * FROM products where id="+id;
                
                if(products != null && (products.size() > 0)){
                        try {
                        Class.forName(driver); //2. load and register the driver
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        Connection con = null;
                    try {
                        con = DriverManager.getConnection(url, userNameDB, password); //3. establish the connection
                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                        Statement st = null;
                    try {
                        st = con.createStatement(); //4. create the statement
                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    try {
                        ResultSet rs = st.executeQuery(query); //5.execute the query
                        
                        
                        while(rs.next()){
                            id = rs.getInt(1);
                            prodTitle = rs.getString(2);
                            prodPrice = rs.getDouble(4);
                            prodImage = rs.getString(6);

                            products.add(new Products(id, prodTitle, prodPrice, prodImage));
                            session.setAttribute("wishlist", products);
                            out.println(prodTitle + " has been added to your wishlist!");
                        }

                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    
                    RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                    rd.include(request, response);
                }else{
                    ArrayList<Products> wishlist = new ArrayList<Products>();
    
                    try {
                        Class.forName(driver); //2. load and register the driver
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        Connection con = null;
                    try {
                        con = DriverManager.getConnection(url, userNameDB, password); //3. establish the connection
                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }

                        Statement st = null;
                    try {
                        st = con.createStatement(); //4. create the statement
                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    try {
                        ResultSet rs = st.executeQuery(query); //5.execute the query
                        while(rs.next()){
                            id = rs.getInt(1);
                            prodTitle = rs.getString(2);
                            prodPrice = rs.getDouble(4);
                            prodImage = rs.getString(6);

                            wishlist.add(new Products(id, prodTitle, prodPrice, prodImage));
                            session.setAttribute("wishlist", wishlist);
                            out.println(prodTitle + " has been added to your wishlist!");
                        }

                    } catch (SQLException ex) {
                        Logger.getLogger(WishlistController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                        
                        RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                        rd.include(request, response);
                }
                
            }else if (output.equals("Remove"))
            {
                //id = Integer.parseInt(request.getParameter("id"));
                prodTitle = request.getParameter("title");
                int index = Integer.parseInt(request.getParameter("index"));
                
                products.remove(index);
                /*
                if(index <= 0 || "0".equals(zero)){
                    products.remove(0);
                }
                else{
                    products.remove(index);
                }*/
                
                session.setAttribute("wishlist", products);
                out.println(prodTitle + " has been removed from your wishlist!");
                RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                rd.include(request, response);
               
            }else if (output.equals("RESET"))
            {
                session.removeAttribute("wishlist");
                
                out.println("ALL products have been removed from your wishlist!");
                RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                rd.include(request, response);
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
}
