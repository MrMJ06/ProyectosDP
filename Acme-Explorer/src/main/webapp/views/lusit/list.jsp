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
<display:table name="lusits" id="lusit"
	requestURI="lusit/manager/list.do" pagesize="${pagesize}"
	class="displayTag">

	<jstl:if test="${lusit.gauge==\"1\"}">
		<jstl:set var="classTd" value="gauge1" />
	</jstl:if>
	<jstl:if test="${lusit.gauge==\"2\"}">
		<jstl:set var="classTd" value="gauge2" />
	</jstl:if>
	<jstl:if test="${lusit.gauge==\"3\"}">
		<jstl:set var="classTd" value="gauge3" />
	</jstl:if>

	<spring:message code="lusit.title" var="lusitTitle" />
	<spring:message code="lusit.description" var="lusitDescription" />
	<spring:message code="lusit.trip" var="lusitTrip" />
	<spring:message code="lusit.moment" var="lusitMoment" />
	<spring:message code="lusit.trip" var="trip" />
	<spring:message code="format.date" var="patternMoment" />

	<display:column property="title" title="${lusitTitle}"
		class="${classTd}" sortable="true"/>
	<display:column property="description" title="${lusitDescription}"
		class="${classTd}" />
	<display:column class="${classTd}" title="${trip}"> 
		<jstl:out value="${trips[lusit_rowNum -1].title}" />
	</display:column>
	<display:column property="moment" title="${lusitMoment}"
		class="${classTd}" format="${patternMoment}" sortable="true"/>

	<display:column class="${classTd}">
		<jstl:if test="${lusit.moment!=null and lusit.moment>currentDate}">
			<a href="lusit/manager/edit.do?lusitId=${lusit.id}">
				<button class="btn">
					<spring:message code="lusit.edit" />
				</button>
			</a>
		</jstl:if>
	</display:column>
</display:table>