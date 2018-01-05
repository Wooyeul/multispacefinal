package main.vo;

public class HostVO {
	public String crn;
	public String user_id;
	public String host_name;
	public String host_account;
	public String zipcode;
	
	public HostVO(){}
	
	public HostVO(String crn, String user_id, String host_name, String host_account, String zipcode) {
		super();
		this.crn = crn;
		this.user_id = user_id;
		this.host_name = host_name;
		this.host_account = host_account;
		this.zipcode = zipcode;
	}

	public String getCrn() {
		return crn;
	}
	public void setCrn(String crn) {
		this.crn = crn;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getHost_name() {
		return host_name;
	}
	public void setHost_name(String host_name) {
		this.host_name = host_name;
	}
	public String getHost_account() {
		return host_account;
	}
	public void setHost_account(String host_account) {
		this.host_account = host_account;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
}
