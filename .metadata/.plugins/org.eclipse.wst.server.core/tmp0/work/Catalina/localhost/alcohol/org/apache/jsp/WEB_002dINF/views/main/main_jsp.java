/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.71
 * Generated at: 2023-05-04 00:15:15 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class main_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/embedded_yh/embedded_yh_jsp_spring/work2/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/SpringWebAlcoholProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1683099097994L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("    <meta charset=\"utf-8\">\r\n");
      out.write("    <meta content=\"width=device-width, initial-scale=1.0\" name=\"viewport\">\r\n");
      out.write("\r\n");
      out.write("    <title>Main</title>\r\n");
      out.write("    <meta content=\"\" name=\"description\">\r\n");
      out.write("    <meta content=\"\" name=\"keywords\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Favicons -->\r\n");
      out.write("    <link href=\"#\" rel=\"icon\">\r\n");
      out.write("    <link href=\"#\" rel=\"apple-touch-icon\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Google Fonts -->\r\n");
      out.write("    <link href=\"https://fonts.gstatic.com\" rel=\"preconnect\">\r\n");
      out.write("    <link href=\"https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i\"\r\n");
      out.write("          rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("    <!-- Vendor CSS Files -->\r\n");
      out.write("\r\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css\" rel=\"stylesheet\"\r\n");
      out.write("          integrity=\"sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ\" crossorigin=\"anonymous\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css\"\r\n");
      out.write("          rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("    <!-- Template Main CSS File -->\r\n");
      out.write("    <link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/css/main_css/main.css\" rel=\"stylesheet\">\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!-- ======= Header ======= -->\r\n");
      out.write("<header id=\"header\" class=\"header d-flex align-items-center\">\r\n");
      out.write("\r\n");
      out.write("    <div class=\"container-fluid container-xl d-flex align-items-center justify-content-between\">\r\n");
      out.write("        <a href=\"main.do\" class=\"logo d-flex align-items-center\">\r\n");
      out.write("            <!-- Uncomment the line below if you also wish to use an image logo -->\r\n");
      out.write("            <!-- <img src=\"assets/img/logo.png\" alt=\"\"> -->\r\n");
      out.write("            <h1>주당들<span>.</span></h1>\r\n");
      out.write("        </a>\r\n");
      out.write("\r\n");
      out.write("        <nav id=\"navbar\" class=\"navbar\">\r\n");
      out.write("            <ul>\r\n");
      out.write("                <li><a href=\"main.do\">Home</a></li>\r\n");
      out.write("                <li class=\"nav-item dropdown\"><a href=\"#\"><span>상품보기</span></a>\r\n");
      out.write("                    <ul class=\"dropdown dropdown-menu-arrow profile\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <a href=\"fullview.do\" class=\"dropdown-item\"><span>전체상품</span>\r\n");
      out.write("                            </a></li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <hr class=\"dropdown-divider\">\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li><a href=\"#\">베스트</a></li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <hr class=\"dropdown-divider\">\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li><a href=\"#\">신상품</a></li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                    ");
      out.write("\r\n");
      out.write("                <li><a href=\"#\">담화배송</a></li>\r\n");
      out.write("                <li><a href=\"#\">이벤트</a></li>\r\n");
      out.write("                <li><a href=\"#\">구독</a></li>\r\n");
      out.write("                <li><a href=\"#\">Contact</a></li>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("                ");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\r\n");
      out.write("                <li class=\"nav-item dropdown\">\r\n");
      out.write("                    ");
      if (_jspx_meth_c_005fif_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("                </li><!-- End Profile Nav -->\r\n");
      out.write("            </ul>\r\n");
      out.write("        </nav><!-- .navbar -->\r\n");
      out.write("\r\n");
      out.write("        <i class=\"mobile-nav-toggle mobile-nav-show bi bi-list\"></i>\r\n");
      out.write("        <i class=\"mobile-nav-toggle mobile-nav-hide d-none bi bi-x\"></i>\r\n");
      out.write("\r\n");
      out.write("    </div>\r\n");
      out.write("</header><!-- End Header -->\r\n");
      out.write("<!-- End Header -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<main id=\"main\" class=\"main\">\r\n");
      out.write("    <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("            <div class=\"col-2\">\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-8 d-flex justify-content-center\">\r\n");
      out.write("                <img class=\"img-fluid\" src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/upload/main_img.jpg\">\r\n");
      out.write("            </div>\r\n");
      out.write("            <div class=\"col-2\">\r\n");
      out.write("\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("</main><!-- End #main -->\r\n");
      out.write("\r\n");
      out.write("<!-- ======= Footer ======= -->\r\n");
      out.write("<footer id=\"footer\" class=\"footer\">\r\n");
      out.write("    <div class=\"copyright\">\r\n");
      out.write("        &copy; Copyright <strong><span>GoodCheese by NiceAdmin.</span></strong>. All Rights Reserved\r\n");
      out.write("    </div>\r\n");
      out.write("    <div class=\"credits\">\r\n");
      out.write("        <!-- All the links in the footer should remain intact. -->\r\n");
      out.write("        <!-- You can delete the links only if you purchased the pro version. -->\r\n");
      out.write("        <!-- Licensing information: https://bootstrapmade.com/license/ -->\r\n");
      out.write("        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->\r\n");
      out.write("        Designed by <a href=\"https://bootstrapmade.com/\">BootstrapMade</a>\r\n");
      out.write("    </div>\r\n");
      out.write("</footer><!-- End Footer -->\r\n");
      out.write("\r\n");
      out.write("<a href=\"#\" class=\"back-to-top d-flex align-items-center justify-content-center\"><i\r\n");
      out.write("        class=\"bi bi-arrow-up-short\"></i></a>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script src=\"https://code.jquery.com/jquery-3.6.4.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/register/mainjs.js\"></script>\r\n");
      out.write("<!-- Vendor JS Files -->\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js\"\r\n");
      out.write("        integrity=\"sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4\"\r\n");
      out.write("        crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/resources/js/main_js/main.js\"></script>\r\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/main/main.jsp(36,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${isUser1 ne null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("    <!-- Button trigger modal -->\r\n");
          out.write("    <button type=\"hidden\" id=\"modalBtn\" class=\"btn btn-primary\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">\r\n");
          out.write("        Launch demo modal\r\n");
          out.write("    </button>\r\n");
          out.write("\r\n");
          out.write("    <!-- Modal -->\r\n");
          out.write("    <div class=\"modal fade\" id=\"exampleModal\" tabindex=\"-1\" aria-labelledby=\"exampleModalLabel\" aria-hidden=\"true\">\r\n");
          out.write("        <div class=\"modal-dialog\">\r\n");
          out.write("            <div class=\"modal-content\">\r\n");
          out.write("                <div class=\"modal-header\">\r\n");
          out.write("                    <h5 class=\"modal-title\" id=\"exampleModalLabel\">로그인 정보 확인</h5>\r\n");
          out.write("                    <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"modal\" aria-label=\"Close\"></button>\r\n");
          out.write("                </div>\r\n");
          out.write("                <div class=\"modal-body\">\r\n");
          out.write("                    로그인 중입니다.\r\n");
          out.write("                </div>\r\n");
          out.write("                <div class=\"modal-footer\">\r\n");
          out.write("                    <button type=\"button\" class=\"btn btn-secondary\" data-bs-dismiss=\"modal\">Close</button>\r\n");
          out.write("                </div>\r\n");
          out.write("            </div>\r\n");
          out.write("        </div>\r\n");
          out.write("    </div>\r\n");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f1_reused = false;
    try {
      _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f1.setParent(null);
      // /WEB-INF/views/main/main.jsp(97,16) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user1 eq null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
      if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                    <li>\r\n");
          out.write("                        <a href=\"login.do\">\r\n");
          out.write("                            로그인 해주세요.\r\n");
          out.write("                        </a>\r\n");
          out.write("                    </li>\r\n");
          out.write("                ");
          int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      _jspx_th_c_005fif_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f1_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f2 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f2_reused = false;
    try {
      _jspx_th_c_005fif_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f2.setParent(null);
      // /WEB-INF/views/main/main.jsp(106,20) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f2.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user1 ne null}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f2 = _jspx_th_c_005fif_005f2.doStartTag();
      if (_jspx_eval_c_005fif_005f2 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("                        <a class=\"nav-link nav-profile d-flex align-items-center pe-0 text-decoration-none\" href=\"#\"\r\n");
          out.write("                           data-bs-toggle=\"dropdown\">\r\n");
          out.write("                            <span class=\"d-none d-md-block dropdown-toggle ps-2\">");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${user1.user1_name}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("</span>\r\n");
          out.write("                        </a>\r\n");
          out.write("\r\n");
          out.write("                        ");
          out.write("\r\n");
          out.write("                        <!-- End Profile Iamge Icon -->\r\n");
          out.write("\r\n");
          out.write("                        <ul class=\"dropdown-menu dropdown-menu-arrow profile\">\r\n");
          out.write("                            <li>\r\n");
          out.write("                                <a class=\"dropdown-item\" href=\"#\">\r\n");
          out.write("                                    <span>My Profile</span>\r\n");
          out.write("                                </a>\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li>\r\n");
          out.write("                                <hr class=\"dropdown-divider\">\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li>\r\n");
          out.write("                                <a class=\"dropdown-item d-flex align-items-center\" href=\"#\">\r\n");
          out.write("                                    <span>Account Settings</span>\r\n");
          out.write("                                </a>\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li>\r\n");
          out.write("                                <hr class=\"dropdown-divider\">\r\n");
          out.write("                            </li>\r\n");
          out.write("                            <li>\r\n");
          out.write("                                <a class=\"dropdown-item d-flex align-items-center\" href=\"logout.do\">\r\n");
          out.write("                                    <span>Sign Out</span>\r\n");
          out.write("                                </a>\r\n");
          out.write("                            </li>\r\n");
          out.write("\r\n");
          out.write("                        </ul>\r\n");
          out.write("                        <!-- End Profile Dropdown Items -->\r\n");
          out.write("                    ");
          int evalDoAfterBody = _jspx_th_c_005fif_005f2.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f2);
      _jspx_th_c_005fif_005f2_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f2, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f2_reused);
    }
    return false;
  }
}
