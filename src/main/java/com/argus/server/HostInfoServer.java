package com.argus.server;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.argus.bean.HostInfo;
import com.argus.service.HostInfoService;

/**
 * Servlet implementation class HostInfoServer
 */
@WebServlet("/host")
public class HostInfoServer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HostInfoServer() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		HostInfoService hostInfoService = new HostInfoService();
		List<HostInfo> result = hostInfoService.queryAll();
		JSONObject object = new JSONObject();
		JSONArray array = new JSONArray();
		int err_no = -1;
		String msg = "error";
		for(HostInfo hostInfo : result){
			JSONObject item = new JSONObject();
			item.put("id", hostInfo.getId());
			item.put("isUp", hostInfo.getIsUp());
			item.put("status", hostInfo.getStatus());
			
			array.put(item);
		}
		object.put("err_no", err_no);
		object.put("msg", msg);
		object.put("data", array);
		String ret = object.toString();
		out.println(ret);
	}

}
