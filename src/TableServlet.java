import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TableServlet
 */
@WebServlet("/TableServlet")
public class TableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public TableServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		SimpleDateFormat targetFormat=new SimpleDateFormat("dd-MM-yyyy");
		out.print(
				"<table ><tr><th>Employee id</th><th>Employee Name</th><th>Date of joining</th><th>Date of Birth</th><th>Department</th><th>Desgination</th>");
		// out.print("<table border="1">");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/world", "root", "root");
			Statement smt = con.createStatement();
			ResultSet rs = smt.executeQuery("select * from reg_table");
			List<Employee> empList = new ArrayList<>();
			while (rs.next()) 
			{
				int emp_id = rs.getInt("emp_id");
				String emp_name = rs.getString("emp_name");
				String doj = targetFormat.format(rs.getDate("doj"));
				String dob = targetFormat.format(rs.getDate("dob"));
				String emp_dept = rs.getString("emp_dept");
				String emp_desg = rs.getString("emp_desg");
				Employee employee = new Employee(emp_id, emp_name, doj, dob, emp_dept, emp_desg);
				empList.add(employee);

			/**	out.print("<tr><td>");
				out.println(rs.getInt(1));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString(2));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getDate(3));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getDate(4));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString(5));
				out.print("</td>");
				out.print("<td>");
				out.print(rs.getString(6));
				out.print("</td>");
				out.print("</tr>");
		    **/
			}
			request.setAttribute("empList", empList);
			RequestDispatcher rd = request.getRequestDispatcher("viewtable1.jsp");
			rd.forward(request, response);
			con.close();
			smt.close();
		} catch (Exception e) {
			System.out.println("table page catch");
			e.printStackTrace();
		}
		out.print("</table>");
	}
}
