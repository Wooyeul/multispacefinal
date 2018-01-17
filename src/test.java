import static org.junit.Assert.*;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.BeforeClass;
import org.junit.Test;

public class test {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test(timeout=2000)
	public void test_add2() throws Exception {
		URL rl = new URL("http://70.12.113.223:8088/msspace_01/add_space_qna.do?add_space_qna_no=500&user_id='asdf'");
		HttpURLConnection ucon = (HttpURLConnection)rl.openConnection();
		ucon.connect();
		
		int  code = ucon.getResponseCode();
		assertTrue(code==200);
		
		byte[] buf = new byte[8*1024];
		int len=0;
		int total=0;
		InputStream in = ucon.getInputStream();
		while((len=in.read(buf))!=-1){
			total+=len;
		}
		in.close();
		assertTrue(total>0);
	}

}
