

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-materiaAvulsa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materiaAvulsa" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'materiaAvulsa.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="descricao" title="${message(code: 'materiaAvulsa.descricao.label', default: 'Descricao')}" />
					
						<g:sortableColumn property="cargaHoraria" title="${message(code: 'materiaAvulsa.cargaHoraria.label', default: 'Carga Horaria')}" />
					
						<g:sortableColumn property="nota" title="${message(code: 'materiaAvulsa.nota.label', default: 'Nota')}" />
					
						<g:sortableColumn property="frequencia" title="${message(code: 'materiaAvulsa.frequencia.label', default: 'Frequencia')}" />
					
						<th><g:message code="materiaAvulsa.semestre.label" default="Semestre" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaAvulsaInstanceList}" status="i" var="materiaAvulsaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${materiaAvulsaInstance.id}">${fieldValue(bean: materiaAvulsaInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: materiaAvulsaInstance, field: "descricao")}</td>
					
						<td>${fieldValue(bean: materiaAvulsaInstance, field: "cargaHoraria")}</td>
					
						<td>${fieldValue(bean: materiaAvulsaInstance, field: "nota")}</td>
					
						<td>${fieldValue(bean: materiaAvulsaInstance, field: "frequencia")}</td>
					
						<td>${fieldValue(bean: materiaAvulsaInstance, field: "semestre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materiaAvulsaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
