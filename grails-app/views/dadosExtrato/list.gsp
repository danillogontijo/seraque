

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dadosExtrato.label', default: 'DadosExtrato')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-dadosExtrato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-dadosExtrato" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="horasExtraCurriculares" title="${message(code: 'dadosExtrato.horasExtraCurriculares.label', default: 'Horas Extra Curriculares')}" />
					
						<th><g:message code="dadosExtrato.aluno.label" default="Aluno" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${dadosExtratoInstanceList}" status="i" var="dadosExtratoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${dadosExtratoInstance.id}">${fieldValue(bean: dadosExtratoInstance, field: "horasExtraCurriculares")}</g:link></td>
					
						<td>${fieldValue(bean: dadosExtratoInstance, field: "aluno")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${dadosExtratoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
