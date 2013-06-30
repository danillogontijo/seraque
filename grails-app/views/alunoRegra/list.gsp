

<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alunoRegra.label', default: 'AlunoRegra')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-alunoRegra" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-alunoRegra" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="alunoRegra.aluno.label" default="Aluno" /></th>
					
						<th><g:message code="alunoRegra.regra.label" default="Regra" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alunoRegraInstanceList}" status="i" var="alunoRegraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${alunoRegraInstance.id}">${fieldValue(bean: alunoRegraInstance, field: "aluno")}</g:link></td>
					
						<td>${fieldValue(bean: alunoRegraInstance, field: "regra")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alunoRegraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
