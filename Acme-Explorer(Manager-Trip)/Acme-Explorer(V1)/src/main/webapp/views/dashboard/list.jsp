<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>


<details>
<summary><spring:message code="dashboard.application.number"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${applicationAverage == \"null\" ? 0 : applicationAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${applicationMinimum == \"null\" ? 0 : applicationMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${applicationMaximum == \"null\" ? 0 : applicationMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${applicationStandardDeviation == \"null\" ? 0 : applicationStandardDeviation}"></jstl:out></p>
</details><br/>


<details>
<summary><spring:message code="dashboard.trip.manager"/></summary><br/>
<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${tripManagerAverage == \"null\" ? 0 : tripManagerAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${tripManagerMinimum == \"null\" ? 0 : tripManagerMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${tripManagerMaximum == \"null\" ? 0 : tripManagerMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${tripManagerStandardDeviation == \"null\" ? 0 : tripManagerStandardDeviation}"></jstl:out></p>
</details><br/>

<details>
<summary><spring:message code="dashboard.trip.price"/></summary><br/>
<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${tripPriceAverage == \"null\" ? 0 : tripPriceAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${tripPriceMinimum == \"null\" ? 0 : tripPriceMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${tripPriceMaximum == \"null\" ? 0 : tripPriceMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${tripPriceStandardDeviation == \"null\" ? 0 : tripPriceStandardDeviation}"></jstl:out></p>
</details><br/>


<details>
<summary><spring:message code="dashboard.trip.ranger"/></summary><br/>
<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${tripRangerAverage == \"null\" ? 0 : tripRangerAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${tripRangerMinimum == \"null\" ? 0 : tripRangerMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${tripRangerMaximum == \"null\" ? 0 : tripRangerMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${tripRangerStandardDeviation == \"null\" ? 0 : tripRangerStandardDeviation}"></jstl:out></p>
</details><br/>

<details>
<summary><spring:message code="dashboard.application.ratio.status"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.application.ratio.status.pending"/>:</b> <jstl:out value="${ratioApplicationPending == \"null\" ? 0 : ratioApplicationPending}"></jstl:out></p>
<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioApplicationPending*100}%;"><jstl:out value="${ratioApplicationPending*100}%" /></div>
</div>
</div>

<p class = "element"><b><spring:message code="dashboard.application.ratio.status.due"/>:</b> <jstl:out value="${ratioApplicationDue == \"null\" ? 0 : ratioApplicationDue}"></jstl:out></p>
<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioApplicationDue*100}%;"><jstl:out value="${ratioApplicationDue*100}%" /></div>
</div>
</div>

<p class = "element"><b><spring:message code="dashboard.application.ratio.status.accepted"/>:</b> <jstl:out value="${ratioApplicationAccepted == \"null\" ? 0 : ratioApplicationAccepted}"></jstl:out></p>
<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioApplicationAccepted*100}%;"><jstl:out value="${ratioApplicationAccepted*100}%" /></div>
</div>
</div>

<p class = "element"><b><spring:message code="dashboard.application.ratio.status.cancelled"/>:</b> <jstl:out value="${ratioApplicationCancelled == \"null\" ? 0 : ratioApplicationCancelled}"></jstl:out></p>
<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioApplicationCancelled*100}%;"><jstl:out value="${ratioApplicationCancelled*100}%" /></div>
</div>
</div>
</details><br/>

<details>
<summary><spring:message code="dashboard.trip.ratio.cancelled"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${ratioCancelled == \"null\" ? 0 : ratioCancelled}"></jstl:out></p>
<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioCancelled*100}%;"><jstl:out value="${ratioCancelled*100}%" /></div>
</div>
</div>

<p class = "element"><b><spring:message code="dashboard.trip.total"/>:</b> <jstl:out value="${numTrips}"></jstl:out></p>
</details><br/>

<details>
<summary><spring:message code="dashboard.trip.more.applications"/></summary>

<display:table name="tripsMoreApplications">
	<spring:message var="titleApplication" code="trip.title"/>
	<display:column title="${titleApplication}" property="title" />
</display:table>
</details><br/>

<details>
<summary><spring:message code="dashboard.legalText"/></summary>
<%-- <table>
		<tr>
			<th><spring:message code="dashboard.legalText.title"/></th>
			<th><spring:message code="dashboard.numReferences"/></th>
		</tr>
	<jstl:forEach items="${numberReferencesLegalText}" var="row">
		<tr>
			<td>${row[0]}</td> <td> ${row[1]} </td>
		</tr>
	</jstl:forEach>
	</table> --%>
	
	<display:table id = "row" name = "numberReferencesLegalText">
		
		<spring:message var = "titleLegalText" code = "dashboard.legalText.title"/>
		<display:column title = "${titleLegalText}">${row[0]}</display:column>
		
		<spring:message var = "numReferencesLegalText" code = "dashboard.numReferences"/>
		<display:column title = "${numReferencesLegalText}">${row[1]}</display:column>
	
	</display:table>
</details><br/>


<details>
<summary><spring:message code="dashboard.trip.note"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${tripNoteAverage == \"null\" ? 0 : tripNoteAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${tripNoteMinimum == \"null\" ? 0 : tripNoteMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${tripRangerMaximum == \"null\" ? 0 : tripRangerMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${tripRangerStandardDeviation == \"null\" ? 0 : tripRangerStandardDeviation}"></jstl:out></p>
</details><br/>

<details>
<summary><spring:message code="dashboard.trip.auditRecord"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.average"/>:</b> <jstl:out value="${tripAuditRecordAverage == \"null\" ? 0 : tripAuditRecordAverage}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.minimum"/>:</b> <jstl:out value="${tripAuditRecordMinimum == \"null\" ? 0 : tripAuditRecordMinimum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.maximum"/>:</b> <jstl:out value="${tripAuditRecordMaximum == \"null\" ? 0 : tripAuditRecordMaximum}"></jstl:out></p>

<p class = "element"><b><spring:message code="dashboard.standardDeviation"/>:</b> <jstl:out value="${tripAuditRecordStandardDeviation == \"null\" ? 0 : tripAuditRecordStandardDeviation}"></jstl:out></p>
</details><br/>

<details>
<summary><spring:message code="dashboard.trip.ratio.auditRecord"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${tripAuditRecordRatio == \"null\" ? 0 : tripAuditRecordRatio}"/></p>

<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${tripAuditRecordRatio*100}%;"><jstl:out value="${tripAuditRecordRatio*100}%"/></div>
</div>
</div>
</details><br/>

<details>
<summary><spring:message code="dashboard.ratio.curricula"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${CurriculaRatio == \"null\" ? 0 : CurriculaRatio}"/></p>

<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${CurriculaRatio*100}%;"><jstl:out value="${CurriculaRatio*100}%"/></div>
</div>
</div>
</details><br/>

<details>
<summary><spring:message code="dashboard.ratio.curricula.endorsed"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${EndorsedCurriculaRatio == \"null\" ? 0 : EndorsedCurriculaRatio}" /></p>

<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${EndorsedCurriculaRatio*100}%;"><jstl:out value="${EndorsedCurriculaRatio*100}%" /></div>
</div>
</div>
</details><br/>

<details>
<summary><spring:message code="dashboard.ratio.suspicious.manager"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${ratioSuspiciousManager == \"null\" ? 0 : ratioSuspiciousManager}"/></p>

<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioSuspiciousManager*100}%;"><jstl:out value="${ratioSuspiciousManager*100}%"/></div>
</div>
</div>
</details><br/>

<details>
<summary><spring:message code="dashboard.ratio.suspicious.ranger"/></summary><br/>

<p class = "element"><b><spring:message code="dashboard.trip.ratio"/>:</b> <jstl:out value="${ratioSuspiciousRanger == \"null\" ? 0 : ratioSuspiciousRanger}"/></p>

<div class = "ratio element">
<div class="progress progress-striped
     active" aria-valuemin="0">
  <div class="bar"
       style="width: ${ratioSuspiciousRanger*100}%;"><jstl:out value="${ratioSuspiciousRanger*100}%"/></div>
</div>
</div>
</details><br/>

