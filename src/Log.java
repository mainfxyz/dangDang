

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Log
 */
@WebServlet("/Log")
public class Log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Log() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out =response.getWriter();
		PreparedStatement p = null;
		HttpSession session=request.getSession();
		String list = null;
		String name=request.getParameter("txt");
		String pwd=request.getParameter("passwd");
		String sql="select user from user where user=? and passwd=?;";
		filter.Filte f=new filter.Filte();
		try{
			p=f.getPre(sql);
		}catch(java.sql.SQLException e){
			out.print("connect error!");
		}
		try {
			p.setString(1,name);
			p.setString(2, pwd);
		} catch (SQLException e) {
			out.print("connect error!");
		}
			
		try {
			list=f.getR(p,1);
		} catch (SQLException e) {
			out.println("user or password error!");
		}
		
		if(list==null||list.equals(""))
		{
			out.println("user or password error!");
		}
		else
		{
			session.setAttribute("user",list);
			response.sendRedirect("index.jsp");
		}
	}

}
