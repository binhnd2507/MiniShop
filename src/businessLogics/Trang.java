package businessLogics;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javaBeans.SanPham;

public class Trang {

	public static int timVtDau(int soSanPhamMoiTrang, int trang) {
		int vtDau = 0;
		if (trang > 1) {
			vtDau = (trang - 1) * soSanPhamMoiTrang;
		}
		return vtDau;
	}

	public static int tongSoTrang(int tongSoSanPham, int soSanPhamMoiTrang) {
		int tongSoTrang = tongSoSanPham / soSanPhamMoiTrang + ((tongSoSanPham % soSanPhamMoiTrang) != 0 ? 1 : 0);
		return tongSoTrang;
	}
}
