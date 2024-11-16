package ibmproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/displayEvent")
public class DisplayEvent extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://database:3306/EventDB"; 
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Aarush@2004";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchEventName = request.getParameter("searchEventName");
        String searchCategory = request.getParameter("category");

        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<html><body>");
            out.println("<h2>Event Search Results</h2>");

     
            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//                out.println("<p>Database connection successful.</p>");

                if (searchEventName != null && !searchEventName.isEmpty()) {
                    displayEventByName(out, connection, searchEventName);
                } else if (searchCategory != null && !searchCategory.isEmpty()) {
                    displayEventByCategory(out, connection, searchCategory);
                } else {
                    displayAllEvents(out, connection);
                }
            } catch (SQLException e) {
                out.println("<p>SQL Error: " + e.getMessage() + "</p>");
                e.printStackTrace();
            }
            out.println("</body></html>");
        } catch (ClassNotFoundException e) {
            response.getWriter().println("<p>JDBC Driver not found: " + e.getMessage() + "</p>");
            e.printStackTrace();
        }
    }

    
    private void displayEventByName(PrintWriter out, Connection connection, String eventName) throws SQLException {
        String query = "SELECT id, event_name, event_description, event_date, category FROM events WHERE event_name LIKE ? and approved=1 ";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, "%" + eventName + "%");

            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()) {
                out.println("<p>No events found with the name: " + eventName + "</p>");
            } else {
                displayEventTable(out, resultSet);
            }
        }
    }

   
    private void displayEventByCategory(PrintWriter out, Connection connection, String category) throws SQLException {
        String query = "SELECT id, event_name, event_description, event_date,category FROM events WHERE category = ? AND approved=1";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, category);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.isBeforeFirst()) {
                out.println("<p>No events found in the category: " + category + "</p>");
            } else {
                displayEventTable(out, resultSet);
            }
        }
    }

   
    private void displayAllEvents(PrintWriter out, Connection connection) throws SQLException {
        String query = "SELECT id, event_name, event_description, event_date, category FROM events where approved=1";
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            if (!resultSet.isBeforeFirst()) {
                out.println("<p>No events available.</p>");
            } else {
                displayEventTable(out, resultSet);
            }
        }
    }

    
    private void displayEventTable(PrintWriter out, ResultSet resultSet) throws SQLException {
        out.println("<table border='1' cellpadding='5' cellspacing='0'>");
        out.println("<tr><th>S.No</th><th>Event Name</th><th>Description</th><th>Event Date</th><th>Category</th></tr>");
        while (resultSet.next()) {
            out.println("<tr>");
            out.println("<td>" + resultSet.getString("id") + "</td>");
            out.println("<td>" + resultSet.getString("event_name") + "</td>");
            out.println("<td>" + resultSet.getString("event_description") + "</td>");
            out.println("<td>" + resultSet.getString("event_date") + "</td>");
            out.println("<td>" + resultSet.getString("category") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
    }
}
