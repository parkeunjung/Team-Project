/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.56
 * Generated at: 2014-12-07 12:54:32 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.reviewEdit;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

public final class reviewWrite_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");


String M_name="";
String C_name="";
String content="";
String image ="";

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>reviewWrite</title>\r\n");
      out.write("\r\n");
      out.write("\t<link href=\"../css/main.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("\t<script src=\"../js/jquery-1.8.2.min.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"wrap\">\r\n");
      out.write("\t\t\t<div class=\"content\">\r\n");
      out.write("\t\t\t\t<form accept-charset=\"UTF-8\" action=\"reviewRegister.jsp\" method=\"post\" enctype=\"multipart/form-data\">\r\n");
      out.write("\t\t\t\t\t\t<legend class=\"legend\">평론가평 추가</legend><br>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"form-group \">\r\n");
      out.write("\t\t\t\t\t<label  class=\"col-sm-2 control-label\" for=\"M_name\">영화이름</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<input  type=\"text\" class=\"form-control\" placeholder=\"영화이름을 입력해주세요\" name=\"M_name\" value=\"");
      out.print(M_name);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<div class=\"form-group \">\r\n");
      out.write("\t\t\t\t\t<label  class=\"col-sm-2 control-label\" for=\"C_name\">평론가명</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"text\" class=\"form-control\" placeholder=\"평론가명을 입력해주세요\" name=\"C_name\" value=\"");
      out.print(C_name);
      out.write("\">\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t<div class=\"content_review \">\r\n");
      out.write("\t\t\t\t\t<label  class=\"col-sm-2 control-label\" for=\"content\">내  용</label>\r\n");
      out.write("\t\t\t\t\t<div class=\"col-sm-3\">\r\n");
      out.write("\t\t\t\t\t\t<textarea name=\"content\" cols=\"30\" rows=\"15\"></textarea>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<div class=\"form-group \">\r\n");
      out.write("\t\t\t\t\t포스터 불러오기 <br/>\r\n");
      out.write("\t\t\t\t\t<input type=\"file\" name=\"image\"/>\r\n");
      out.write("\t\t\t\t\t<input type=\"submit\" class=\"btn btn-default btn-primary\" value=\"등록\">\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</form>\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\t\t<a href=\"reviewList.jsp\" class=\"col-sm-offset-2 btn btn-default\">목록으로</a>\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
