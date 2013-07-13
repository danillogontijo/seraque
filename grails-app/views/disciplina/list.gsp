

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disciplina.label', default: 'Disciplina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-disciplina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-disciplina" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'disciplina.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'disciplina.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="cargaHoraria" title="${message(code: 'disciplina.cargaHoraria.label', default: 'Carga Horaria')}" />
					
						<th><g:message code="disciplina.instituicao.label" default="Instituicao" /></th>
					
						<g:sortableColumn property="mediaAvaliacaoAlunos" title="${message(code: 'disciplina.mediaAvaliacaoAlunos.label', default: 'Media Avaliacao Alunos')}" />
					
						<g:sortableColumn property="mediaNotas" title="${message(code: 'disciplina.mediaNotas.label', default: 'Media Notas')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${disciplinaInstanceList}" status="i" var="disciplinaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${disciplinaInstance.id}">${fieldValue(bean: disciplinaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: disciplinaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: disciplinaInstance, field: "cargaHoraria")}</td>
					
						<td>${fieldValue(bean: disciplinaInstance, field: "instituicao")}</td>
					
						<td>${fieldValue(bean: disciplinaInstance, field: "mediaAvaliacaoAlunos")}</td>
					
						<td>${fieldValue(bean: disciplinaInstance, field: "mediaNotas")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${disciplinaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
