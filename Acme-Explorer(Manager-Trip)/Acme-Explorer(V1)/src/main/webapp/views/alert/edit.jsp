<%--
 * action-1.jsp
 *
 * Copyright (C) 2017 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

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

<form:form action="alert/manager/edit.do" modelAttribute="alert">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="manager" />
	<form:hidden path="trip" />
	<form:hidden path="ticker" />

	<form:label path="title">
		<spring:message code="alert.title" />
	</form:label>
	<form:input path="title" />
	<form:errors cssClass="error" path="title" />
	<br />
	<form:label path="description">
		<spring:message code="alert.description" />
	</form:label>
	<form:input path="description" />
	<form:errors cssClass="error" path="description" />
	<br />
	<form:label path="moment">
		<spring:message code="alert.moment" />
	</form:label>
	<form:input path="moment" />
	<form:errors cssClass="error" path="moment" />
	<br />
	
	<form:label path="gauge">
		<spring:message code="alert.gauge" />
	</form:label>
	<form:select  path="gauge" >
		<form:option value="1"/>
		<form:option value="2"/>
		<form:option value="3"/>
	</form:select>
	<form:errors cssClass="error" path="gauge" />
	<br />

	<input type="submit" name="save" class="btn"
		value="<spring:message code="alert.save" />">
	<jstl:if test="${alert.id!=0}">
		<input type="submit" name="delete" class="btn"
			value="<spring:message code="alert.delete" />">
	</jstl:if>

	<input type="button" name="cancel"
		value="<spring:message code="alert.cancel" />" class="btn"
		onclick="javascript: relativeRedir('alert/manager/list.do')">


</form:form>
