

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaSemestre.label', default: 'MateriaSemestre')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materiaSemestre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materiaSemestre" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="comentarioProfessor" title="${message(code: 'materiaSemestre.comentarioProfessor.label', default: 'Comentario Professor')}" />
					
						<g:sortableColumn property="comentarioDisiplina" title="${message(code: 'materiaSemestre.comentarioDisiplina.label', default: 'Comentario Disiplina')}" />
					
						<g:sortableColumn property="avaliacaoDisciplina" title="${message(code: 'materiaSemestre.avaliacaoDisciplina.label', default: 'Avaliacao Disciplina')}" />
					
						<g:sortableColumn property="avaliacaoProfessor" title="${message(code: 'materiaSemestre.avaliacaoProfessor.label', default: 'Avaliacao Professor')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'materiaSemestre.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="frequencia" title="${message(code: 'materiaSemestre.frequencia.label', default: 'Frequencia')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaSemestreInstanceList}" status="i" var="materiaSemestreInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materiaSemestreInstance.id}">${fieldValue(bean: materiaSemestreInstance, field: "comentarioProfessor")}</g:link></td>
					
						<td>${fieldValue(bean: materiaSemestreInstance, field: "comentarioDisiplina")}</td>
					
						<td>${fieldValue(bean: materiaSemestreInstance, field: "avaliacaoDisciplina")}</td>
					
						<td>${fieldValue(bean: materiaSemestreInstance, field: "avaliacaoProfessor")}</td>
					
						<td>${fieldValue(bean: materiaSemestreInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: materiaSemestreInstance, field: "frequencia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materiaSemestreInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
