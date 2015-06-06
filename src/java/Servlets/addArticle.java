package Servlets;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mohammed
 */
public class addArticle extends HttpServlet {

    private final PreparedStatement statement1;

    public addArticle() throws IOException, ClassNotFoundException, SQLException {

        String dbDriver = "com.mysql.jdbc.Driver";
        String dbUrl = "jdbc:mysql://localhost:3306/se2";

        String userName = "root";
        String password = "changeit";
        // connect to the database and create a prepared statement
        Class.forName(dbDriver);
        Connection connection = DriverManager.getConnection(dbUrl, userName, password);
        statement1 = connection.prepareStatement("insert into datainfo(type, paperTitle, contents, author, date, practices, participient, who, results, integrity, benefits, credibility, whoAndWhy, metrics )"
                + " values (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        System.out.println("Opened database successfully");

        /*   preparedStatement = connection.prepareStatement(statement1);
         preparedStatement.setString(1, "FBB");
         preparedStatement.setString(2, "4545");
            
         preparedStatement.executeUpdate();
       
            
         System.out.println("Succesfully added");
         */
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeArticle = request.getParameter("typeArticle");
        String paperTitle = request.getParameter("paperTitle");
        String contents = request.getParameter("contents");
        String author = request.getParameter("author");
        String date = request.getParameter("date");
        String practices = request.getParameter("practices");
        String participient = request.getParameter("participient");
        String who = request.getParameter("who");
        String results = request.getParameter("results");
        String integrity = request.getParameter("integrity");
        String benefits = request.getParameter("benefits");
        String credibility = request.getParameter("credibility");
        String whoAndWhy = request.getParameter("whoAndWhy");
        String metrics = request.getParameter("metrics");

        boolean isAdded = true;
        try {
            statement1.setString(1, typeArticle);
            statement1.setString(2, paperTitle);
            statement1.setString(3, contents);
            statement1.setString(4, author);
            statement1.setString(5, date);
            statement1.setString(6, practices);
            statement1.setString(7, participient);
            statement1.setString(8, who);
            statement1.setString(9, results);
            statement1.setString(10, integrity);
            statement1.setString(11, benefits);
            statement1.setString(12, credibility);
            statement1.setString(13, whoAndWhy);
            statement1.setString(14, metrics);
            statement1.executeUpdate();
        } catch (SQLException ex) {
            isAdded = false;
            //Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);

        }

        if (isAdded) {
            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher(
                            "/insert_confirm.html");
            requestDispatcher.forward(request, response);
        } else {

            RequestDispatcher requestDispatcher
                    = getServletContext().getRequestDispatcher(
                            "/insert_paperError.html");
            requestDispatcher.forward(request, response);
        }
    }

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
