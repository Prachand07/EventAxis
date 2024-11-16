<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <link rel="stylesheet" href="adminportal.css">
</head>
<body>
    <header class="header">
        <div class="header-content">
            <a href="index.jsp" class="logo">EventAxis</a>
            <nav>
                <ul id="nav-links">
                    <li><a href="index.jsp" class="nav-link">Home</a></li>
                    <li><a href="EventsMain.jsp" class="nav-link">Events</a></li>
                    <li><a href="#" class="nav-link">Contact</a></li>
                </ul>
            </nav>
            <div class="toggle-button" onclick="toggleMenu()">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>
    </header>

    <div class="container">
        <h1>Admin Portal</h1>
        <div class="event-list">
            <%
                String jdbcURL = "jdbc:mysql://database:3306/eventdb";
                String jdbcUsername = "root";
                String jdbcPassword = "Aarush@2004";

                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                } catch (ClassNotFoundException e) {
                    out.println("<p>Error loading MySQL driver: " + e.getMessage() + "</p>");
                    return;
                }

                try (Connection conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                     Statement stmt = conn.createStatement()) {

                    String sql = "SELECT * FROM events order by approved";
                    ResultSet rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String eventName = rs.getString("event_name");
                        String eventDate = rs.getString("event_date");
                        int approved = rs.getInt("approved");
            %>
            <div class="event">
                <div class="event-details">
                    <div class="event-title"><%= eventName %></div>
                    <div class="event-date"><%= eventDate %></div>
                </div>
                <div class="event-actions">
                    <% if (approved == 0) { %>
                        <form method="post" action="AdminServlet">
                            <input type="hidden" name="eventId" value="<%= id %>">
                            <input type="hidden" name="action" value="approve">
                            <button type="submit" class="btn btn-approve">Approve</button>
                        </form>
                        <form method="post" action="AdminServlet">
                            <input type="hidden" name="eventId" value="<%= id %>">
                            <input type="hidden" name="action" value="reject">
                            <button type="submit" class="btn btn-reject">Reject</button>
                        </form>
                    <% } else { %>
                        <span>Approved</span>
                    <% } %>
                </div>
            </div>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<p>Error fetching events: " + e.getMessage() + "</p>");
                }
            %>
        </div>
    </div>

    <script>
        function toggleMenu() {
            const navLinks = document.getElementById('nav-links');
            navLinks.classList.toggle('active');
        }
    </script>
</body>
</html>
