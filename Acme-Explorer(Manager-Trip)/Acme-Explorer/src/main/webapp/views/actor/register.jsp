<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<div class="row">

		<br/>
<a href="actor/admin/register-manager.do">
			<button class = "btn">
				<spring:message code="master.page.register-manager" />
			</button>
		</a>
		<br/>
		<br/>
<a href="actor/admin/register-auditor.do">
			<button class = "btn">
				<spring:message code="master.page.register-auditor" />
			</button>
		</a>
		<br/>
		<br/>
<a href="actor/admin/register-ranger.do">
			<button class = "btn">
				<spring:message code="master.page.register-ranger" />
			</button>
		</a>
		<br/>
		<br/>
<a href="actor/admin/register-explorer.do">
			<button class = "btn">
				<spring:message code="master.page.register-explorer" />
			</button>
		</a>
		<br/>
		<br/>
<a href="actor/admin/register-sponsor.do">
			<button class = "btn">
				<spring:message code="master.page.register-sponsor" />
			</button>
		</a>
		<br/>
		<br/>
<a href="actor/admin/register-admin.do">
			<button class = "btn">
				<spring:message code="master.page.register-admin" />
			</button>
		</a>
		<br/>
		<br/>
		</div>
		