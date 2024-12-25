package ibmproject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/eventlist")
public class PastupcomingServlet extends HttpServlet {

    private static final String JDBC_URL = "jdbc:mysql://database:3306/EventDB";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Aarush@2004";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ListEvent> events = new ArrayList<>();

        
        String action = request.getParameter("action");
        boolean isPast = "past".equals(action);

        System.out.println("Action requested: " + action);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD)) {
                String query = "SELECT event_name, event_description, event_date, category FROM events where approved=1 ORDER BY event_date";
                try (Statement stmt = conn.createStatement();
                     ResultSet rs = stmt.executeQuery(query)) {

                    while (rs.next()) {
                        String eventName = rs.getString("event_name");
                        String eventDescription = rs.getString("event_description");
                        Date eventDate = rs.getDate("event_date");
                        String eventcategory = rs.getString("category");
                        
                        ListEvent event = new ListEvent(eventName, eventDescription, eventDate, eventcategory);

                        System.out.println("Fetched Event: " + eventName + " on " + eventDate);

                        
                        if (isPast) {
                            if (eventDate.before(new Date(System.currentTimeMillis()))) {
                                events.add(event);
                                System.out.println("Added to Past Events: " + eventName);
                            }
                        } else {
                            if (eventDate.after(new Date(System.currentTimeMillis()))) {
                                events.add(event);
                                System.out.println("Added to Upcoming Events: " + eventName);
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

      
        System.out.println("Total Events Found: " + events.size());

        
        request.setAttribute("events", events);
        request.getRequestDispatcher("/pastup.jsp").forward(request, response);
    }
}
