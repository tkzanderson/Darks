/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.User;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author janic
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 1000, // 1 GB
        maxRequestSize = 1024 * 1024 * 1000)   	// 1 GB
public class PaymentProofServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession(true);
            String folderName = "resources";
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + folderName;
            File dir = new File(uploadPath);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            Part filePart = request.getPart("file");//Textbox value of name file.
            int userID = Integer.parseInt(request.getParameter("userID"));//Textbox value of name firstname..
            String userName = request.getParameter("userName");
            int rentID = Integer.parseInt(request.getParameter("rentID"));
            String fileName = filePart.getSubmittedFileName();
            String path = folderName + File.separator + fileName;
            Timestamp paidDate = new Timestamp(System.currentTimeMillis());
            System.out.println("fileName: " + fileName);
            System.out.println("Path: " + uploadPath);
            System.out.println("Name: " + userName);
            InputStream is = filePart.getInputStream();
            Files.copy(is, Paths.get(uploadPath + File.separator + fileName), StandardCopyOption.REPLACE_EXISTING);

            try {
                String driver = "com.mysql.jdbc.Driver";
                String dbName = "darks";
                String url = "jdbc:mysql://localhost/" + dbName + "?";
                String userNameDB = "root";
                String password = "";
                String query = "INSERT into payment(filename,path,userID, paidDate, rentID) values(?,?,?,?,?)";
                String query2 = "UPDATE rent SET status=? WHERE id=?";               
                try {
                        Class.forName(driver); 
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(ProfileServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                Connection con = DriverManager.getConnection(url, userNameDB, password); 
                PreparedStatement st2 = con.prepareStatement(query2);
                st2.setString(1, "PAID");
                st2.setInt(2, rentID);
                
                st2.executeUpdate();
                PreparedStatement st = con.prepareStatement(query);
                
                
                st.setString(1, fileName);
                st.setString(2, path);
                st.setInt(3, userID);
                st.setTimestamp(4, paidDate);
                st.setInt(5, rentID);
                int status = st.executeUpdate();
                
                User user = new User();
                user.setId(userID);
                user.setUserName(userName);
                
                if (status > 0) {
//                    session.setAttribute("fileName", fileName);
//                    String msg = "" + fileName + " File uploaded successfully...";
//                    request.setAttribute("msg", msg);
                    session.setAttribute("User", user);
                    RequestDispatcher rd = request.getRequestDispatcher("/userIndex.jsp");
                    rd.forward(request, response);
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Payment process success!');");
                    out.println("</script>");
                }
                
                
            } catch (SQLException e) {
                out.println("Exception: " + e);
                System.out.println("Exception1: " + e);
            } 

        } catch (IOException | ServletException e) {
            out.println("Exception: " + e);
            System.out.println("Exception2: " + e);
        }
    }

}
