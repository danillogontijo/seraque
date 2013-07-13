

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requisito.label', default: 'Requisito')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-requisito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-requisito" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="coRequisito" title="${message(code: 'requisito.coRequisito.label', default: 'Co Requisito')}" />
					
						<th><g:message code="requisito.disciplina.label" default="Disciplina" /></th>
					
						<th><g:message code="requisito.requisito.label" default="Requisito" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${requisitoInstanceList}" status="i" var="requisitoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${requisitoInstance.id}">${fieldValue(bean: requisitoInstance, field: "coRequisito")}</g:link></td>
					
						<td>${fieldValue(bean: requisitoInstance, field: "disciplina")}</td>
					
						<td>${fieldValue(bean: requisitoInstance, field: "requisito")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${requisitoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
