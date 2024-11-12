package ibmproject;



import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://database:3306/EventDB";
    private static final String DB_USER = "root"; 
    private static final String DB_PASSWORD = "Aarush@2004"; 

    @Override
    public void init() throws ServletException {
        super.init();
        try {
          
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC driver registered successfully.");
        } catch (ClassNotFoundException e) {
            System.err.println("MySQL JDBC driver not found. Include the JDBC driver in your library path.");
            throw new ServletException("MySQL JDBC driver not found.", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Input validation
        if (name == null || name.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
            sendAlert(response, "All fields are required!", "Commite.jsp");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            // Insert the new club into the database
            String query = "INSERT INTO clubs (name, email, password) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, name);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, password);
                int result = preparedStatement.executeUpdate();

                if (result > 0) {
                    sendAlert(response, "Form submitted successfully!", "Commite.jsp");
                } else {
                    sendAlert(response, "Failed to register club. Please try again.", "Commite.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            sendAlert(response, "Database error: " + e.getMessage(), "Commite.jsp");
        }
    }

    private void sendAlert(HttpServletResponse response, String message, String redirectPage) throws IOException {
        PrintWriter out = response.getWriter();
        out.print("<script type='text/javascript'>");
        out.print("alert('" + message + "');");
        out.print("window.location.href = '" + redirectPage + "';");
        out.print("</script>");
        out.close();
    }
}
