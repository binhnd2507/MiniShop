package controllers;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import businessLogics.GioHang;

/**
 * Servlet implementation class ThemVaoGioServlet
 */
@WebServlet("/ThemVaoGioServlet")
public class ThemVaoGioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemVaoGioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int idsp, slm, soMatHang;
		String tongTien;
		
		idsp = Integer.parseInt(request.getParameter("idsp"));
		slm = Integer.parseInt(request.getParameter("slm"));
		
		HttpSession session = request.getSession();
		GioHang gioHang = (GioHang) session.getAttribute("gioHang");
		
		if(gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("gioHang", gioHang);
		}
		
		gioHang.them(idsp, slm);
		
//		if(request.getParameter("trangChon") != null) {
//			if(request.getParameter("trangChon").equals("trangChu")) {
//				response.sendRedirect("trang-chu.jsp#"+idsp);
//			}
//			else if(request.getParameter("trangChon").equals("cuaHang")){
//				response.sendRedirect("trang-cua-hang.jsp#"+idsp);
//			}
//			else if(request.getParameter("trangChon").equals("sanPham")){
//				response.sendRedirect("trang-san-pham.jsp#"+idsp);
//			}
//		}
		
		Locale lc = new Locale("vi", "VN");
		NumberFormat nf = NumberFormat.getInstance(lc);
		
		tongTien = nf.format(gioHang.tongTien());
		soMatHang = gioHang.soMatHang();
		
		response.getWriter().print(tongTien+" đ,"+soMatHang);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idsp, slm;
		
		idsp = Integer.parseInt(request.getParameter("idsp"));
		slm = Integer.parseInt(request.getParameter("slm"));
		
		HttpSession session = request.getSession();
		GioHang gioHang = (GioHang) session.getAttribute("gioHang");
		
		if(gioHang == null) {
			gioHang = new GioHang();
			session.setAttribute("gioHang", gioHang);
		}
		
		gioHang.them(idsp, slm);
		
		response.sendRedirect("trang-gio-hang.jsp");
	}

}
