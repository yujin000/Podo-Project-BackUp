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
				request.getRequestDispatcher("/admin/adminMembership.jsp").forward(request, response);
			}else if(uri.equals("/update.goods")) {
				String payGoodsName = request.getParameter("payGoodsName");
				int payGoodsPrice = Integer.parseInt(request.getParameter("payGoodsPrice"));
				String payGoodsExp = request.getParameter("payGoodsExp");
				String payGoodsType = request.getParameter("payGoodsType");
				String payGoodsInfo = request.getParameter("payGoodsInfo");
				int payGoodsSeq = Integer.parseInt(request.getParameter("payGoodsSeq"));
				PayGoodsDAO dao = PayGoodsDAO.getInstance();
				dao.update(payGoodsName, payGoodsPrice, payGoodsExp, payGoodsType, payGoodsInfo, payGoodsSeq);
				response.sendRedirect("/goodsList.goods");
			}else if(uri.equals("/delete.goods")) {
				int seq = Integer.parseInt(request.getParameter("seq"));
				PayGoodsDAO dao = PayGoodsDAO.getInstance();
				dao.delete(seq);
				response.sendRedirect("/goodsList.goods");
			}else if(uri.equals("/addProducts.goods")) {
				String payGoodsName = request.getParameter("payGoodsName");
				int payGoodsPrice = Integer.parseInt(request.getParameter("payGoodsPrice"));
				String payGoodsExp = request.getParameter("payGoodsExp");
				String payGoodsType = request.getParameter("payGoodsType");
				String payGoodsInfo = request.getParameter("payGoodsInfo");
				PayGoodsDAO dao = PayGoodsDAO.getInstance();
				PayGoodsDTO dto = new PayGoodsDTO(0,payGoodsName,payGoodsPrice,payGoodsExp,payGoodsType,payGoodsInfo);
				dao.addProducts(dto);
				response.sendRedirect("/goodsList.goods");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
