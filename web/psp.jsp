<%-- 
    Document   : attd
    Created on : May 28, 2015, 7:34:47 PM
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

            ////////////////////////////////

body {
  background-color: #3e94ec;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 16px;
  font-weight: 400;
  text-rendering: optimizeLegibility;
}

div.table-title {
   display: block;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: black;
   font-size: 30px;
   font-weight: 200;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}


/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 50px;
  margin: auto;
  max-width: 600px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  color:#D5DDE5;;
  background: darkslateblue;
  border-bottom:4px solid #9ea7af;
  border-right: 1px solid #343a45;
  font-size:20px;
  font-weight: 100;
  padding:24px;
  text-align:left;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
}

th:first-child {
  border-top-left-radius:3px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color:#666B85;
  font-size:10px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background: wheat;
  color:#FFFFFF;
  border-top: 1px solid #22262e;
  border-bottom: 1px solid #22262e;
}
 
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
  background:white;
}
 
tr:nth-child(odd):hover td {
  background:wheat;
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:15px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:15px;
  text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}


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
        </div>
    </body>
    <body>

        <div class="table-title">
            <%@page import = "java.util.ArrayList" %>
            <%@page import = "java.util.List" %>
            <%@page import = "Servlets.Article" %>
            <%@page import = "java.util.Calendar"%>
            <p> Welcome to PSP </p>

            <table class="table-fill">
                <thead>
                <tr>
                    <th class="text-left">Type</th>
                    <th class="text-left">Article Title</th>
                    <th class="text-left">Author</th>
                    <th class="text-left">Year</th>
                    <th class="text-left">Result</th>
                    <th class="text-left">Rating</th>
                </tr>
                    </thead>
                <%
                    List<Article> articles
                            = (List<Article>) request.getAttribute("articles");

                    for (Article article : articles) {
                        Calendar calendar = Calendar.getInstance();
                        calendar.setTime(article.getDate());
                        out.println("<tr>" 
                                + "<td >" + article.getType() + "</td>"
                                + "<td>" + "<a href='getArticle?paperTitle=" + article.getPaperTile() + "' target='right'>" + article.getPaperTile() + "</a>" + "</td>"
                                + "<td>" + article.getAuthor() + "</td>"
                                 + "<td>" + calendar.get(Calendar.YEAR) + "</td>"
                                + "<td>" + article.getResults() + "</td>"
                                + "<td>" + "<select> <option> 1 </option>"
                                + "<option>2</option>" 
                                 + "<option>3</option>" 
                                 + "<option>4</option>" 
                                 + "<option>5</option>" 
                                + "</td>"
                                + "</tr>");

                    }
                %>
            </table>


        </div>


    </body>
</html>
