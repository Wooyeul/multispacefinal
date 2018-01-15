package multi.admin.vo; 
 
public class Admin_searchVO {
	public Admin_searchVO(){}
	public Admin_searchVO(String search_option, String search_content) {
		this.search_option = search_option;
		this.search_content = search_content;
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
	private String search_option = null;
	private String search_content = null;	
}
