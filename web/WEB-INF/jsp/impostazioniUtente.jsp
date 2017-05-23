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

	<link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/>"/public/ type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!DOCTYPE html>
	<!-- Document Title
	============================================= -->
	<title>Impostazioni</title>

</head>

<body class="stretched">
    <%
        if ((session.getAttribute("userinfo") == null) || (session.getAttribute("userinfo") == "")) {
    %>
    <div>Non puoi accedere a questa pagina</div>
    <% }else{
    %>

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
             <a href="#"><img src="<c:url value="/resources/img/logoG.png"/>" width="140px" height="100px"></a>
        </div>

        <div class="panel panel-default divcenter noradius noborder" style="max-width: 800px;">
          <div class="panel-body" style="padding: 40px;">
              <form id="login-form" name="login-form" class="nobottommargin" action="<c:url value="/impostazioniUtente"/>" method="post">
              <h3>Modifica impostaioni account</h3>

              <div class="col_one_fourth">
                <label for="login-form-nome">Nome:</label>
                <input type="text" id="login-form-nome" name="nome" value="${userinfo.nome}" class="form-control not-dark" />
              </div>
              
              <div class="col_one_fourth">
                <label for="login-form-nome">Cognome:</label>
                <input type="text" id="login-form-cognome" name="cognome" value="${userinfo.cognome}" class="form-control not-dark" />
              </div>
              <div class="col_one_fourth">
                <label for="login-form-mail">eMail:</label>
                <input type="text" id="login-form-mail" name="mail" value="${userinfo.email}" class="form-control not-dark" />
              </div>
              
              <div class="col_one_fourth col_last">
                <label for="login-form-provincia">Provincia:</label>
                <input type="text" id="login-form-provincia" name="provincia" value="${userinfo.provincia}" class="form-control not-dark" />
              </div>
              
              <div class="col_half">
                <label for="login-form-password">Password:</label>
                <input type="password" id="login-form-password" name="password" value="${userinfo.password}" class="form-control not-dark" />
              </div>
              
              <div class="col_half col_last">
                <label for="login-form-repassword">RE-Password:</label>
                <input type="password" id="login-form-repassword" name="repassword" value="${userinfo.password}" class="form-control not-dark" />
              </div>
              
              <div class="col_full">
                  <label for="immagine">Immagine(link):</label>
                  <input type="text" id="login-form-immagine" name="immagine" value="${userinfo.immagine}" class="form-control not-dark"/>
              </div>
              <div class="col_two_fourth">
              <div class="col_one_fourth nobottommargin center ">
                <button class="button button-circle" id="register-form-submit" name="register-form-submit" value="impostazioni">Salva</button>
              </div>
              <div class="col_one_fourth col_last">
                <a href="<c:url value="/profile"/>" class="button button-circle  btn-danger">Annulla</a>
              </div>
              </div>
            </form>

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
<%}%>
</body>
</html>