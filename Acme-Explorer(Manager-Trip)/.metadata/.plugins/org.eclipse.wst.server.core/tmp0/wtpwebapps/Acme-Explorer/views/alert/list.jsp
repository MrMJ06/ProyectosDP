<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentDate" value="${now}"
	pattern="yyyy-MM-dd HH:mm" />

<display:table name="alerts" id="alert"
	requestURI="alert/manager/list.do" pagesize="${pagesize}"
	class="displayTag">

	<jstl:if test="${alert.gauge==\"1\"}">
		<jstl:set var="classTd" value="gauge1" />
	</jstl:if>
	<jstl:if test="${alert.gauge==\"2\"}">
		<jstl:set var="classTd" value="gauge2" />
	</jstl:if>
	<jstl:if test="${alert.gauge==\"3\"}">
		<jstl:set var="classTd" value="gauge3" />
	</jstl:if>
	
	<spring:message code="alert.title" var="alertTitle" />
	<spring:message code="alert.description" var="alertDescription" />
	<spring:message code="alert.trip" var="alertTrip" />
	<spring:message code="alert.moment" var="alertMoment" />
	<spring:message code="alert.trip" var="trip" />
	<spring:message code="format.date" var="patternMoment" />
	
	<display:column property="title" title="${alertTitle}" class="${classTd}" />
	<display:column property="description" title="${alertDescription}"
		class="${classTd}" />
	<display:column property="moment" title="${alertMoment}"
		class="${classTd}" format="${patternMoment}"/>
	<display:column class="${classTd}" title="${trip}">
		<jstl:out value="${trips[alert_rowNum -1].title}"/>
	</display:column>
	
	<display:column class="${classTd}">
	<jstl:if test="${trips[alert_rowNum -1].startDate>currentDate}">
		<a href="alert/manager/edit.do?alertId=${alert.id}">
			<button class="btn">
				<spring:message code="alert.edit" />
			</button>
		</a>
	</jstl:if>
	</display:column>
	
</display:table>