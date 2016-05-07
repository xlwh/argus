package com.argus.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {
	private String url = "";
	private static String driver = "com.mysql.jdbc.Driver";
	private String user = "";
	private String pass = "";

	// 加载数据库的驱动程序
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 获取数据库的连接
	 * 
	 * @return
	 * @throws SQLException
	 */
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		conn = DriverManager.getConnection(url, user, pass);
		return conn;
	}

	/**
	 * 执行数据库更新的操作
	 * 
	 * @param conn
	 *            数据库的连接对象
	 * @param sql
	 *            数据库更新操作的sql
	 * @return 操作影响的记录数目
	 */
	public int doUpdate(Connection conn, String sql) {
		int ret = -1;
		return ret;
	}

	/**
	 * 执行数据库的查询的操作
	 * 
	 * @param conn
	 *            数据库的连接对象
	 * @param sql
	 *            查询sql
	 * @return 从数据库中查询到的记录数
	 * @throws SQLException
	 */
	public ResultSet doQuery(Connection conn, String sql) throws SQLException {
		ResultSet result = null;
		PreparedStatement pst = conn.prepareStatement(sql);
		result = pst.executeQuery();
		return result;
	}

	/**
	 * 执行数据库的关闭的操作
	 * 
	 * @param conn
	 * @param resultSet
	 */
	public void doClose(Connection conn, ResultSet resultSet) {
		try {
			if (resultSet != null && !resultSet.isClosed()) {
				resultSet.close();
			}
			if (conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
