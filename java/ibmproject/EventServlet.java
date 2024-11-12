package ibmproject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/event")
public class EventServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventName = request.getParameter("eventName");
        String eventDescription = request.getParameter("eventDescription");
        String eventDate = request.getParameter("eventDate");
        String eventCategory = request.getParameter("eventcategory");
        Connection conn = null;
        PreparedStatement pstmt = null;

        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver"); 
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/EventDB", "root", "Aarush@2004"); 

            
            String sql = "INSERT INTO events (event_name, event_description, event_date,category) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, eventName);
            pstmt.setString(2, eventDescription);
            pstmt.setString(3, eventDate);
            pstmt.setString(4, eventCategory);
            
            int rowsAffected = pstmt.executeUpdate();

            
            if (rowsAffected > 0) {
                out.println("<html><body>");
                out.println("<script>alert('Event added successfully!');</script>");
                out.println("<script>window.location.href='eventdisplay.jsp';</script>"); 
                out.println("</body></html>");
            } else {
                out.println("<html><body>");
                out.println("<script>alert('Failed to add event. Please try again.');</script>");
                out.println("<script>window.location.href='CommiteeMain.jsp';</script>"); 
                out.println("</body></html>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<html><body>");
            out.println("<script>alert('An error occurred. Please try again.');</script>");
            out.println("<script>window.location.href='CommiteeMain.jsp';</script>"); 
            out.println("</body></html>");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
