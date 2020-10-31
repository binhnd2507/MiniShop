package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogics.BinhChonBL;
import businessLogics.LoaiBL;
import businessLogics.SanPhamBL;
import businessLogics.ThuongHieuBL;
import javaBeans.BinhChon;
import javaBeans.Loai;
import javaBeans.SanPham;
import javaBeans.ThuongHieu;

/**
 * Servlet implementation class DanhGiaServlet
 */
@WebServlet("/DanhGiaServlet")
public class DanhGiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhGiaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		int idsp = Integer.parseInt(request.getParameter("idsp"));
		
		SanPham ctsp = SanPhamBL.docTheoIdSanPham(idsp);
		List<SanPham> dssplq = SanPhamBL.docTheoIdThuongHieu(ctsp.getIdThuongHieu());
		Loai loai = LoaiBL.docTheoIdLoai(ctsp.getIdLoai());
		ThuongHieu thuongHieu = ThuongHieuBL.docTheoIdThuongHieu(ctsp.getIdThuongHieu());
		
		request.setAttribute("ctsp", ctsp);
		request.setAttribute("dssplq", dssplq);
		request.setAttribute("loai", loai);
		request.setAttribute("thuongHieu", thuongHieu);
		
		request.getRequestDispatcher("trang-chi-tiet-san-pham.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset = UTF-8");
		
		String ten, email, danhGia;
		int diem, idsp;
		
		ten = request.getParameter("name");
		email = request.getParameter("email");
		danhGia = request.getParameter("danhGia");
		diem = Integer.parseInt(request.getParameter("cboDiem"));
		idsp = Integer.parseInt(request.getParameter("idsp"));
		
		BinhChon bc = new BinhChon();
		bc.setId(0);
		bc.setTen(ten);
		bc.setEmail(email);
		bc.setDiem(diem);
		bc.setDanhGia(danhGia);
		bc.setIdSanPham(idsp);
		
		BinhChonBL.them(bc);
		
		doGet(request, response);
	}
}
