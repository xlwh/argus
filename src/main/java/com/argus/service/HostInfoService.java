package com.argus.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.argus.bean.HostInfo;
import com.argus.db.DbUtil;

public class HostInfoService {
	
	/**
	 * 从数据库中查询信息
	 * @return
	 */
	public List<HostInfo> queryAll(){
		DbUtil db = new DbUtil();
		List<HostInfo> result = null;
		String sql = "select * from host_info";
		try {
			result = new ArrayList<HostInfo>();
			Connection conn = db.getConnection();
			ResultSet ret = db.doQuery(conn, sql);
			while(ret.next()){
				HostInfo host = new HostInfo();
				int id = ret.getInt("id");
				String isUp = ret.getString("isUp");
				String status = ret.getString("status");
				
				host.setId(id);
				host.setIsUp(isUp);
				host.setStatus(status);
				
				result.add(host);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
