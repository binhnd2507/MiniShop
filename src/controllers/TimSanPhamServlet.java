package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogics.SanPhamBL;
import javaBeans.SanPham;

/**
 * Servlet implementation class TimSanPhamServlet
 */
@WebServlet("/TimSanPhamServlet")
public class TimSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TimSanPhamServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<SanPham> dssptk = null;
		
		String mucChon;
		
		if(request.getParameter("id") != null) {
			
			mucChon = request.getParameter("id");
			
			switch (mucChon) {
			case "banChay":
				dssptk = SanPhamBL.docToanBoSanPhamBanChay();
				break;
			case "giamGia":
				dssptk = SanPhamBL.docToanBoSanPhamGiamGia();
				break;
			case "yeuThich":
				dssptk = SanPhamBL.docToanBoSanPhamYeuThichNhat();
				break;
			default:
				int idLoai = Integer.parseInt(request.getParameter("id"));
				dssptk = SanPhamBL.docThemIdLoai(idLoai);
				break;
			}
		}
		
		request.setAttribute("dssptk", dssptk);
		request.getRequestDispatcher("trang-chi-tiet-san-pham.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String trangChon, tenSP;
		
		tenSP = request.getParameter("tenSanPham");

		List<SanPham> dssptk = SanPhamBL.docTheoTenSanPham(tenSP);

		request.setAttribute("dssptk", dssptk);
		
		if(request.getParameter("trangChon") != null) {
			
			trangChon = request.getParameter("trangChon");
			
			switch (trangChon) {
			case "sanPham":
				request.getRequestDispatcher("trang-chi-tiet-san-pham.jsp").forward(request, response);
				break;
			case "gioHang":
				request.getRequestDispatcher("trang-gio-hang.jsp").forward(request, response);
				break;
			case "thanhToan":
				request.getRequestDispatcher("trang-thanh-toan.jsp").forward(request, response);
				break;
			}
		}
	}
}
