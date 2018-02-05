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
	<spring:message code="format.date" var="patternMoment" />
	
	<display:column property="title" title="${alertTitle}" class="${classTd}" />
	<display:column property="description" title="${alertDescription}"
		class="${classTd}" />
	<display:column property="trip.title" title="${alertTrip}"
		class="${classTd}" />
	<display:column property="moment" title="${alertMoment}"
		class="${classTd}" format="${patternMoment}"/>
	<display:column class="${classTd}">
		<a href="alert/manager/edit.do?alertId=${alert.id}">
			<button class="btn">
				<spring:message code="alert.edit" />
			</button>
		</a>
	</display:column>
	
</display:table>