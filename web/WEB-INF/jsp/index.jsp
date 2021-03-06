
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

    <!-- Document Title
    ============================================= -->
    <title>Home</title>
    
</head>
<body class="stretched">
<!-- Document Wrapper
============================================= -->
    <div id="wrapper" class="clearfix">
        <!--Header-->
        <header id="header" class="transparent-header floating-header dark">
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
                                    <a href="<c:url value="/login"/>" class="col_full" style="margin-bottom:20px;"><button class="button button-small nomargin button-circle"><i class="mdi mdi-account-check"></i>Login</button></a>
                                    <a href="<c:url value="/register"/>" class="col_full"><button class="button  button-small nomargin button-circle"><i class="mdi mdi-account-plus"></i>Register</button></a>
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
                          <!-- Content
        =================================================== -->
        <section id="slider" class="force-full-screen full-screen">
            <div class="force-full-screen full-screen dark" style="background-image: url('<c:url value="/resources/img/index.jpg"/>');background-position: 50% 0;background-size: cover;">
                <div class="container clearfix">
                    <div class="slider-caption slider-caption-center">
                        <h2 data-animate="fadeInDown">Welcome to Glecyn</h2>
                        <p data-animate="fadeInUp" data-delay="400" style="color:white; font-weight:bold;">Il sito per vedere tutti gli eventi nella tua zona, orari, posizione e artisti tutti suddivisi per categoria.</p>
                    </div>
                </div>
            </div>
        </section>
        <section id="content">
            <div class="content-wrap">
                <div class="container clearfix">
                    <div class="col_one_third nobottommargin">
                        <div class="feature-box fbox-effect fbox-center fbox-outline fbox-dark nobottomborder">
                            <div class="fbox-icon">
                                <a href="<c:url value="/categorie"/>"><i class="icon-calendar i-alt"></i></a>
                            </div>
                            <h3>Lot of Different Dates and Categories<span class="subtitle"></span></h3>
                        </div>
                    </div>
                    <div class="col_one_third nobottommargin">
                        <div class="feature-box fbox-effect fbox-center fbox-outline fbox-dark nobottomborder">
                            <div class="fbox-icon">
                                <a href="<c:url value="/eventi"/>"><i class="icon-map i-alt"></i></a>
                            </div>
                            <h3>World Locations<span class="subtitle"></span></h3>
                        </div>
                    </div>
                    <div class="col_one_third col_last nobottommargin">
                        <div class="feature-box fbox-effect fbox-center fbox-outline fbox-dark nobottomborder">
                            <div class="fbox-icon">
                                <a href="<c:url value="/artisti"/>"><i class="icon-microphone2 i-alt"></i></a>
                            </div>
                            <h3>Global Speakers<span class="subtitle"></span></h3>
                        </div>
                    </div>
                </div>
                            </br>
                            </br>
                            </br>
                <div class="container clearfix">
                    <div class="bothsidebar nobottommargin">
                        <div class="fancy-title title-border">
                            <h3>Upcoming Events</h3>
                        </div>
                        <div id="posts" class="events small-thumbs">
                            <c:set var="i" value="${0}"></c:set>
                            <c:forEach items="${eventi}" var="eventi">           
                                <div <c:choose>
                                    <c:when test="${i==0}">
                                        class="col_half"
                                        <c:set var="i" value="${1}"></c:set>
                                    </c:when>
                                    <c:otherwise>
                                        class="col_half col_last"
                                        <c:set var="i" value="${0}"></c:set>
                                    </c:otherwise>
                                </c:choose>>                    
                                    <div class="entry clearfix">
                                        <div class="entry-image hidden-sm">
                                            <a href="#"><img src="${eventi.immagine}"><div class="entry-date"><fmt:formatDate pattern='d' value="${eventi.data}" /><span><fmt:formatDate pattern="MMM" value="${eventi.data}"/></span></div>
                                            </a>
                                        </div>
                                        <div class="entry-c">
                                            <div class="entry-title" style="text-overflow:ellipsis;">
                                                <h4>${fn:substring(eventi.titolo,0,20)}...</h4>
                                            </div>
                                            <ul class="entry-meta clearfix">
                                                <li></li>
                                                <li class="col_full"><a href="#"><i class="icon-time"></i>${eventi.orario}</a></li>
                                                <li class="col_full"><a href="#"><i class="icon-map-marker2"></i>${eventi.luogo}</a></li>
                                                <li class="col_full"><a href="#"><i class="icon-inbox"></i>${eventi.categoria.nome}</a></li>
                                            </ul>
                                            <div class="entry-content">
                                                <a href="<c:url value="/evento?id=${eventi.idEvento}"/>" class="button button-circle  btn-danger">Read More</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
</body>
</html>
