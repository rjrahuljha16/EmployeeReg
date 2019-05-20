import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		// reading data from form
		String v1 = request.getParameter("n1");
		String v2 = request.getParameter("n2");
		// jdbc code
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/world", "root", "root");
			String q = ("select * from emp_table where userid=? and password=?");
			PreparedStatement pst = con.prepareStatement(q);
			pst.setString(1, v1);
			pst.setString(2, v2);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				// for session tracking
				HttpSession hs = request.getSession();
				hs.setAttribute("name", v1);
				
				//RequestDispatcher rd = request.getRequestDispatcher("mainpage.jsp");
				//rd.include(request, response);
				response.sendRedirect("mainpage.jsp");
				// System.out.println("data entered");
				// pw.println("login Successful");
			} else {
				out.print("<html>");
				out.print("<head>");
				// out.print("<style>");
				// out.print("<.container{margin:20px;}>");
				// out.print("</style>");
				out.print("</head>");
				out.print("<body>");
				out.print("<center>");
				out.print("<div style= margin:400px;color:red;position:fixed;left:135px;>");
				out.print("Invalid user name or password.");
				out.print("</div>");
				out.print("</center>");
				out.print("</body>");
				out.print("</html>");

				RequestDispatcher rd = request.getRequestDispatcher("login.html");
				rd.include(request, response);

				// pw.println("Login error");
				// response.sendRedirect("login.html");

			}
			con.close();
			pst.close();
		} catch (Exception e) {
			System.out.println("--catch block--");
			e.printStackTrace();
		}
	}
}