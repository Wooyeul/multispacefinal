package main.vo;

public class UserVO {
	   public String getUser_id() {
	      return user_id;
	   }
	   public void setUser_id(String user_id) {
	      this.user_id = user_id;
	   }
	   public String getSSN1() {
	      return SSN1;
	   }
	   public void setSSN1(String SSN1) {
	      this.SSN1 = SSN1;
	   }
	   public String getSSN2() {
	      return SSN2;
	   }
	   public void setSSN2(String SSN2) {
	      this.SSN2 = SSN2;
	   }
	   public String getPasswd() {
	      return passwd;
	   }
	   public void setPasswd(String passwd) {
	      this.passwd = passwd;
	   }
	   public String getUser_name() {
	      return user_name;
	   }
	   public void setUser_name(String user_name) {
	      this.user_name = user_name;
	   }
	   public String getGender() {
	      return gender;
	   }
	   public void setGender(String gender) {
	      this.gender = gender;
	   }
	   public String getPhone() {
	      return phone;
	   }
	   public void setPhone(String phone) {
	      this.phone = phone;
	   }
	   public String getNickname() {
	      return nickname;
	   }
	   public void setNickname(String nickname) {
	      this.nickname = nickname;
	   }
	   public String getZipcode() {
	      return zipcode;
	   }
	   public void setZipcode(String zipcode) {
	      this.zipcode = zipcode;
	   }
	   public String getEmail() {
	      return email;
	   }
	   public void setEmail(String email) {
	      this.email = email;
	   }
	   public Integer getGrade() {
	      return grade;
	   }
	   public void setGrade(Integer grade) {
	      this.grade = grade;
	   }
	   

	   
	   
	   public UserVO(String user_id, String SSN1, String SSN2, String passwd, String user_name, String gender,
	         String phone, String nickname, String zipcode, String email, Integer grade) {
	      this.user_id = user_id;
	      this.SSN1 = SSN1;
	      this.SSN2 = SSN2;
	      this.passwd = passwd;
	      this.user_name = user_name;
	      this.gender = gender;
	      this.phone = phone;
	      this.nickname = nickname;
	      this.zipcode = zipcode;
	      this.email = email;
	      this.grade = grade;
	   }


	   
	   public UserVO() {
	      
	   }

	   private String user_id = null;
	   private String SSN1 = null;
	   private String SSN2 = null;
	   private String passwd = null;
	   private String user_name = null;
	   private String gender = null;
	   private String phone = null;
	   private String nickname = null;
	   private String zipcode = null;
	   private String email = null;
	   private Integer grade = null;
	}
