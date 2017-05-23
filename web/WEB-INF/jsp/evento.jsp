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
    <link rel="stylesheet" href="<c:url value="/resources/css/components/bs-rating.css"/>"type="text/css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1" />


    <!-- Document Title
    ============================================= -->
    <title>Evento</title>
    
</head>
<body class="stretched">

    <!-- Document Wrapper
    ============================================= -->
    <div id="wrapper" class="clearfix">
  
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
        ============================================= -->
	<section id="content">

			<div class="content-wrap">

				<div class="container clearfix">

					<div class="single-event">

						<div class="col_three_fourth">
							<div class="entry-image nobottommargin">
								<a href="#"><img src="${evento.immagine}" alt="Event Single"></a>
								<div class="entry-overlay">
									<span class="hidden-xs">${evento.titolo}</span><div id="event-countdown" class="countdown"></div>
								</div>
							</div>
						</div>
						<div class="col_one_fourth col_last">
							<div class="panel panel-default events-meta">
								<div class="panel-heading">
									<h3 class="panel-title">Event Info:</h3>
								</div>
								<div class="panel-body">
									<ul class="iconlist nobottommargin">
                                                                            <li><i class="icon-calendar3"></i> <fmt:formatDate pattern="dd-MMM-yy" value="${evento.data}"/></li>
										<li><i class="icon-time"></i>${evento.orario}</li>
										<li><i class="icon-map-marker2"></i>${evento.luogo}(${evento.provincia})</li>
                                                                                <li><i class="icon-magnet"></i>${evento.categoria.getNome()}</li>
                                                                                <c:forEach items="${artisti}" var="artisti">
                                                                                <li><i class="icon-play"/>${artisti.nome}</li>
                                                                                </c:forEach>
									</ul>
								</div>
							</div>
                                                                        <div class="clear"></div>
                                                        <div>                                                                                   
                                                            <input id="input" name="rating" type="number" class="rating" max="5" data-size="sm" data-glyphicon="false" data-rating-class="fontawesome-icon" value="${votoMedio}">
                                                            <div class="clear"></div>    
                                                   
                                                        </div>
						</div>

						<div class="clear"></div>

						<div class="col_three_fourth">

							<h3>Details</h3>

                                                        <p>${evento.descrizione}</p>

							
							</div>

							
							</div>

						</div>
						<div class="clear"></div>

						<!--Comments
							============================================= -->
                                                <div class="container clearfix">
							<div id="comments" class="clearfix">

								<h3 id="comments-title"><span>${post.size()}</span>Comments</h3>

								<!-- Comments List
								============================================= -->
								<ol class="commentlist clearfix">
                                                                    <c:forEach items="${post}" var="post" >
									<li class="comment even thread-even depth-1" id="li-comment-1">

										<div id="comment-1" class="comment-wrap clearfix">

											<div class="comment-meta">

												<div class="comment-author vcard">

													<span class="comment-avatar clearfix">
													<img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' /></span>
                                                                                                        
												</div>

											</div>

											<div class="comment-content clearfix">

                                                                                            <div class="comment-author col_three_fourth">${post.utente.username}<span><a href="#" title="Permalink to this comment"><fmt:formatDate value="${post.data}"/></a></span></div>
                                                                                            <input id="input"  class="rating" value="${post.voto}" data-size="sm" data-glyphicon="false" data-rating-class="fontawesome-icon" data-readonly="true" >
                                                                                                <p>${post.commento}</p>


											</div>

											<div class="clear"></div>

										</div>
                                                                            </li>
                                                                    </c:forEach>

								</ol><!-- .commentlist end -->
                                                                <div>

								<div class="clear"></div>

								<!-- Comment Form
								============================================= -->
                                                                <%
                                                                    if ((session.getAttribute("userinfo") == null) || (session.getAttribute("userinfo") == "")) {
                                                                 %>
                                                                 <%}else{%>
								<div id="respond" class="clearfix">

									<h3>Leave a <span>Comment</span></h3>

									<form class="clearfix" action="<c:url value="/newComment"/>" method="POST" id="commentform">

										<div class="col_two_third">
											<label for="author">${userinfo.username}</label>
										</div>
                                                                                 <div class="col_one_third col_last">
                                                                                    <input id="input" name="rating" type="number" class="rating" max="5" data-size="sm" data-glyphicon="false" data-rating-class="fontawesome-icon" value="0.0">
                                                                                  
										</div>
										<div class="clear"></div>

										<div class="col_full">
											<label for="comment">Comment</label>
											<textarea name="comment" cols="58" rows="7" tabindex="4" class="sm-form-control"></textarea>
										</div>
                                                                                <input type="hidden"  value="${evento.idEvento}" name="id"></>
										<div class="col_full nobottommargin">
											<button name="submit" type="submit" id="submit-button" tabindex="5" value="Submit" class="button button-circle nomargin">Commenta</button>
										</div>

									</form>

								</div><!-- #respond end -->
                                                                <%
                                                                    }
                                                                %>

							</div><!-- #comments end -->

				</div>

			</div>

		</section><!-- #content end -->

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
<script type="text/javascript" src="<c:url value="/resources/js/components/star-rating.js"/>"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value="/resources/js/functions.js"/>"></script>

</body>
</html>
