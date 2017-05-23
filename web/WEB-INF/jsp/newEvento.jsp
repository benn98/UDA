<%-- 
    Document   : InsEvento
    Created on : 11-mag-2017, 13.15.40
    Author     : andre
--%>

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
        <link rel="stylesheet" href="<c:url value="/resources/css/components/timepicker.css"/>" type="text/css" />
	<link rel="stylesheet" href="<c:url value="resources/css/components/daterangepicker.css"/>" type="text/css" />
        <link rel="stylesheet" href="<c:url value="resources/css/components/datepicker.css"/>" type="text/css" />

	<link rel="stylesheet" href="<c:url value="/resources/css/responsive.css"/>"/public/ type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />

<!DOCTYPE html>
	<!-- Document Title
	============================================= -->
	<title>NuovoEvento</title>

</head>

<body class="stretched">
     <%
       if ((session.getAttribute("userinfo") == null) || (session.getAttribute("userinfo") == "")) {
     %>
     <%}else{%>

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
              <form id="form" name="form" class="nobottommargin" action="<c:url value='/new'/>" method="post">
              <h3>Inserisci un nuovo evento:</h3>
              <div class="col_one_third">
                 <label for="titolo">Titolo:</label>
                <input type="text" id="titolo" name="titolo" value="" class="form-control not-dark" />
              </div>
              <div class="col_one_third ">
                  <label for="Immagine">Immagine:</label>
                  <input type="text" id="immagine" name="immagine" value="link immagine" class="form-control not-dark">  
              </div>
              <div class="col_one_third col_last">
                 <label for="data">Data:</label>
                 <input type="text" value="" class="form-control not-dark tleft past-enabled" placeholder="MM/DD/YYYY" name="data">
              </div>
              <div class="col_one_fourth">
                  <label for="orario">Orario:</label>
                  <input type="text" value="OO:MM" name="orario" class="form-control not-dark">
              </div>
              <div class="col_one_fourth">
                  <label for="luogo">Luogo:</label>
                  <input type="text" value="" name="luogo" class="form-control not-dark">
              </div>
              <div class="col_one_fourth">
                  <label for="Artista">Provincia:</label>
                  <input type="text" value="" name="provincia" class="form-control not-dark">
              </div>
              <div class="col_one_fourth col_last">
                  <label for="Categorie">Categoria:</label>
                  <select class="selectpicker form-control not-dark"name="categoria">
                      <c:forEach items="${categorie}" var="categoria">
                          <option>${categoria.nome}</option>
                      </c:forEach>
                  </select>
              </div>
              <div class="col_full">
                  <label for="descrizione">Descrizione:</label>
                  <textarea name="descrizione" cols="58" rows="1"  class="sm-form-control"></textarea>
              </div>
            <button name="submit" type="submit" id="submit-button button_circle"  value="Submit" class="button button-circle nomargin">Inserisci</button>
              </form>
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
<script type="text/javascript" src="<c:url value="/resources/js/components/moment.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/components/timepicker.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/components/datepicker.js"/>"></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="<c:url value="/resources/js/components/daterangepicker.js"/>"></script>

<!-- Footer Scripts
============================================= -->
<script type="text/javascript" src="<c:url value="/resources/js/functions.js"/>"></script>

	<script type="text/javascript">
		$(function() {
			$('.travel-date-group .default').datepicker({
				autoclose: true,
				startDate: "today",
			});

			$('.travel-date-group .today').datepicker({
				autoclose: true,
				startDate: "today",
				todayHighlight: true
			});

			$('.travel-date-group .past-enabled').datepicker({
				autoclose: true,
			});
			$('.travel-date-group .format').datepicker({
				autoclose: true,
				format: "dd-mm-yyyy",
			});

			$('.travel-date-group .autoclose').datepicker();

			$('.travel-date-group .disabled-week').datepicker({
				autoclose: true,
				daysOfWeekDisabled: "0"
			});

			$('.travel-date-group .highlighted-week').datepicker({
				autoclose: true,
				daysOfWeekHighlighted: "0"
			});

			$('.travel-date-group .mnth').datepicker({
				autoclose: true,
				minViewMode: 1,
				format: "mm/yy"
			});

			$('.travel-date-group .multidate').datepicker({
				multidate: true,
				multidateSeparator: " , "
			});

			$('.travel-date-group .input-daterange').datepicker({
				autoclose: true
			});

			$('.travel-date-group .inline-calendar').datepicker();

			$('.datetimepicker').datetimepicker({
				showClose: true
			});

			$('.datetimepicker1').datetimepicker({
				format: 'LT',
				showClose: true
			});

			$('.datetimepicker2').datetimepicker({
				inline: true,
				sideBySide: true
			});

		});

		$(function() {
			// .daterange1
			$(".daterange1").daterangepicker({
				"buttonClasses": "button button-rounded button-mini nomargin",
				"applyClass": "button-color",
				"cancelClass": "button-light"
			});

			// .daterange2
			$(".daterange2").daterangepicker({
				"opens": "center",
				timePicker: true,
				timePickerIncrement: 30,
				locale: {
					format: 'MM/DD/YYYY h:mm A'
				},
				"buttonClasses": "button button-rounded button-mini nomargin",
				"applyClass": "button-color",
				"cancelClass": "button-light"
			});

			// .daterange3
			$(".daterange3").daterangepicker({
				singleDatePicker: true,
				showDropdowns: true
			},
			function(start, end, label) {
				var years = moment().diff(start, 'years');
				alert("You are " + years + " years old.");
			});

			// reportrange
			function cb(start, end) {
				$(".reportrange span").html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
			}
			cb(moment().subtract(29, 'days'), moment());

			$(".reportrange").daterangepicker({
				"buttonClasses": "button button-rounded button-mini nomargin",
				"applyClass": "button-color",
				"cancelClass": "button-light",
				ranges: {
				   'Today': [moment(), moment()],
				   'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
				   'Last 7 Days': [moment().subtract(6, 'days'), moment()],
				   'Last 30 Days': [moment().subtract(29, 'days'), moment()],
				   'This Month': [moment().startOf('month'), moment().endOf('month')],
				   'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
				}
			}, cb);

			// .daterange4
			$(".daterange4").daterangepicker({
				autoUpdateInput: false,
				locale: {
					cancelLabel: 'Clear'
				},
				"buttonClasses": "button button-rounded button-mini nomargin",
				"applyClass": "button-color",
				"cancelClass": "button-light"
			});

			$(".daterange4").on('apply.daterangepicker', function(ev, picker) {
				$(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
			});

			$(".daterange4").on('cancel.daterangepicker', function(ev, picker) {
				$(this).val('');
			});

		});

	</script>
<%}%>
</body>
</html>











