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

@WebServlet("/sturegister")
public class StudentRegisterServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://database:3306/EventDB";
    private static final String DB_USER = "root1"; 
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
        String student_name = request.getParameter("name");
        String student_email = request.getParameter("email");
        String student_password = request.getParameter("password");

      
        if (student_name == null || student_name.isEmpty() || student_email == null || student_email.isEmpty() || student_password == null || student_password.isEmpty()) {
            sendAlert(response, "All fields are required!", "loginStudent.jsp");
            return;
        }

        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
           
            String query = "INSERT INTO students (student_name, student_email, student_password) VALUES (?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, student_name);
                preparedStatement.setString(2, student_email);
                preparedStatement.setString(3, student_password);
                int result = preparedStatement.executeUpdate();

                if (result > 0) {
                    sendAlert(response, "Registered successfully!", "loginStudent.jsp");
                } else {
                    sendAlert(response, "Failed to register. Please try again.", "loginStudent.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            sendAlert(response, "Database error: " + e.getMessage(), "loginStudent.jsp");
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
