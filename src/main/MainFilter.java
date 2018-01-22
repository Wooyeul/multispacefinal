package main;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, 
		FilterChain filterChain) throws IOException, ServletException 
	{
		System.out.println("doFilter");
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		
		String uri = request.getRequestURI();
		
		String ctxPath = request.getContextPath();
		uri = uri.substring( ctxPath.length() );

		
		
		System.out.println(uri);
		
		if(uri.equals("/main.do") || uri.equals("/main.html") || uri.equals("/main_html.do") || uri.equals("/home_moveLoginPage.do") 
		|| uri.equals("/home_login.do")  || uri.equals("/best_space.do") ||   uri.equals("/best_space2.do")
		||   uri.equals("/best_club.do")
		||   uri.equals("/best_community.do")||   uri.equals("/chk_login.do") ||   uri.equals("/Resources/css/bootstrap.css")||   uri.equals("/Resources/css/reset.css")
		||   uri.equals("/Resources/css/responsive.css")

				){
			// uri �� login�� �ʿ����� ���� ������ ��� �־������.
			filterChain.doFilter(arg0, arg1);
		}
		
		// ******** uri �� main_html.do �̰ų� home_moveLoginPage.do �̸� 
		// filterChain�� doFilter() �Լ��� ���� : � �������� ������ doFilter �Լ��� �����. 
		
		else{ // �α����� �ʿ��� do �� ����
			boolean hasLoginInfo = false;
			
			Cookie[] cks = request.getCookies(); //��Ű���� ������
			if( cks != null ){
				for( int i = 0 ; i < cks.length ; i++ ){
					String name = cks[i].getName(); //��Ű �̸�
					String value = cks[i].getValue(); //��Ű ��
					
					if( name.equals("user_id") ){
						hasLoginInfo = true;
						request.setAttribute("user_id", value );
						break;
					}
				}
			}
			
			if( hasLoginInfo ){
				filterChain.doFilter(arg0, arg1);
			}
			else{
			
				response.sendRedirect( ctxPath + "/home_moveLoginPage.do");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
