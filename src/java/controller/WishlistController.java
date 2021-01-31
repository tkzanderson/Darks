/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bean.Products;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import java.util.Vector;
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

        Vector wish = (Vector) session.getAttribute("wishlist");

        String action = request.getParameter("action");
        if (action.equals("VIEW"))
        {
            request.setAttribute("output", "VIEW");
            session.setAttribute("wishlist", wish);
              
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
            String action = request.getParameter("action");

            Vector wish = (Vector)session.getAttribute("wishlist");

            boolean match = false;
            
            if (action.equals("ADD"))
            {
        	Products p = getProducts(request);
        	if (wish == null)
        	{
                    //add first product to the wishlist
                    wish = new Vector();
                    wish.addElement(p);
        	}
        	else
        	{
                    for(int i=0; i<wish.size(); i++)
                    {
                        Products pro = (Products)wish.elementAt(i);
                        
                        if (pro.getProdTitle().equals(p.getProdTitle()))
			{
                            
                            wish.setElementAt(pro, i);
                            match = true;
			}
                    }
                    if (!match)
                        wish.addElement(p);
		}
                
		session.setAttribute("wishlist", wish);
                request.setAttribute("p", p);
                RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                rd.forward(request, response);

            }else if (action.equals("REMOVE"))
            {
		
                RequestDispatcher rd= request.getRequestDispatcher("wishlist.jsp");
                rd.forward(request, response);
                
		
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    //Constructor for bean
    Products getProducts(HttpServletRequest request)
  	{
            String title = request.getParameter("prodTitle");
            String image = request.getParameter("prodImage");
            double price = Double.parseDouble(request.getParameter("prodPrice"));
            
            Products products = new Products();
            products.setProdTitle(title);
            products.setProdImage(image);
            products.setProdPrice((new Double(price)).floatValue());
            
            return products;
  	}


}
