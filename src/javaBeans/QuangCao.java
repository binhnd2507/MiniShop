package javaBeans;

import java.io.Serializable;
import java.sql.Date;

public class QuangCao implements Serializable{

	private int id;
	private String hinhAnh;
	private String thongDiep;
	private String thongTinCT;
	private Date ngayDang;
	public QuangCao() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getHinhAnh() {
		return hinhAnh;
	}
	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}
	public String getThongDiep() {
		return thongDiep;
	}
	public void setThongDiep(String thongDiep) {
		this.thongDiep = thongDiep;
	}
	public String getThongTinCT() {
		return thongTinCT;
	}
	public void setThongTinCT(String thongTinCT) {
		this.thongTinCT = thongTinCT;
	}
	public Date getNgayDang() {
		return ngayDang;
	}
	public void setNgayDang(Date ngayDang) {
		this.ngayDang = ngayDang;
	}
}
