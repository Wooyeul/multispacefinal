package multi.admin.vo; 
 
public class Admin_searchVO {
	public Admin_searchVO(){}

	public Admin_searchVO(String search_option, String search_content, String search_option2, String search_content2,
			Integer start_no) {
		this.search_option = search_option;
		this.search_content = search_content;
		this.search_option2 = search_option2;
		this.search_content2 = search_content2;
		this.start_no = start_no;
	}

	public String getSearch_option() {
		return search_option;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
	public String getSearch_content() {
		return search_content;
	}
	public void setSearch_content(String search_content) {
		this.search_content = search_content;
	}
	public String getSearch_option2() {
		return search_option2;
	}
	public void setSearch_option2(String search_option2) {
		this.search_option2 = search_option2;
	}
	public String getSearch_content2() {
		return search_content2;
	}
	public void setSearch_content2(String search_content2) {
		this.search_content2 = search_content2;
	}
	public Integer getStart_no() {
		return start_no;
	}
	public void setStart_no(Integer start_no) {
		this.start_no = start_no;
	}

	private String search_option = null;
	private String search_content = null;
	private String search_option2 = null;
	private String search_content2 = null;
	private Integer start_no = null;
}
