
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String v2 = request.getParameter("n1");
		String v3 = request.getParameter("n2");
		String v4 = request.getParameter("n3");
		String v5 = request.getParameter("n4");
		String v6 = request.getParameter("n5");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/world", "root", "root");
			String q = ("update reg_table set emp_name=?,doj=?,dob=?,emp_dept=?,emp_desg=? where emp_id=?");
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, v2);
			pst.setString(2, v3);
			pst.setString(3, v4);
			pst.setString(4, v5);
			pst.setString(5, v6);
			pst.setInt(6, id);
			int i = pst.executeUpdate();
			if (i > 0) {
				response.sendRedirect("TableServlet");
			} else {
				out.println(id);
			}
		} catch (Exception e) {
			System.out.println("edit page cacth block");
			e.printStackTrace();
		}

	}
}
