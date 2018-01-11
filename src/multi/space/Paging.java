package multi.space;import java.util.spi.CurrencyNameProvider;

public class Paging {
	Integer start_no;
	Integer total_space_no;
	Integer total_page_no;
	
	public Paging(){}
	
	

	public Paging(Integer start_no, Integer total_space_no, Integer total_page_no) {
		super();
		this.start_no = start_no;
		this.total_space_no = total_space_no;
		this.total_page_no = total_page_no;
	}

	public Integer getStart_no() {
		return start_no*5;
	}

	public void setStart_no(Integer start_no) {
		if(start_no==null){
			this.start_no=0;
		}else {
			this.start_no = start_no;
		}
	}

	public Integer getTotal_space_no() {
		return total_space_no;
	}

	public void setTotal_space_no(Integer total_space_no) {
		this.total_space_no = total_space_no;
	}

	public Integer getTotal_page_no() {
		return total_page_no;
	}

	public void setTotal_page_no(Integer total_page_no) {
		this.total_page_no = total_page_no;
	}
	
	
}
