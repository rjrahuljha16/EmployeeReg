import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterEmp
 */
@WebServlet("/RegisterEmp")
public class RegisterEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterEmp() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// reading data from form
		String v1 = request.getParameter("n1");
		String v2 = request.getParameter("n2");
		String v3 = request.getParameter("n3");
		String v4 = request.getParameter("n4");
		String v5 = request.getParameter("n5");
		// Jdbc connection
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/world", "root", "root");
			// Preparing query
			// PreparedStatement pst1= con.prepareStatement("select emp_id from
			// emp_reg where emp_id=?");
			PreparedStatement pst2 = con
					.prepareStatement("insert into reg_table(emp_name,doj,dob,emp_dept,emp_desg) values(?,?,?,?,?)");
			// pst1.setString(1, v2);
			// Executing query and storing in resultset
			// ResultSet rs=pst1.executeQuery();
			// if(rs.next())
			// {
			// pw.println("Employee id already existed");
			// response.sendRedirect("register.html");
			// }
			// else
			// {
			pst2.setString(1, v1);
			pst2.setString(2, v2);
			pst2.setString(3, v3);
			pst2.setString(4, v4);
			pst2.setString(5, v5);
			int v = pst2.executeUpdate();
			if (v == 1) {
				
			//	request.setAttribute("empAdd", v);
				
				out.print("<html>");
				out.print("<head>");
				out.print("</head>");
				out.print("<body>");
				out.print("<center>");
				out.print("<div style= margin:450px;color:red;position:fixed;left:135px;>");
				out.print("Employee " + v1 + " is registered.");
				out.print("</div>");
				out.print("</center>");
				out.print("</body>");
				out.print("</html>");
				// pw.println("Employee register successfully");
				// response.sendRedirect("table.jsp");
		
			}
			RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
			rd.include(request, response);
			// }
			con.close();
			// pst1.close();
			pst2.close();
		} catch (Exception e) {
			System.out.println("--Employee Registeration---");
			e.printStackTrace();
		}
	}
}