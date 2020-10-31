package javaBeans;

import java.io.Serializable;

public class Loai implements Serializable{
	private int id;
	private String tenLoai;
	public Loai() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTenLoai() {
		return tenLoai;
	}
	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}
}
