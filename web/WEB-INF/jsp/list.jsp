<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="<c:url value="/resources/css/mdb.css"/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/css/materialdesignicons.css"/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

<!DOCTYPE html>
	<!-- Document Title
	============================================= -->
	<title>Lista ${type}</title>

</head>
<body class="stretched">
    <%
        if ((session.getAttribute("userinfo") == null) || (session.getAttribute("userinfo") == "")) {
    %>
    <div>Non puoi accedere a questa pagina</div>
    <% }else{
    %>

          <!--Header-->
        <header id="header" class="floating-header dark">
            <div id="header-wrap">
                <div class="container clearfix">
                    <div id="primary-menu-trigger"><i class="icon-reorder"></i></div>
                    <!-- Logo
                    ============================================= -->
                    <div id="logo">
                        <a href="<c:url value="/"/>" class="standard-logo" data-dark-logo="<c:url value="/resources/img/logo.png"/>"><img src="img/logo.png" alt="Canvas Logo"></a>
                        <a href="<c:url value="/"/>" class="retina-logo" data-dark-logo="<c:url value="/resources/img/logo.png"/>"><img src="img/logo.png" alt="Canvas Logo"></a>
                    </div>
                    <!-- Primary Navigation
                    ================g====================== -->
                    <nav id="primary-menu">
                        <ul>
                            <li class="navli"><a href="<c:url value="/"/>"><div>HOME</div></a></li>
                            <li class="navli"><a href="<c:url value="/eventi"/>"><div>EVENTI</div></a></li>
                            <li class="navli"><a href="<c:url value="/categorie"/>"><div>CATEGORIE</div></a></li>
                            <li class="navli"><a href="<c:url value="/artisti"/>"><div>ARTISTI</div></a></li>
                        </ul>
                        <!-- User Account
                        ============================================= -->
                         <%
                            if ((session.getAttribute("userinfo") == null) || (session.getAttribute("userinfo") == "")) {
                        %>
                        <div id="top-cart">
                            <a href="#" id="top-cart-trigger"><i class="icon-unlock-alt"></i></a>
                            <div class="top-cart-content" style="width:150px; height:130px; border-bottom-right-radius:5px; border-bottom-left-radius:5px; ">
                                <div class="top-cart-action clearfix center">
                                    <a href="<c:url value="/login"/>" class="col_full" style="margin-bottom:20px;"><button class="button button-3d button-small nomargin button-circle"><i class="mdi mdi-account-check"></i>Login</button></a>
                                    <a href="<c:url value="/register"/>" class="col_full"><button class="button button-3d button-small nomargin button-circle"><i class="mdi mdi-account-plus"></i>Register</button></a>
                                </div>
                            </div>
                            </div>
                        <%}else{%>
                        <div id="top-cart">
                            <a href="#" id="top-cart-trigger"><i class="icon-unlock-alt"></i></a>
                            <div class="top-cart-content" style="width:150px;height:220px; border-bottom-right-radius:5px; border-bottom-left-radius:5px;">
                                <div class="top-cart-action clearfix center">
                                <div class="col_full avatar" style="margin-bottom:20px;"><img src="${userinfo.immagine}"width="70px" height="70px"  style="border-radius: 50%;"></div>
                                    <a style="margin-bottom:20px;" class="col_full" href="<c:url value="/profile"/>" class="col_half"><button class="button button-small nomargin button-circle">Profilo</button></a>
                                    <a style="margin-bottom:20px;" class="col_full" href="<c:url value="/doLogout"/>" class="col_half col_last"><button class="button button-small nomargin button-circle">Logout</button></a>
                                </div>
                            </div> 
                        </div>
                        <%}%>
            

          </nav><!-- #primary-menu end -->

        </div>

      </div>
    </header>
    <section id="content">
        </br>
        </br>
        <div class="container clearfix">
                            <div class="fancy-title title-border">
                            <h3>Qui puoi gestire:${type}</h3>
                            </div>
                            <div class="container clearfix">
                                <a href="<c:url value="/aggiungi?type=${type}"/>" class="button button-circle">Aggiungi</a>
                            </div>
                            </br>
                            </br>
                            <div class="container clearfix">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">${type}</div>
                                    <div class="panel-body">
                                <table class="table">
                                    <c:choose>
                                        <c:when test="${type == 'eventi'}">
                                            <thead>
                                                <tr>
                                                    <th>Titolo</th>
                                                    <th>Data</th>
                                                    <th>Luogo</th>
                                                    <th>Provincia</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${lista}" var="eventi">
                                                <tr>
                                                   <th>${eventi.titolo}</th>
                                                    <th>${eventi.data}</th>
                                                    <th>${eventi.luogo}</th>
                                                    <th>${eventi.provincia}</th> 
                                                    <th><a href="<c:url value="/addOrNewArtista?id=${eventi.idEvento}"/>"<i class="icon-plus"/></a></th>
                                                    <th><a href="<c:url value="/removeEvento?id=${eventi.idEvento}"/>"<i class="icon-remove"/></a></th>                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                        <c:when test="${type == 'artisti'}">
                                            <thead>
                                                <tr>
                                                    <th>Nome</th>
                                                    
                                                </tr>
                                            </thead>
                                            <c:forEach items="${lista}" var="artisti">
                                                <tr>
                                                   <th>${artisti.nome}</th>
                                                   <th><a href="<c:url value="/removeArtista?id=${artisti.idArtista}"/>"<i class="icon-remove"/></a></th>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                                <c:otherwise>
                                                    <thead>
                                                <tr>
                                                    <th>nome</th>
                                                </tr>
                                            </thead>
                                            <c:forEach items="${lista}" var="categorie">
                                                <tr>
                                                   <th>${categorie.nome}</th>
                                                   <th><a href="<c:url value="/removeCategoria?id=${categorie.idCategoria}"/>"<i class="icon-remove"/></a></th>                                                </tr>
                                            </c:forEach>
                                                </c:otherwise>
                                                </c:choose>   
                                            </c:otherwise>
                                    </c:choose>
                                </table>
                                    </div>
                            </div>
                            </div>
        </div>
</section>
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
