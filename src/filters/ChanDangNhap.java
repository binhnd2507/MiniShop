package filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javaBeans.NguoiDung;

/**
 * Servlet Filter implementation class ChanDangNhap
 */
@WebFilter("/ChanDangNhap")
public class ChanDangNhap implements Filter {

    /**
     * Default constructor. 
     */
    public ChanDangNhap() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		NguoiDung nd = (NguoiDung) session.getAttribute("nd");
		
		String uri = req.getRequestURI();
		String trangChon = uri.substring(uri.lastIndexOf("/")+1);
		
		if(trangChon.equals("trang-cua-hang.jsp") 
				|| trangChon.equals("trang-gio-hang.jsp") 
				|| trangChon.equals("trang-chi-tiet-san-pham.jsp") 
				|| trangChon.equals("trang-thanh-toan.jsp")) {
			if(nd == null) {
				res.sendRedirect("trang-chu.jsp");
				return;
			}
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
