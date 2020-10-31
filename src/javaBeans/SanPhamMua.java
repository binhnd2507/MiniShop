package javaBeans;

public class SanPhamMua extends SanPham {

	private int soLuongMua;

	public SanPhamMua() {
		super();
	}

	public int getSoLuongMua() {
		return soLuongMua;
	}

	public void setSoLuongMua(int soLuongMua) {
		this.soLuongMua = soLuongMua;
	}
	public double thanhTien() {
		return this.getDonGiaKM() * this.soLuongMua;
	}
}
