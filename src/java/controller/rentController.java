/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Products;
import bean.User;
import bean.rent;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
 * @author Anderson
 */
public class rentController extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession(true);
        int id = parseInt(request.getParameter("action"));
        int prodid;
        int userid;
        String startdate, enddate;
        String option=request.getParameter("option");
        ArrayList<rent> rentAL = new ArrayList<rent>();
        
        String prodTitle, prodDescription, prodType;
        
        String status = "PENDING";
        double prodPrice;
        int activate, prodStatus;
        String prodImage;
        double total=0, prodPromotionPrice;
        String driver = "com.mysql.jdbc.Driver";
        String dbName = "darks";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
        
        String query="SELECT * FROM products WHERE id="+id+"";
        String query2 = "INSERT INTO rent(total, productID, size, userID, status, startDate, endDate, quantity) VALUES(?,?,?,?,?,?,?,?)";
        String query3="SELECT * FROM users WHERE userName=?";
        String query4="SELECT * FROM rent WHERE userID=?";
        String query5="SELECT * FROM products WHERE id=?";
        String query6="SELECT * FROM rent";
        String query7="UPDATE rent SET status=? WHERE id=?";
        String query8="DELETE FROM rent WHERE id=?";
        
        Class.forName(driver); 
        Connection con = DriverManager.getConnection(url, userName, password); 
        Connection con2 = DriverManager.getConnection(url, userName, password); 
        Connection con3 = DriverManager.getConnection(url, userName, password);
        Connection con4 = DriverManager.getConnection(url, userName, password);
        
        Statement st = con.createStatement(); 
        Statement st2 = con.createStatement();
        ResultSet rs = st.executeQuery(query);
        ResultSet rs5 = st2.executeQuery(query6);
        
        PreparedStatement pst = con2.prepareStatement(query2); //preparedstatement
        PreparedStatement pst2 = con3.prepareStatement(query3);
        PreparedStatement pst3 = con4.prepareStatement(query4);
        PreparedStatement pst4 = con4.prepareStatement(query5);
        PreparedStatement pst5 = con4.prepareStatement(query7);
        PreparedStatement pst6 = con4.prepareStatement(query8);
        
        
        
        
        if(option.equals("Rent"))
        {
            while(rs.next()){
                prodTitle = rs.getString(2);
                prodDescription = rs.getString(3);
                prodPrice = rs.getDouble(4);
                prodType = rs.getString(5);
                prodImage = rs.getString(6);
                activate = rs.getInt(7);
                prodPromotionPrice = rs.getDouble(8);
                prodStatus = rs.getInt(9);
                Products products = new Products(prodTitle, prodDescription, prodType, prodPrice, id, prodImage, activate, prodPromotionPrice, prodStatus);
                session.setAttribute("products", products);
//                 try (PrintWriter out = response.getWriter()){
////                     out.println(prodStatus);
//                 }
        }
        
       
RequestDispatcher rd = request.getRequestDispatcher("/rentpage.jsp");
rd.forward(request, response);
                
            
        }
        
        else if(option.equals("Confirm Rent"))
        {
            String newUser=request.getParameter("newUser");
            double price = Double.parseDouble(request.getParameter("price"));
            //int userID = parseInt(request.getParameter("userID"));
            int quantity = parseInt(request.getParameter("quantity"));
            String size = request.getParameter("size");
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            
            Products products = new Products();
            
//            while(rs.next()){
//                products.setProdPrice(rs.getDouble(4));
//                
//        }
products.setProdPrice(price);
            
            total= products.getProdPrice()*quantity;
            
            
            while(rs2.next()){
             users.setId(rs2.getInt(1));
             users.setUserName(rs2.getString(2));
            }  
            con3.close();
            userid = users.getId();

            startdate = request.getParameter("from");
            enddate = request.getParameter("to"); 
            pst.setDouble(1, total);
            pst.setInt(2, id);
            pst.setString(3, size);
            pst.setInt(4, userid);
            pst.setString(5, status);
            pst.setString(6, startdate);
            pst.setString(7, enddate);
            pst.setInt(8, quantity);
            pst.executeUpdate();  
            
            pst.close(); //step7 close connection
            con2.close();
              
            
            try (PrintWriter out = response.getWriter()) {
                session.setAttribute("User", users);
                
                RequestDispatcher rd = request.getRequestDispatcher("/userIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Product Rented!');");
                out.println("</script>"); 
                }
        }
        
        else if(option.equals("ViewRent")&& id==0)
        {
            String newUser=request.getParameter("newUser");
            int quantity;
            String size;
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            
            Products products = new Products();
            


            while(rs2.next()){
             users.setId(rs2.getInt(1));
             users.setUserName(rs2.getString(2));
            }  
            con3.close();
            userid = users.getId();
            pst3.setInt(1,userid);
            ResultSet rs3 = pst3.executeQuery();
            ResultSet rs4;
             
             while(rs3.next()){
                 rent rent = new rent();
                 total = rs3.getDouble(2);
                 size = rs3.getString(4);
                 prodid=rs3.getInt(3);
                 status=rs3.getString(6);
                 
                 startdate = rs3.getString(7);
                 enddate = rs3.getString(8);
                 quantity = rs3.getInt(9);
                 
                 pst4.setInt(1,prodid);
                 
                 rs4 = pst4.executeQuery();
                
                while(rs4.next()){
                    
                    products.setProdTitle(rs4.getString(2));
                    products.setProdImage(rs4.getString(6));
                    
                }
                
                rent.setId(rs3.getInt(1));
                rent.setPrice(total);
                rent.setProdTitle(products.getProdTitle());
                rent.setProdImage(products.getProdImage());
                rent.setSize(size);
                rent.setStartdate(startdate);
                rent.setEnddate(enddate);
                
                rent.setStatus(status);
                rent.setQuantity(quantity);
                rentAL.add(rent);
                
             }
                           
             con4.close();
             session.setAttribute("rent", rentAL);
             session.setAttribute("User", users);
             RequestDispatcher rd = request.getRequestDispatcher("/ManageRent.jsp");
             rd.forward(request, response);
        }
        
        else if(option.equals("ViewRent")&& id==1)
        {
            String newUser=request.getParameter("newUser");
            int quantity;
            String size;
            ResultSet rs4;
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
            users.setId(rs2.getInt(1));
            users.setUserName(rs2.getString(2));
            } 
            
            
            Products products = new Products();
            while(rs5.next())
            {
                 rent rent = new rent();
                 total = rs5.getDouble(2);
                 size = rs5.getString(4);
                 prodid=rs5.getInt(3);
                 status=rs5.getString(6);
                 
                 startdate = rs5.getString(7);
                 enddate = rs5.getString(8);
                 quantity = rs5.getInt(9);
                 
                 pst4.setInt(1,prodid);
                 
                rs4 = pst4.executeQuery();
                
                while(rs4.next()){
                    
                    products.setProdTitle(rs4.getString(2));
                    products.setProdImage(rs4.getString(6));
                    
                }
                
                rent.setId(rs5.getInt(1));
                rent.setPrice(total);
                rent.setProdTitle(products.getProdTitle());
                rent.setProdImage(products.getProdImage());
                rent.setSize(size);
                rent.setStartdate(startdate);
                rent.setEnddate(enddate);
                rent.setUserID(rs5.getInt(5));
                rent.setStatus(status);
                rent.setQuantity(quantity);
                rentAL.add(rent);
                
             
            }
             con4.close();
             session.setAttribute("rent", rentAL);
             session.setAttribute("User", users);
             RequestDispatcher rd = request.getRequestDispatcher("/adminManageRent.jsp");
             rd.forward(request, response);
        }
        
        else if(option.equals("approve"))
        {
            String newUser=request.getParameter("newUser");
            pst2.setString(1,newUser);
             ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
            users.setId(rs2.getInt(1));
            users.setUserName(rs2.getString(2));
            } 
            session.setAttribute("User", users);
            pst5.setString(1, "APPROVED");
            pst5.setInt(2, id);
            
            int count = pst5.executeUpdate();
            con4.close();

        try (PrintWriter out = response.getWriter()) {
            if(count>0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Rent Status Updated');");
                out.println("</script>"); 
                      
            }
            
            else{
                    RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                    rd.include(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Rent Status Update Fail');");
                    out.println("</script>"); 
                     
            }
                     
        }   
        }
        
        else if(option.equals("reject"))
        {
            String newUser=request.getParameter("newUser");
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
                users.setId(rs2.getInt(1));
                users.setUserName(rs2.getString(2));
            } 
            session.setAttribute("User", users);
            pst5.setString(1, "REJECTED");
            pst5.setInt(2, id);
            
            int count = pst5.executeUpdate();
            con4.close();

        try (PrintWriter out = response.getWriter()) {
            if(count>0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Rent Status Updated');");
                out.println("</script>"); 
                      
            }
            
            else{
                    RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                    rd.include(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Rent Status Update Fail');");
                    out.println("</script>"); 
                     
            }
                     
        }   
        }
        
        else if(option.equals("return"))
        {
            String newUser=request.getParameter("newUser");
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
                users.setId(rs2.getInt(1));
                users.setUserName(rs2.getString(2));
            } 
            session.setAttribute("User", users);
            pst5.setString(1, "COMPLETED");
            pst5.setInt(2, id);
            
            int count = pst5.executeUpdate();
            con4.close();

        try (PrintWriter out = response.getWriter()) {
            if(count>0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Rent Status Updated');");
                out.println("</script>"); 
                      
            }
            
            else{
                    RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                    rd.include(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Rent Status Update Fail');");
                    out.println("</script>"); 
                     
            }
                     
        }   
        }
        
         else if(option.equals("remove"))
        {
            String newUser=request.getParameter("newUser");
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
                users.setId(rs2.getInt(1));
                users.setUserName(rs2.getString(2));
            } 
            session.setAttribute("User", users);
            pst6.setInt(1, id);
            
            int count = pst6.executeUpdate();
            con4.close();

        try (PrintWriter out = response.getWriter()) {
            if(count>0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Rent Record Delete');");
                out.println("</script>"); 
                      
            }
            
            else{
                    RequestDispatcher rd = request.getRequestDispatcher("/adminIndex.jsp");
                    rd.include(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Rent Deletion Fail');");
                    out.println("</script>"); 
                     
            }
                     
        }   
        }
        
        else if(option.equals("removeuser"))
        {
            String newUser=request.getParameter("newUser");
            pst2.setString(1,newUser);
            ResultSet rs2 = pst2.executeQuery();

            User users = new User();
            while(rs2.next()){
             users.setId(rs2.getInt(1));
             users.setUserName(rs2.getString(2));
            } 
            session.setAttribute("User", users);
            pst6.setInt(1, id);
            
            int count = pst6.executeUpdate();
            con4.close();

        try (PrintWriter out = response.getWriter()) {
            if(count>0)
            {
                RequestDispatcher rd = request.getRequestDispatcher("/userIndex.jsp");
                rd.include(request, response);
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Rent Record Delete');");
                out.println("</script>"); 
                      
            }
            
            else{
                    RequestDispatcher rd = request.getRequestDispatcher("/userIndex.jsp");
                    rd.include(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Rent Deletion Fail');");
                    out.println("</script>"); 
                     
            }
                     
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(rentController.class.getName()).log(Level.SEVERE, null, ex);
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

    private int parseint(String parameter) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
