package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PayGoodsDAO;
import DTO.PayGoodsDTO;


@WebServlet("*.goods")
public class PayGoods extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		String uri = request.getRequestURI();
		System.out.println(uri);
		try {
			if(uri.equals("/goodsList.goods")) {
				PayGoodsDAO dao = PayGoodsDAO.getInstance();
				List<PayGoodsDTO> goodsList = dao.selectAll();
				request.setAttribute("goodsList", goodsList);
				request.getRequestDispatcher("/admin/adminMemberShip.jsp").forward(request, response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
