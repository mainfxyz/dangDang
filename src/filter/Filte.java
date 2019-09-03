package filter;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Filte {
	public PreparedStatement getPre(String sql) throws SQLException
	{
		Connection con = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
		}catch (ClassNotFoundException e) {
			System.out.println("class not");
		}
		String url = "jdbc:mysql://localhost:3306/book?useUnicode=true&characterEncoding=UTF-8" ;    
		String username = "root" ;   
		String password = "123" ;
		con = DriverManager.getConnection(url , username , password ) ;
		Statement stmt = con.createStatement();
		return con.prepareStatement(sql) ;
	}
		
	public String getR(PreparedStatement pstmt,int i) throws SQLException
	{
		ResultSet r =pstmt.executeQuery();
		String list="";
		while(r.next()){
		    for(int j=1;j<=i;j++)
		    	list=list+r.getString(j)+" ";
		}
		return list;
	}
		
	public static void main(String[] args) throws SQLException {
		Filte f=new Filte();
		int n=5;
		PreparedStatement p=f.getPre("select * from `order` where userName=?;");
		p.setString(1, "q");
		String info=f.getR(p,n);
		if(!info.equals("")&&info!=null)
		{
			String[] s=info.split(" ");
			for(int i=0;i<s.length;i++)
			{
				System.out.println(s[i]);
			}
		}
	}
}
