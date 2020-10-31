package businessLogics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBeans.Loai;

public class LoaiBL {
	private static Connection ketNoi = CSDL.getKetNoi();
	private static List<Loai> taoDanhSach(String sql){
		List<Loai> ds = new ArrayList<Loai>();
		try {
			Statement stm = ketNoi.createStatement();
			ResultSet rs = stm.executeQuery(sql);
			while(rs.next()) {
				Loai l = new Loai();
				l.setId(rs.getInt("id"));
				l.setTenLoai(rs.getString("tenloai"));
				ds.add(l);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ds;
	}
	public static List<Loai> docTatCa(){
		String sql = "select * from loai";
		return taoDanhSach(sql);
	}
	public static Loai docTheoIdLoai(int idLoai) {
		Loai l = null;
		String sql = "select * from loai where id = "+idLoai;
		List<Loai> ds = taoDanhSach(sql);
		if(ds.size() > 0) {
			l = ds.get(0);
		}
		return l;
	}
	
}
