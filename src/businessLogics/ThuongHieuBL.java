package businessLogics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBeans.ThuongHieu;

public class ThuongHieuBL {

	public static List<ThuongHieu> docTatCa(){
		List<ThuongHieu> dsth = new ArrayList<ThuongHieu>();
		String sql = "select * from thuonghieu";
		try (Connection ketNoi = CSDL.getKetNoi()){
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				ThuongHieu th = new ThuongHieu();
				th.setId(rs.getInt("id"));
				th.setTenThuongHieu(rs.getString("tenthuonghieu"));
				th.setHinhAnh(rs.getString("hinhanh"));
				dsth.add(th);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dsth;
	}
	public static ThuongHieu docTheoIdThuongHieu(int idThuongHieu) {
		ThuongHieu th = null;
		String sql = "select * from thuonghieu where id = "+idThuongHieu;
		try (Connection ketNoi = CSDL.getKetNoi()){
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			if(rs.next()) {
				th = new ThuongHieu();
				th.setId(rs.getInt("id"));
				th.setTenThuongHieu(rs.getString("tenthuonghieu"));
				th.setHinhAnh(rs.getString("hinhanh"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return th;
	}
}
