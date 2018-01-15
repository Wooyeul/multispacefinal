package main.vo;

public class ZipcodeVO {
	private String user_id;
	private String zonecode;
	private String address;
	private String jibunAddress;
	private String detail;

	public ZipcodeVO() {
	}

	public ZipcodeVO(String user_id, String zonecode, String address, String jibunAddress, String detail) {
		super();
		this.user_id = user_id;
		this.zonecode = zonecode;
		this.address = address;
		this.jibunAddress = jibunAddress;
		this.detail = detail;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getJibunAddress() {
		return jibunAddress;
	}

	public void setJibunAddress(String jibunAddress) {
		this.jibunAddress = jibunAddress;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

}
