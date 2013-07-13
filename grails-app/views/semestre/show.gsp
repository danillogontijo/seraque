

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'semestre.label', default: 'Semestre')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-semestre" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-semestre" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list semestre">
			
				<g:if test="${semestreInstance?.media}">
				<li class="fieldcontain">
					<span id="media-label" class="property-label"><g:message code="semestre.media.label" default="Media" /></span>
					
						<span class="property-value" aria-labelledby="media-label"><g:fieldValue bean="${semestreInstance}" field="media"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${semestreInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="semestre.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${semestreInstance?.aluno?.id}">${semestreInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${semestreInstance?.concluido}">
				<li class="fieldcontain">
					<span id="concluido-label" class="property-label"><g:message code="semestre.concluido.label" default="Concluido" /></span>
					
						<span class="property-value" aria-labelledby="concluido-label"><g:formatBoolean boolean="${semestreInstance?.concluido}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${semestreInstance?.materiasAvulsas}">
				<li class="fieldcontain">
					<span id="materiasAvulsas-label" class="property-label"><g:message code="semestre.materiasAvulsas.label" default="Materias Avulsas" /></span>
					
						<g:each in="${semestreInstance.materiasAvulsas}" var="m">
						<span class="property-value" aria-labelledby="materiasAvulsas-label"><g:link controller="materiaAvulsa" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${semestreInstance?.materiasSemestre}">
				<li class="fieldcontain">
					<span id="materiasSemestre-label" class="property-label"><g:message code="semestre.materiasSemestre.label" default="Materias Semestre" /></span>
					
						<g:each in="${semestreInstance.materiasSemestre}" var="m">
						<span class="property-value" aria-labelledby="materiasSemestre-label"><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${semestreInstance?.id}" />
					<g:link class="edit" action="edit" id="${semestreInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
