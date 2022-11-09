package Controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class BoardFiles
 */
@WebServlet("*.file")
public class BoardFiles extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String filePath = request.getServletContext().getRealPath("files");
		try {
			if (uri.equals("/download.file")) {
				String sysName = request.getParameter("sysname");
				String oriName = request.getParameter("oriname");

				File target = new File(filePath + "/" + sysName);

				byte[] fileContents = new byte[(int) target.length()];
				oriName=new String(oriName.getBytes("utf8"),"ISO-8859-1");
				response.setHeader("content-Disposition", "attachment;filename=\"" + oriName + "\"");

				try (ServletOutputStream sos = response.getOutputStream();
					FileInputStream fis = new FileInputStream(target);
					DataInputStream dis = new DataInputStream(fis);) {
					dis.readFully(fileContents);
					sos.write(fileContents);
					sos.flush();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
