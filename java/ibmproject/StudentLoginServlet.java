package ibmproject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/stulogin")
public class StudentLoginServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://database:3306/EventDB";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Aarush@2004";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Registered Successfully.");

            
            try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                System.out.println("Database Connection Established Successfully.");

                String query = "SELECT student_password FROM students WHERE student_email = ?";
                try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                    preparedStatement.setString(1, email);
                    ResultSet resultSet = preparedStatement.executeQuery();

                    
                    if (resultSet.next()) {
                        String storedPassword = resultSet.getString("student_password");
                        
                        
                        System.out.println("Input Email: " + email);
                        System.out.println("Input Password: " + password);
                        System.out.println("Stored Password: " + storedPassword);

                        if (storedPassword.equals(password)) { 
                        	 String clubName = "Select student_name from student where student_email=?";
                        	 HttpSession session = request.getSession();
                        	 session.setAttribute("studentname", clubName);
                            response.sendRedirect("eventdisplay.jsp"); 
                        } else {
                            sendAlert(response, "Login unsuccessful. Please try again.");
                        }
                    } else {
                        System.out.println("No user found with email: " + email);
                        sendAlert(response, "Login unsuccessful. Please try again.");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            sendAlert(response, "JDBC Driver not found.");
        } catch (SQLException e) {
            e.printStackTrace();
            sendAlert(response, "Database error occurred.");
        }
    }

    private void sendAlert(HttpServletResponse response, String message) throws IOException {
        response.setContentType("text/html");
        response.getWriter().println("<html><head><script type='text/javascript'>");
        response.getWriter().println("alert('" + message + "');");
        response.getWriter().println("window.location.href='loginStudent.jsp';"); 
        response.getWriter().println("</script></head><body></body></html>");
    }
}
