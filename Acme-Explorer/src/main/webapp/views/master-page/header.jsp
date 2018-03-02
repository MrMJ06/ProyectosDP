<%--
 * header.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="services.ConfigurationService"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div class="crop">
	<a href="welcome/index.do"> <img class="banner img-responsive"
		src="${banner}" alt="Acme Co., Inc." />
	</a>
</div>

<div class="navbar">
	<a class="brand" href="#">&#160;&#160;Acme&#160;<img width="24"
		src="images/internet.png" />&#160;Explorer
	</a>
	<div class="navbar-inner">
		<div class="container">


			<ul class="nav">
				<!-- id="jMenu" -->
				<!-- Do not forget the "fNiv" class for the first level links !! -->

				<security:authorize access="hasRole('EXPLORER')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.explorer" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="application/explorer/list.do"><spring:message
										code="master.page.applicationList" /></a></li>
							<li><a href="contact/explorer/list.do"><spring:message
										code="master.page.contacts" /></a></li>
							<li><a href="survivalClass/explorer/list-joined.do"><spring:message
										code="master.page.survivalClassList" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/listExplorer.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>

				<security:authorize access="hasRole('RANGER')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.ranger" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="curriculum/ranger/list.do"><spring:message
										code="master.page.curriculumList" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>

				<security:authorize access="hasRole('SPONSOR')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.sponsor" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="trip/list.do"><spring:message
										code="master.page.tripList" /></a></li>
							<li><a href="sponsorship/sponsor/list.do"><spring:message
										code="master.page.sponsorshipList" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>

				<security:authorize access="hasRole('MANAGER')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.manager" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="trip/manager/list.do"><spring:message
										code="master.page.manager.tripList" /></a></li>
							<li><a href="application/manager/list.do"><spring:message
										code="master.page.applicationList" /></a></li>
							<li><a href="auditRecord/manager/list.do"><spring:message
										code="master.page.auditRecordList" /></a></li>
							<li><a href="survivalClass/manager/list-managed.do"><spring:message
										code="master.page.survivalClassListManaged" /></a></li>
							<li><a href="lusit/manager/list.do"><spring:message
										code="master.page.lusits" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>

				<security:authorize access="hasRole('AUDITOR')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.auditor" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="auditRecord/auditor/list.do"><spring:message
										code="master.page.auditRecordList" /></a></li>
							<li><a href="note/auditor/list.do"><spring:message
										code="master.page.noteList" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>
				<security:authorize access="hasRole('ADMIN')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"><img src="images/menu.png" /> <spring:message
								code="master.page.admin" /><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li class="arrow"></li>
							<li><a href="actor/admin/list-suspicious.do"><spring:message
										code="master.page.list.suspicious" /></a></li>
							<li><a href="configuration/admin/list.do"><spring:message
										code="master.page.configurationList" /></a></li>
							<li><a href="dashboard/admin/list.do"><spring:message
										code="master.page.dashboardList" /></a></li>
							<li><a href="actor/admin/register.do"><spring:message
										code="master.page.register" /></a></li>
							<li><a href="legalText/admin/list.do"><spring:message
										code="master.page.legalText" /></a></li>
							<li><a href="tag/admin/list.do"><spring:message
										code="master.page.tag" /></a></li>

						</ul></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
				</security:authorize>

				<security:authorize access="isAnonymous()">
					<li><a class="fNiv" href="security/login.do"><img
							src="images/login.png" /> <spring:message
								code="master.page.login" /></a></li>
					<li><a class="fNiv" href="actor/register-explorer.do"><img
							src="images/map.png" /> <spring:message
								code="master.page.register.explorer" /></a></li>
					<li><a class="fNiv" href="actor/register-ranger.do"><img
							src="images/compass.png" /> <spring:message
								code="master.page.register.ranger" /></a></li>
					<li><a class="fNiv" href="trip/list.do"><img
							src="images/backpacker-hiking.png" /> <spring:message
								code="master.page.tripList" /></a></li>
					<li><a href="category/list.do"><img
							src="images/price-tag.png" /> <spring:message
								code="master.page.categoryList" /></a></li>
				</security:authorize>

				<security:authorize access="isAuthenticated()">
					<li><a href="messageFolder/list.do"><img
							src="images/envelope.png" /> <spring:message
								code="master.page.actorMessageFolder" /></a></li>
					<li><a class="fNiv" href="socialIdentity/list.do"><img
							src="images/users.png" /> <spring:message
								code="master.page.socialIdentities" /></a></li>
					<li><a href="category/list.do"><img
							src="images/price-tag.png" /> <spring:message
								code="master.page.categoryList" /></a></li>
				</security:authorize>
			</ul>
			<security:authorize access="isAuthenticated()">
			<ul class="nav pull-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><img src="images/settings.png" /> <security:authentication
							property="principal.username" /><span class="caret"></span> </a>
					<ul class="dropdown-menu">
						<li class="arrow"></li>
						<security:authorize access="hasRole('ADMIN')">
							<li><a href="actor/admin/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('AUDITOR')">
							<li><a href="actor/auditor/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('MANAGER')">
							<li><a href="actor/manager/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('SPONSOR')">
							<li><a href="actor/sponsor/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('RANGER')">
							<li><a href="actor/ranger/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<security:authorize access="hasRole('EXPLORER')">
							<li><a href="actor/explorer/edit.do"><spring:message
										code="master.page.actorEdit" /></a></li>
						</security:authorize>
						<li><a href="j_spring_security_logout"><spring:message
									code="master.page.logout" /> </a></li>
					</ul></li>
			</ul>
			</security:authorize>
		</div>
	</div>
</div>

<div class="lang">
	<a href="?language=en">en</a> | <a href="?language=es">es</a>
</div>

