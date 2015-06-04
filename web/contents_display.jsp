<%-- 
    Document   : contents_display
    Created on : May 28, 2015, 8:38:03 PM
    Author     : Mohammed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>ATTD</title>

        <style>
            /* Begin Navigation Bar Styling */
            #nav {
                width: 100%;
                float: left;
                margin: 0 0 3em 0;
                padding: 0;
                list-style: none;
                background-color: #f2f2f2;
                border-bottom: 1px solid #ccc; 
                border-top: 1px solid #ccc; }
            #nav li {
                float: left; }
            #nav li a {
                display: block;
                padding: 8px 15px;
                text-decoration: none;
                font-weight: bold;
                color: #069;
                border-right: 1px solid #ccc; }
            #nav li a:hover {
                color: #c00;
                background-color: #fff; }
            /* End navigation bar styling. */

            /* This is just styling for this specific page. */
            body {
                background-color: whitesmoke; 
                font: small/1.3 Arial, Helvetica, sans-serif; }
            #wrap {
                width: auto;
                margin: auto;
                background-color: whitesmoke; }
            h1 {
                font-size: 1.5em;
                padding: 1em 8px;
                color: #333;
                background-color: #069;
                margin: 0; }
            #content {
                padding: 0 5px 5px }
            </style>
        </head>

        <body>
            <div id="wrap">


            <!-- Here's all it takes to make this navigation bar. -->
            <ul id="nav">
                <li><a href="display_welcome.html" target="right">Home</a></li>
                <li><a href="favArticle.html" target="right">Favorite article</a></li>
                <li><a href="login.html" target="right">Login</a></li>


            </ul>
            <!-- That's it! -->

            <div id="content">
                <%@page import = "Servlets.Contents" %>
                <p> Welcome to content </p>

                    <%
                        Contents content
                                = (Contents) request.getAttribute("content");

                        out.println(content.getContents());
                    %>



            </div>
        </div>

    </body>
</html>
