package multi.admin.vo; 
 
public class Admin_searchVO {
	public Admin_searchVO(){}
	public Admin_searchVO(String search_option, String search_content, Integer start_no) {
		this.search_option = search_option;
		this.search_content = search_content;
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
	public Integer getStart_no() {
		return start_no;
	}
	public void setStart_no(Integer start_no) {
		this.start_no = start_no;
	}
	private String search_option = null;
	private String search_content = null;
	private Integer start_no = null;
}
