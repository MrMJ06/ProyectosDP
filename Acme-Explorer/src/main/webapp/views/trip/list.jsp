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

<jstl:if test="${requestUri==\"trip/search.do\"}">
	<script type="text/javascript">
		function searchAjax() {
			console.log("Test");
			delay(function() {

				var searchText = $('#keyword').val();
				var searchURL = "trip/search-ajax.do?keyword=" + searchText;

				$.post(searchURL, null, function(result) {
					$("#tableTrips").html(result);
				});
			}, 800);
		};

		var delay = (function() {
			var timer = 0;
			return function(callback, ms) {
				clearTimeout(timer);
				timer = setTimeout(callback, ms);
			};
		})();
	</script>
	<form action="trip/search.do" method="GET">

		<label> <spring:message code="trip.search" />
		</label> <input type="text" name="keyword" id="keyword" onkeyup="searchAjax()"
			placeholder="<spring:message code="search.keyword.placeholder"/>">
		<input type="submit" class = "btn" name="search" id="search"
			value="<spring:message code = "trip.search"/>" />
	</form>

</jstl:if>

<jstl:if test="${requestUri==\"trip/listExplorer.do\"}">
<spring:message var = "lang" code = "language"/>
	<form:form action="trip/searchExplorer.do" modelAttribute="search"
		method="POST">
		<form:hidden path="id" />
		<form:hidden path="version" />
		<form:hidden path="searchMoment" />
		<form:hidden path="trips" />


		<label> <spring:message code="trip.search" />
		</label>
		<form:input path="keyWord" />
<%-- 		<form:errors cssClass="error" path="keyWord" /> --%>

		<label> <spring:message code="trip.startPrice" />
		</label>
		<jstl:if test="${lang == \"en\"}">&euro;</jstl:if> <form:input path="priceRangeStart" placeholder="200.00" /><jstl:if test="${lang == \"es\"}"> &euro;</jstl:if>
		<form:errors cssClass="error" path="priceRangeStart" />

		<label> <spring:message code="trip.endPrice" />
		</label>
		<jstl:if test="${lang == \"en\"}">&euro;</jstl:if> <form:input path="priceRangeEnd" placeholder="700.00" /> <jstl:if test="${lang == \"es\"}">&euro;</jstl:if>
		<form:errors cssClass="error" path="priceRangeEnd" />

		<label> <spring:message code="trip.startDate" />
		</label>
		<form:input path="dateRangeStart" placeholder="dd/MM/yyyy hh:mm" />
		<form:errors cssClass="error" path="dateRangeStart" />

		<label> <spring:message code="trip.endDate" />
		</label>
		<form:input path="dateRangeEnd" placeholder="dd/MM/yyyy hh:mm" />
		<form:errors cssClass="error" path="dateRangeEnd" />


		<input type="submit" class = "btn" name="save" id="save"
			value="<spring:message code = "trip.search"/>" />

	</form:form>
</jstl:if>


<div id="tableTrips">
	<jstl:set value="&" var="connector" />
	<jstl:if test="${requestUri==\"trip/search.do\"}">
		<jstl:set value="?keyword=${keyword}&" var="connector" />
	</jstl:if>
	<jstl:if test="${requestUri==\"trip/manager/list.do\"}">
		<jstl:set value="?" var="connector" />
	</jstl:if>
	<jstl:if test="${requestUri==\"trip/listExplorer.do\"}">
		<jstl:set
			value="?"
			var="connector" />
	</jstl:if>
	<span class="pagebanner"> <jstl:forEach begin="1"
			end="${pageNum}" var="index">
			<a href="${requestUri}${connector}page=${index-1}"> <jstl:out
					value="${index}" />
			</a>
			<jstl:if test="${index!=pageNum}">,</jstl:if>
		</jstl:forEach>
	</span>
	<display:table name="trips" id="trip" requestURI="${requestUri}"
		class="displayTag" pagesize="${pagesize}">

		<spring:message code="trip.title" var="title" />
		<display:column property="title" title="${title}" sortable="true" />

		<spring:message code="trip.price" var="price" />
		<spring:message code="format.price" var="formatPrice" />
		<display:column property="price" title="${price}" sortable="true"
			format="${formatPrice}" />

		<spring:message code="format.date" var="formatDate" />
		
		<security:authorize access="hasRole('MANAGER')">
	<spring:message code="trip.publicationDate" var="publicationDate" />
		<display:column property="publicationDate" title="${publicationDate}"
			sortable="true" format="${formatDate}" />
</security:authorize>
		


		<spring:message code="trip.startDate" var="startDate" />
		<display:column property="startDate" title="${startDate}"
			sortable="true" format="${formatDate}" />

		<spring:message code="trip.endDate" var="endDate" />

		<display:column property="endDate" title="${endDate}" sortable="true"
			format="${formatDate}" />

		<jstl:set value="false" var="anonymous" />
		<security:authorize access="isAnonymous()">
			<jstl:set value="true" var="anonymous" />
		</security:authorize>
		<spring:message code="trip.moreDetails" var="moreDetails" />
		<display:column>
			<a
				href="trip/detailed-trip.do?tripId=${trip.id}&anonymous=${anonymous}">
				<spring:message code="trip.moreDetails" />
			</a>
		</display:column>


	

	</display:table>

</div>

<security:authorize access="hasRole('MANAGER')">
	<a href="trip/manager/create.do">
		<button class = "btn">
			<spring:message code="trip.create" />
		</button>
	</a>
</security:authorize>
