package br.com.uninove.projeto.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDao {
	
	public Connection connection() throws ClassNotFoundException {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/projeto?user=root&password=123456";
			con = DriverManager.getConnection(url);
		}catch (SQLException e) {
			
		}
		return con;
	}
}
