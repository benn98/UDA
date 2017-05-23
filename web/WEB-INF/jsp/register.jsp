<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html dir="ltr" lang="en-US">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/style.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/swiper.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/dark.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/font-icons.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/animate.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/magnific-popup.css"/>" type="text/css" />

	<link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/>"type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!DOCTYPE html>
	<!-- Document Title
	============================================= -->
	<title>Registrazione</title>

</head>

<body class="stretched">

  <!-- Document Wrapper
  ============================================= -->
  <div id="wrapper" class="clearfix">

<!-- Content
============================================= -->
<section id="content">

  <div class="content-wrap nopadding">

      <div class="section nopadding nomargin" style="width: 100%; height: 100%; position: absolute; left: 0; top: 0; background:url('<c:url value="/resources/img/register.jpg"/>'); background-size:cover;"></div>

    <div class="section nobg full-screen nopadding nomargin">
      <div class="container vertical-middle divcenter clearfix">

        <div class="row center">
            <a href="<c:url value="/"/>"><img src="<c:url value="/resources/img/logoG.png"/>" width="140px" height="100px"></a>
        </div>

        <div class="panel panel-default divcenter noradius noborder" style="max-width: 600px;">
          <div class="panel-body" style="padding: 40px;">
              <form id="login-form" name="login-form" class="nobottommargin" action="<c:url value="/register"/>" method="post">
              <h3>Registrazione</h3>

              <div class="col_one_third">
                <label for="login-form-username">Username:</label>
                <input type="text" id="login-form-username" name="username" value="" class="form-control not-dark" />
              </div>

              <div class="col_one_third">
                <label for="login-form-nome">Nome:</label>
                <input type="text" id="login-form-nome" name="nome" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_one_third col_last">
                <label for="login-form-nome">Cognome:</label>
                <input type="text" id="login-form-cognome" name="cognome" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_half">
                <label for="login-form-password">Password:</label>
                <input type="password" id="login-form-password" name="password" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_half col_last">
                <label for="login-form-repassword">RE-Password:</label>
                <input type="password" id="login-form-repassword" name="repassword" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_two_third">
                <label for="login-form-mail">eMail:</label>
                <input type="text" id="login-form-mail" name="mail" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_one_third col_last">
                <label for="login-form-provincia">Provincia:</label>
                <input type="text" id="login-form-provincia" name="provincia" value="" class="form-control not-dark" />
              </div>
              
              <div class="col_full nobottommargin">
                <button class="button button-circle nomargin" id="register-form-submit" name="register-form-submit" value="login">Registrati</button>
              </div>
            </form>
            <%if((session.getAttribute("failPsw")=="" )|| (session.getAttribute("failPsw")==null)){%>
                  <%}else{%>
                  <div class="style-msg errormsg">
                      <div class="sb-msg"><i class="icon-remove"></i><strong>Errore!</strong>Le password non corrispondono</div>
                  </div>
                  <%session.setAttribute("failPsw", null);%>
                  <%}%>
            <%if((session.getAttribute("fail")=="" )|| (session.getAttribute("fail")==null)){%>
                  <%}else{%>
                  <div class="style-msg errormsg">
                        <div class="sb-msg"><i class="icon-remove"></i><strong>Ops Qualcosa è andato storto!</strong>Modifica i valori inseriti</div>
                  </div>
                  <%session.setAttribute("fail", null);%>
                  <%}%>
          </div>
        </div>
      </div>
    </div>

        </section><!-- #content end -->

      </div><!-- #wrapper end -->
<!-- Copyrights
============================================= -->
<footer id="footer" class="dark">
            <div class="container clearfix center">
                </br></br>
            <div id="copyrights dark">
                <div class="container clearfix">
                    <div class="col_full">
                        Copyrights &copy; 2017 All Rights Reserved.
                    </div>    
                </div>
            </div><!-- #copyrights end -->
        </footer><!-- #footer end -->

</div><!-- #wrapper end -->
<!-- External JavaScripts
============================================= -->
<script type="text/javascript" src="<c:url value="/resources/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/plugins.js"/>"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value="/resources/js/functions.js"/>"></script>

</body>
</html>