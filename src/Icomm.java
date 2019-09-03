

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
 * Servlet implementation class Icomm
 */
@WebServlet("/Icomm")
public class Icomm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Icomm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean err=false;
		response.setCharacterEncoding("utf-8");
		PrintWriter out =response.getWriter();
		//int n=0;
		//String snum=request.getParameter("num");
		String book=new String(request.getParameter("book").getBytes("ISO8859_1"),"utf-8");
		String comm=request.getParameter("comm");
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user");
		if(user==null||"".equals(user))
		{
			out.print("请先登录");
		}
			else
			{
				PreparedStatement p = null;
				String sql="insert into `comments` values(?,?,?,?);";
				filter.Filte f=new filter.Filte();
				try {
					p=f.getPre(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					out.println("3");
					e.printStackTrace();
				}
				
				try {
					p.setString(1,comm);
					p.setInt(2,2);
					p.setString(3,user);
					p.setString(4,book);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					out.println("2");
					e.printStackTrace();
				}
				int up = 0;
				try {
					up=p.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					out.println("您不能重复评论");
					e.printStackTrace();
				}
				
				if(!err&&up==1)
					response.sendRedirect("orderList.jsp");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
