

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaSemestre.label', default: 'MateriaSemestre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materiaSemestre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materiaSemestre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materiaSemestre">
			
				<g:if test="${materiaSemestreInstance?.comentarioProfessor}">
				<li class="fieldcontain">
					<span id="comentarioProfessor-label" class="property-label"><g:message code="materiaSemestre.comentarioProfessor.label" default="Comentario Professor" /></span>
					
						<span class="property-value" aria-labelledby="comentarioProfessor-label"><g:fieldValue bean="${materiaSemestreInstance}" field="comentarioProfessor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.comentarioDisiplina}">
				<li class="fieldcontain">
					<span id="comentarioDisiplina-label" class="property-label"><g:message code="materiaSemestre.comentarioDisiplina.label" default="Comentario Disiplina" /></span>
					
						<span class="property-value" aria-labelledby="comentarioDisiplina-label"><g:fieldValue bean="${materiaSemestreInstance}" field="comentarioDisiplina"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.avaliacaoDisciplina}">
				<li class="fieldcontain">
					<span id="avaliacaoDisciplina-label" class="property-label"><g:message code="materiaSemestre.avaliacaoDisciplina.label" default="Avaliacao Disciplina" /></span>
					
						<span class="property-value" aria-labelledby="avaliacaoDisciplina-label"><g:fieldValue bean="${materiaSemestreInstance}" field="avaliacaoDisciplina"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.avaliacaoProfessor}">
				<li class="fieldcontain">
					<span id="avaliacaoProfessor-label" class="property-label"><g:message code="materiaSemestre.avaliacaoProfessor.label" default="Avaliacao Professor" /></span>
					
						<span class="property-value" aria-labelledby="avaliacaoProfessor-label"><g:fieldValue bean="${materiaSemestreInstance}" field="avaliacaoProfessor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="materiaSemestre.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${materiaSemestreInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.frequencia}">
				<li class="fieldcontain">
					<span id="frequencia-label" class="property-label"><g:message code="materiaSemestre.frequencia.label" default="Frequencia" /></span>
					
						<span class="property-value" aria-labelledby="frequencia-label"><g:fieldValue bean="${materiaSemestreInstance}" field="frequencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.disciplina}">
				<li class="fieldcontain">
					<span id="disciplina-label" class="property-label"><g:message code="materiaSemestre.disciplina.label" default="Disciplina" /></span>
					
						<span class="property-value" aria-labelledby="disciplina-label"><g:link controller="disciplina" action="show" id="${materiaSemestreInstance?.disciplina?.id}">${materiaSemestreInstance?.disciplina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.professor}">
				<li class="fieldcontain">
					<span id="professor-label" class="property-label"><g:message code="materiaSemestre.professor.label" default="Professor" /></span>
					
						<span class="property-value" aria-labelledby="professor-label"><g:link controller="professor" action="show" id="${materiaSemestreInstance?.professor?.id}">${materiaSemestreInstance?.professor?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaSemestreInstance?.semestre}">
				<li class="fieldcontain">
					<span id="semestre-label" class="property-label"><g:message code="materiaSemestre.semestre.label" default="Semestre" /></span>
					
						<span class="property-value" aria-labelledby="semestre-label"><g:link controller="semestre" action="show" id="${materiaSemestreInstance?.semestre?.id}">${materiaSemestreInstance?.semestre?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materiaSemestreInstance?.id}" />
					<g:link class="edit" action="edit" id="${materiaSemestreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
