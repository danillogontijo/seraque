

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'semestre.label', default: 'Semestre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-semestre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-semestre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="media" title="${message(code: 'semestre.media.label', default: 'Media')}" />
					
						<th><g:message code="semestre.aluno.label" default="Aluno" /></th>
					
						<g:sortableColumn property="concluido" title="${message(code: 'semestre.concluido.label', default: 'Concluido')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${semestreInstanceList}" status="i" var="semestreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${semestreInstance.id}">${fieldValue(bean: semestreInstance, field: "media")}</g:link></td>
					
						<td>${fieldValue(bean: semestreInstance, field: "aluno")}</td>
					
						<td><g:formatBoolean boolean="${semestreInstance.concluido}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${semestreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
