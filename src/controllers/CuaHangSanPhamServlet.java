package controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import businessLogics.LoaiBL;
import businessLogics.SanPhamBL;
import businessLogics.Trang;
import javaBeans.Loai;
import javaBeans.SanPham;

/**
 * Servlet implementation class SanPhamServlet
 */
@WebServlet("/CuaHangSanPhamServlet")
public class CuaHangSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CuaHangSanPhamServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	
		int  vtDau , tongSoSanPham, tongSoTrang, trangChon = 1, viTriDau = 1, viTriCuoi = viTriDau + 2, soSanPhamMoiTrang = 8;
		
		if(request.getParameter("trang") != null) {
			trangChon = Integer.parseInt(request.getParameter("trang"));
		}
		
		vtDau = Trang.timVtDau(soSanPhamMoiTrang, trangChon);
		
		tongSoSanPham = SanPhamBL.tongSoSanPham();
		
		tongSoTrang = Trang.tongSoTrang(tongSoSanPham, soSanPhamMoiTrang);
		
		List<SanPham> dssp = SanPhamBL.sanPhamTheoTrang(vtDau, soSanPhamMoiTrang);
		
		if(tongSoTrang > 3) {
			if(trangChon == 1) {
				viTriDau = trangChon;
			}
			else {
				viTriDau = trangChon + 1 < tongSoTrang ? trangChon - 1 : tongSoTrang - 2;
			}
			viTriCuoi = viTriDau + 2;
		}
		
		request.setAttribute("dssp", dssp);
		request.setAttribute("trang", trangChon);
		request.setAttribute("tongSoTrang", tongSoTrang);
		request.setAttribute("viTriDau", viTriDau);
		request.setAttribute("viTriCuoi", viTriCuoi);
		
		request.getRequestDispatcher("views/cua-hang-ajax.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
