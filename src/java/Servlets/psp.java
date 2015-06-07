/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mohammed
 */
public class psp extends HttpServlet {

    private final PreparedStatement statement1;

    public psp() throws IOException, ClassNotFoundException, SQLException {

        String dbDriver = "com.mysql.jdbc.Driver";
        String dbUrl = "jdbc:mysql://localhost:3306/se2";

        String userName = "root";
        String password = "changeit";
        // connect to the database and create a prepared statement
        Class.forName(dbDriver);
        Connection connection = DriverManager.getConnection(dbUrl, userName, password);
        statement1 = connection.prepareStatement("SELECT type,paperTitle,author,date,results FROM datainfo WHERE type='PSP'");
        System.out.println("Opened database successfully");

        /*   preparedStatement = connection.prepareStatement(statement1);
         preparedStatement.setString(1, "FBB");
         preparedStatement.setString(2, "4545");
            
         preparedStatement.executeUpdate();
       
            
         System.out.println("Succesfully added");
         */
    }

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

        ResultSet resultSet;
        try {
            // synchronize access to statment
            synchronized (this) {
                resultSet = statement1.executeQuery();
            }
            List<Article> articles = new ArrayList<>();
            while (resultSet.next()) {
                Article article = new Article();
                article.setType(resultSet.getString("type"));
                article.setPaperTile(resultSet.getString("paperTitle"));
                article.setAuthor(resultSet.getString("author"));
                article.setDate(resultSet.getDate("date"));
                article.setResults(resultSet.getString("results"));
                articles.add(article);
            }

            request.setAttribute("articles", articles);

            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher(
                            "/psp.jsp");

            requestDispatcher.forward(request, response);

        } catch (SQLException e) {
            System.err.println("SQL Exception during query: " + e);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
