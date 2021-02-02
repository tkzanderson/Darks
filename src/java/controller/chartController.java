/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Chart;
import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Anderson
 */
public class chartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.lang.ClassNotFoundException
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        HttpSession session =request.getSession(true);
        response.setContentType("text/html;charset=UTF-8");
    
    int numP=0;
    int numA=0;
    int numR=0;
    int numPA=0;
    int numC=0;
    String newUser=request.getParameter("newUser");
    User users = new User();
        
    String driver="com.mysql.jdbc.Driver";
    String dbName="darks";
    String url="jdbc:mysql://localhost/"+dbName+"?";
    String userName="root";
    String password="";
    
    String queryPending ="SELECT * from rent WHERE status='PENDING'";
    String queryApproved ="SELECT * from rent WHERE status='APPROVED'";
    String queryRejected ="SELECT * from rent WHERE status='REJECTED'";
    String queryPaid ="SELECT * from rent WHERE status='PAID'";
    String queryCompleted ="SELECT * from rent WHERE status='COMPLETED'";
    String query="SELECT * FROM users WHERE userName=?";
    
    Class.forName(driver);
    Connection con = DriverManager.getConnection(url, userName, password);
    
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    PreparedStatement pst2 = con.prepareStatement(query);
    pst2.setString(1,newUser);
    ResultSet rs2 = pst2.executeQuery();
    
    ResultSet rsP = st.executeQuery(queryPending);
    ResultSet rsA = st1.executeQuery(queryApproved);
    ResultSet rsR = st2.executeQuery(queryRejected);
    ResultSet rsPA = st3.executeQuery(queryPaid);
    ResultSet rsC = st4.executeQuery(queryCompleted);
    
    while(rs2.next()){
    users.setId(rs2.getInt(1));
    users.setUserName(rs2.getString(2));
    }  
        
    while(rsP.next())
    {
        numP++;
    }

    while(rsA.next())
    {
        numA++;
    }
    
    while(rsR.next())
    {
        numR++;
    }
    
    while(rsPA.next())
    {
        numPA++;
    }
    
    while(rsC.next())
    {
        numC++;
    }
    
 
    
    int total=numP+numA+numR+numPA+numC;          
    numP=numP*100/total;
    numA=numA*100/total;    
    numR=numR*100/total;
    numPA=numPA*100/total;
    numC=numC*100/total;   
    
            
        
    Gson gsonObj = new Gson();
    Map<Object,Object> map = null;
    List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
    map = new HashMap<Object,Object>(); map.put("label", "PENDING"); map.put("y", numP); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "APPROVED"); map.put("y", numA); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "REJECTED"); map.put("y", numR); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "PAID"); map.put("y", numPA); list.add(map);
    map = new HashMap<Object,Object>(); map.put("label", "COMPLETED"); map.put("y", numC); list.add(map);
    
 
    String dataPoints = gsonObj.toJson(list);
    Chart chart = new Chart();
    chart.setDataPoints(dataPoints);
    session.setAttribute("User", users);
    session.setAttribute("chart", chart);
    
    /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    String queryRenting ="SELECT * from rent";
    Statement stRenting = con.createStatement();
    ResultSet rsRenting = stRenting.executeQuery(queryRenting);
    
    ArrayList<Integer> arl = new ArrayList<Integer>(); //to get the size of the product
    ArrayList<Integer> brl = new ArrayList<Integer>(); //to get the total number for each product
    ArrayList<Double> crl = new ArrayList<Double>(); //to get the percentage number for each product
    ArrayList<String> drl = new ArrayList<String>(); 
    int allProductID;
    String allProductName;
    String queryAllProduct ="SELECT * from products";
    Statement stAllProduct = con.createStatement();
    ResultSet rsAllProduct = stAllProduct.executeQuery(queryAllProduct);
    
    while(rsAllProduct.next()){
        allProductID =rsAllProduct.getInt(1);
        allProductName = rsAllProduct.getString(2);
        arl.add(allProductID);
         brl.add(0);
         crl.add(0.0);
         drl.add(allProductName);
    }
    
    int productRentingID;
    int totalProduct = 0;
    int eachQuantityRentingProduct;
    while(rsRenting.next())
    {
        productRentingID = rsRenting.getInt(3);
        eachQuantityRentingProduct = rsRenting.getInt(9);
        for(int i=0; i<arl.size(); i++){
            if(productRentingID==arl.get(i)){
                brl.set(i, (brl.get(i)+eachQuantityRentingProduct));
                totalProduct+=eachQuantityRentingProduct;
            }
        }
     
    }
    
    for(int i=0; i<brl.size(); i++){
        crl.set(i, Double.valueOf((brl.get(i)*100/totalProduct)));
    }
    
    
    Gson gsonObj1 = new Gson();
    Map<Object,Object> map1 = null;
    List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
    
    for(int i=0; i<arl.size(); i++){
        map1 = new HashMap<Object,Object>(); 
        map1.put("label", drl.get(i)); 
        map1.put("y", crl.get(i)); 
        list1.add(map1);
    }
    
 
    
    String dataPoints1 = gsonObj1.toJson(list1);
    Chart chart1 = new Chart();
    chart1.setDataPoints(dataPoints1);
    
    session.setAttribute("chart1", chart1);
    

    
    
    
    
    
    
       con.close();
    RequestDispatcher rd = request.getRequestDispatcher("/viewChart.jsp");
    rd.include(request, response);
    
        
        
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet chartController</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet chartController at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
            Logger.getLogger(chartController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(chartController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(chartController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(chartController.class.getName()).log(Level.SEVERE, null, ex);
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
