package ibmproject;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://database:3306/eventdb";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "Aarush@2004";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eventId = request.getParameter("eventId");
        String action = request.getParameter("action");
        String sql = "";

        if ("approve".equals(action)) {
            sql = "UPDATE events SET approved = 1 WHERE id = ?";
        } else if ("reject".equals(action)) {
            sql = "UPDATE events SET approved = -1 WHERE id = ?";
        }

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, Integer.parseInt(eventId));
            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                response.sendRedirect("AdminPortal.jsp?status=success");
            } else {
                response.sendRedirect("AdminPortal.jsp?status=failed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AdminPortal.jsp?status=error");
        }
    }
}
