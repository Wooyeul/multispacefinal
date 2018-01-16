package multi.club.test;

import static org.junit.Assert.*;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.junit.BeforeClass;
import org.junit.Test;

public class test {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test(timeout=2000)
	public void test_list() throws Exception {
		URL rl = new URL("http://localhost:8088/msspace_01/club_list.do");
		HttpURLConnection ucon = (HttpURLConnection)rl.openConnection();
		ucon.connect();
		
		int code = ucon.getResponseCode();
		assertTrue(code==200);
		byte[] buf = new byte[8*1024];
		int len = 0;
		int total = 0;
		InputStream in = ucon.getInputStream();
		while((len=in.read(buf))!=-1){
			total += len;
		}//end while
		in.close();
		
		assertTrue(total>0);
		
	}
	@Test(timeout=2000)
	public void test_add2() throws Exception {
		URL rl = new URL("http://localhost:8088/msspace_01/club_add_community_notice_submit.do"+
				"?club_no=221&user_id=sh&c_notice_content=JUnit_test&c_notice_title=test");
		HttpURLConnection ucon = (HttpURLConnection)rl.openConnection();
		ucon.connect();
		
		int code = ucon.getResponseCode();
		assertTrue(code==200);
		
		byte[] buf = new byte[8*1024];
		int len = 0;
		int total = 0;
		
		InputStream in = ucon.getInputStream();
		while((len=in.read(buf))!=-1){
			total += len;
		}//end while
		in.close();
		
		assertTrue(total>0);
	}
}
