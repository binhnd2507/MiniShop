package businessLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javaBeans.BinhChon;

public class BinhChonBL {
	
	public static int them(BinhChon bc) {
		int kq = 0;
		String sql = "insert into binhchon (id, ten, email, diem, danh_gia, id_sanpham) values (?, ?, ?, ?, ?, ?)";
		try (Connection ketNoi = CSDL.getKetNoi()){
			PreparedStatement pst = ketNoi.prepareStatement(sql);
			pst.setInt(1, bc.getId());
			pst.setString(2, bc.getTen());
			pst.setString(3, bc.getEmail());
			pst.setInt(4, bc.getDiem());
			pst.setString(5, bc.getDanhGia());
			pst.setInt(6, bc.getIdSanPham());
			kq = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kq;
	}
}
