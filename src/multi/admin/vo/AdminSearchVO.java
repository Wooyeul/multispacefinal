package multi.admin.vo;

public class AdminSearchVO 
{
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public AdminSearchVO(String option, String content) {
		this.option = option;
		this.content = content;
	}

	private String option = null;
	private String content = null;
}
