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
 * Servlet implementation class XoaSanPhamTrongGioServlet
 */
@WebServlet("/XoaSanPhamTrongGioServlet")
public class XoaSanPhamTrongGioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XoaSanPhamTrongGioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		int idsp = Integer.parseInt(request.getParameter("idsp"));
		
		HttpSession session = request.getSession();
		GioHang gioHang = (GioHang) session.getAttribute("gioHang");
		
		if(gioHang != null) {
			gioHang.xoa(idsp);
			session.setAttribute("gioHang", gioHang);
		}
		
		Locale lc = new Locale("vi", "VN");
		NumberFormat nf =  NumberFormat.getInstance(lc);
		
		String tongTien = nf.format(gioHang.tongTien());
		int soMatHang = gioHang.soMatHang();
		
		response.getWriter().print(idsp + ", "+ tongTien + ", "+ soMatHang);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
