package com.syaccp.easybuy.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.zip.GZIPOutputStream;

import javax.servlet.http.HttpServletResponse;



/**   
 * @Description: 响应工具类 
 * @author  
 * @date 2014-11-16 下午03:48:35 
 * @version V1.0   
 */
public class ResponseUtils {
	
	
	public static void renderGzip(HttpServletResponse response, String text) {
		GZIPOutputStream gout =null;
		try {
			
			response.setHeader("Content-Type", "application/json");
			response.setHeader("Content-Encoding", "gzip");
			response.setHeader("Vary", "Accept-Encoding");
			response.setContentType("application/json;charset=UTF-8");
			response.setHeader("Content-Disposition","gzip");
			
			//response.setHeader("Content-Encoding", "gzip");
			response.setHeader("Expires", "-1");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			//response.setContentType("application/json;charset=UTF-8");
			byte b[] = text.getBytes();
			ByteArrayOutputStream out = new ByteArrayOutputStream();//内存数组流：缓存输出流
			gout = new GZIPOutputStream(out);
			gout.write(b);//压缩后的数据到ByteArrayOutputStream中了
			gout.flush();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				if (gout!=null){
					gout.close();
				}
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
	
		
	}

	public static void renderText(HttpServletResponse response, String text) {
		render(response, "text/plain;charset=UTF-8", text);
	}


	
	public static void renderJson(HttpServletResponse response, String text) {
		render(response, "application/json;charset=UTF-8", text);
	}
	
	public static void render(HttpServletResponse response, String contentType,
			String text) {
		response.setContentType(contentType);
		response.setHeader("Expires", "-1");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Pragma", "no-cache");
		PrintWriter out=null;
		try {
			out=response.getWriter();
			out.write(text);
			out.flush();
		} catch (IOException e) {
			
		}finally{
			if (out!=null){
			   out.close();
			}
		}
	}
	
	
	
	
	
	
}
