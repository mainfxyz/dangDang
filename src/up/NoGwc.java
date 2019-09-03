package up;

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
 * Servlet implementation class NoGwc
 */
@WebServlet("/NoGwc")
public class NoGwc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoGwc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean err=false;
		response.setCharacterEncoding("utf-8");
		PrintWriter out =response.getWriter();
		//int n=0;
		//String snum=request.getParameter("number");
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
				String sql="delete from gwc where bookName=? and userName=?;";
				filter.Filte f=new filter.Filte();
				try {
					p=f.getPre(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					e.printStackTrace();
				}
				
				try {
					p.setString(2,user);
					p.setString(1,book);
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
					out.println("购物车err");
				}
				
				if(!err&&up==1)
					out.print("已取消添加");
			}
		}

}
