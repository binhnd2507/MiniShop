package businessLogics;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import javaBeans.DonHang;

public class DonHangBL {

	public static int them(DonHang dh) {
		int kq = 0;
		String sql = "insert into donhang (id, id_khachhang, ngaydathang, tennguoinhanhang, dienthoainguoinhan, diachigiaohang, ghichu, thanhtoan, id_trangthai) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection ketNoi = CSDL.getKetNoi()){
			PreparedStatement pst = ketNoi.prepareStatement(sql);
			pst.setInt(1, dh.getId());
			pst.setInt(2, dh.getIdKhachHang());
			pst.setDate(3, dh.getNgayDatHang());
			pst.setString(4, dh.getTenNguoiNhanHang());
			pst.setString(5, dh.getDienThoaiNguoiNhan());
			pst.setString(6, dh.getDiaChiGiaoHang());
			pst.setString(7, dh.getGhiChu());
			pst.setBoolean(8, dh.isThanhToan());
			pst.setInt(9, dh.getIdTrangThai());
			kq = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
	public static void main(String[] args) {
		DonHang dh = new DonHang();
		dh.setId(0);
		dh.setIdKhachHang(5);
		dh.setNgayDatHang(new Date(new java.util.Date().getTime()));
		dh.setTenNguoiNhanHang("Nguyễn Ngọc Thanh");
		dh.setDienThoaiNguoiNhan("11111");
		dh.setDiaChiGiaoHang("119b");
		dh.setGhiChu("abc");
		dh.setThanhToan(false);
		dh.setIdTrangThai(1);
	}
}
