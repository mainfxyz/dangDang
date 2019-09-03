

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
 * Servlet implementation class Iorder
 */
@WebServlet("/Iorder")
public class Iorder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Iorder() {
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
		String book=request.getParameter("book");
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user");
		if(user==null||"".equals(user))
		{
			out.print("请先登录");
		}
			else
			{
				PreparedStatement p = null;
				String sql="insert into `order` values(?,?,?,?,?);";
				filter.Filte f=new filter.Filte();
				try {
					p=f.getPre(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					e.printStackTrace();
				}
				
				try {
					p.setString(1,""+System.currentTimeMillis());
					p.setString(2,user);
					p.setString(3,book);
					p.setString(4,"交易完成");
					p.setInt(5,1);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					e.printStackTrace();
				}
				int up = 0;
				try {
					up=p.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					e.printStackTrace();
					//out.println("购物车里已经存在");
				}
				
				if(!err&&up==1)
					response.sendRedirect("orderList.jsp");
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
