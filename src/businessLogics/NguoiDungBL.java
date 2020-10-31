package businessLogics;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



import javaBeans.NguoiDung;

public class NguoiDungBL {

	public static NguoiDung docTheoEmailPassword(String email, String password) {
		NguoiDung nd = null;
		String sql = "select * from nguoidung where email = ? and password = ?";
		try (Connection ketNoi = CSDL.getKetNoi()){
			PreparedStatement pst = ketNoi.prepareStatement(sql);
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				nd = new NguoiDung();
				nd.setId(rs.getInt("id"));
				nd.setEmail(rs.getString("email"));
				nd.setPassword(rs.getString("password"));
				nd.setHoTen(rs.getString("hoten"));
				nd.setDiaChi(rs.getString("diachi"));
				nd.setDienThoai(rs.getString("dtdd"));
				nd.setIdVaiTro(rs.getInt("id_vaitro"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return nd;
	}
}
