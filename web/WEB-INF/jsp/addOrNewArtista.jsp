<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>

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
    <title>Login</title>

</head>

<body class="stretched">

    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">

        <!-- Content
        ============================================= -->
        <section id="content">

            <div class="content-wrap nopadding">

                <div class="section nopadding nomargin" style="width: 100%; height: 100%; position: absolute; left: 0; top: 0; background-image: url('<c:url value="/resources/img/login.jpg"/>');background-size:cover;"></div>

                <div class="section nobg full-screen nopadding nomargin">
                    <div class="container vertical-middle divcenter clearfix">
                        <div class="row center">
                            <a href="<c:url value="/"/>"><img src="/ProgettoUDA/resources/img/logoG.png" width="140px" height="100px"></a>
                        </div>

                        <div class="panel panel-default divcenter noradius noborder" style="max-width: 800px;">
                            <div class="panel-body" style="padding: 40px;">
                                <div class="col_full"> <h3>Aggiungi oppure Cerca un artista per l'evento:</h3></div>
                                <form id="login-form" name="login-form" class="nobottommargin col_half center" action="<c:url value="/addArtista"/>" method="post">

                                    <div class="col_full">
                                        <h4>Aggiungi un nuovo artista</h4>
                                    </div>
                                    <input type="hidden" name="id" value="${idEvento}">
                                    <div class="col_half">
                                        <label for="login-form-username">Nome:</label>
                                        <input type="text" id="nome" name="nome" value="" class="form-control not-dark" />
                                    </div>

                                    <div class="col_half col_last">
                                        <label for="form-nome">Immagine:</label>
                                        <input type="text" id="immagine" name="immagine" value="" class="form-control not-dark" />
                                    </div>
                                    <div class="col_full nobottommargin">
                                        <button class="button  nomargin button-circle" id="submit" name="login-form-submit" value="insersici">Inserisci</button>
                                    </div>
                                </form>
                                <form id="login-form" name="login-form" class="nobottommargin col_half col_last center" action="<c:url value="/inserisciArtista"/>" method="post">
                                    <div class="col_full">
                                        <h4>Cerca artista:</h4>
                                    </div>
                                    <input type="hidden" name="id" value="${idEvento}">
                                    <div class="col_full">
                                        <label for="Categorie">Artista:</label>
                                        <select class="selectpicker form-control not-dark" name="nome" value="">
                                            <c:forEach items="${artisti}" var="artista">
                                                <option>${artista.nome}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="col_full">
                                        <button class="button  nomargin button-circle" id="submit" name="login-form-submit" value="Artista">Inserisci</button>
                                    </div>
                                </form>
                                <%if ((session.getAttribute("fail") == "") || (session.getAttribute("fail") == null)) {%>
                                <%} else {%>
                                <div class="style-msg errormsg">
                                    <div class="sb-msg"><i class="icon-remove"></i><strong>Errore!</strong>Le credenziali inserite sono errate</div>
                                </div>
                                <%session.setAttribute("fail", null);%>
                                <%}%>
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
                    </div>
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
