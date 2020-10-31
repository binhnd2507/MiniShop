package businessLogics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBeans.QuangCao;

public class QuangCaoBL {

	public static List<QuangCao> docQuangCaoMoi(int size){
		List<QuangCao> dsqc = new ArrayList<QuangCao>();
		String sql = "select * from quangcao limit 0, "+size;
		try (Connection ketNoi = CSDL.getKetNoi()){
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				QuangCao qc = new QuangCao();
				qc.setId(rs.getInt("id"));
				qc.setHinhAnh(rs.getString("hinhanh"));
				qc.setThongDiep(rs.getString("thongdiep"));
				qc.setThongTinCT(rs.getString("thongtinchitiet"));
				qc.setNgayDang(rs.getDate("ngaydang"));
				dsqc.add(qc);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dsqc;
	}
}
