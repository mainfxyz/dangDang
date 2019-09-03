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
import javax.servlet.http.HttpSessionListener;

import filter.Filte;

/**
 * Servlet implementation class UpGwc
 */
@WebServlet("/UpGwc")
public class UpGwc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpGwc() {
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
		int n=0;
		String snum=request.getParameter("num");
		String book=request.getParameter("book");
		try{
			n=Integer.parseInt(snum);
			if(n<=0)
				out.print("请输入>0的数字");
		}catch(java.lang.NumberFormatException e) {
			out.print("请输入数字");
			err=true;
		}
		if(!err)
		{
			HttpSession session=request.getSession();
			String user=(String)session.getAttribute("user");
			if(user==null||"".equals(user))
			{
				out.print("请先登录");
			}
			else
			{
				PreparedStatement p = null;
				String sql="insert into gwc values(?,?,?);";
				filter.Filte f=new filter.Filte();
				try {
					p=f.getPre(sql);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					err=false;
					e.printStackTrace();
				}
				
				try {
					p.setString(1,user);
					p.setString(2,book);
					p.setInt(3,n);
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
					out.println("购物车里已经存在");
				}
				
				if(!err&&up==1)
					out.print(n+"个"+book+"添加成功");
			}
		}
	}

}
