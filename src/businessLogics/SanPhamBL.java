package businessLogics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBeans.SanPham;

public class SanPhamBL {

	private static List<SanPham> taoDanhSach(String sql){
		List<SanPham> dssp = new ArrayList<SanPham>();
		try (Connection ketNoi = CSDL.getKetNoi()){
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setId(rs.getInt("id"));
				sp.setTenSanPham(rs.getString("tensanpham"));
				sp.setMoTa(rs.getString("mota"));
				sp.setHinhAnh(rs.getString("hinhanh"));
				sp.setDonGia(rs.getDouble("dongia"));
				sp.setDonGiaKM(rs.getDouble("dongiaKM"));
				sp.setSoLuong(rs.getInt("soluong"));
				sp.setNgayTao(rs.getDate("ngaytao"));
				sp.setHienThi(rs.getInt("hienthi"));
				sp.setIdLoai(rs.getInt("id_loai"));
				sp.setIdThuongHieu(rs.getInt("id_thuonghieu"));
				dssp.add(sp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dssp;
	}
	
	public static List<SanPham> docTheoDanhSachSPMoi(int top){
		String sql = "select * from sanpham order by ngaytao desc limit 0,"+top;
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> banChayNhat(int top){
		String sql = "SELECT sp.*, sum(ct.soluong) AS tong from sanpham sp "
				+ "INNER JOIN chitietdonhang ct ON sp.id = ct.id_sanpham "
				+ "GROUP BY ct.id_sanpham ORDER BY tong DESC LIMIT 0,"+top;
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> docToanBoSanPhamBanChay(){
		String sql = "SELECT sp.*, SUM(ct.soluong) AS tong FROM sanpham sp "
				+ "INNER JOIN chitietdonhang ct ON ct.id_sanpham = sp.id "
				+ "GROUP BY ct.id_sanpham ORDER BY tong DESC";
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> giamGiaNhieuNhat(int top){
		String sql = "SELECT sp.*, MAX(sp.dongia-sp.dongiaKM) AS ggn from sanpham sp "
				+ "GROUP BY sp.id ORDER BY ggn DESC LIMIT 0,"+top;
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> docToanBoSanPhamGiamGia(){
		String sql = "SELECT sp.*, MAX(sp.dongia-sp.dongiaKM) AS ggn from sanpham sp "
				+ "GROUP BY sp.id ORDER BY ggn DESC";
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> yeuThichNhat(int top){
		String sql = "SELECT sp.*, MAX(bc.diem) AS ytn from sanpham sp "
				+ "INNER JOIN binhchon bc ON bc.id_sanpham = sp.id "
				+ "GROUP BY sp.id ORDER BY ytn DESC LIMIT 0,"+top;
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> docToanBoSanPhamYeuThichNhat(){
		String sql = "SELECT sp.*, MAX(bc.diem) AS ytn from sanpham sp "
				+ "INNER JOIN binhchon bc ON bc.id_sanpham = sp.id "
				+ "GROUP BY sp.id ORDER BY ytn DESC";
		return taoDanhSach(sql);
	}
	
	public static SanPham docTheoIdSanPham(int idsp) {
		SanPham sp = null;
		String sql = "select * from sanpham where id = "+idsp;
		List<SanPham> dssp = taoDanhSach(sql);
		if(dssp.size() > 0) {
			sp = dssp.get(0);
		}
		return sp;
	}
	
	public static List<SanPham> docTheoTenSanPham(String tenSanPham) {
		String sql = "select * from sanpham where tensanpham like '%"+tenSanPham+"%'";
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> docTheoIdThuongHieu(int idThuongHieu){
		String sql = "select * from sanpham where id_thuonghieu = "+idThuongHieu;
		return taoDanhSach(sql);
	}
	
	public static List<SanPham> docThemIdLoai(int idLoai){
		String sql = "select * from sanpham where id_loai = "+idLoai;
		return taoDanhSach(sql);
	}
	
	public static int tongSoSanPham() {
		String sql = "select count(*) as tssp from sanpham";
		int tssp = 0;
		try (Connection ketNoi = CSDL.getKetNoi()){
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if(rs.next()) {
				tssp = rs.getInt("tssp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tssp;
	}
	
	public static List<SanPham> sanPhamTheoTrang(int vtDau, int soSanPhamMoiTrang){
		String sql = "select * from sanpham limit "+ vtDau + ", "+soSanPhamMoiTrang;
		return taoDanhSach(sql);
	}
	
}
