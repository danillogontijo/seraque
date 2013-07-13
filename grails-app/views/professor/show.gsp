

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'professor.label', default: 'Professor')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-professor" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-professor" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list professor">
			
				<g:if test="${professorInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="professor.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${professorInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.disciplinas}">
				<li class="fieldcontain">
					<span id="disciplinas-label" class="property-label"><g:message code="professor.disciplinas.label" default="Disciplinas" /></span>
					
						<g:each in="${professorInstance.disciplinas}" var="d">
						<span class="property-value" aria-labelledby="disciplinas-label"><g:link controller="disciplina" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.instituicao}">
				<li class="fieldcontain">
					<span id="instituicao-label" class="property-label"><g:message code="professor.instituicao.label" default="Instituicao" /></span>
					
						<span class="property-value" aria-labelledby="instituicao-label"><g:link controller="instituicao" action="show" id="${professorInstance?.instituicao?.id}">${professorInstance?.instituicao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.materiasSemestre}">
				<li class="fieldcontain">
					<span id="materiasSemestre-label" class="property-label"><g:message code="professor.materiasSemestre.label" default="Materias Semestre" /></span>
					
						<g:each in="${professorInstance.materiasSemestre}" var="m">
						<span class="property-value" aria-labelledby="materiasSemestre-label"><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${professorInstance?.mediaAvaliacaoAlunos}">
				<li class="fieldcontain">
					<span id="mediaAvaliacaoAlunos-label" class="property-label"><g:message code="professor.mediaAvaliacaoAlunos.label" default="Media Avaliacao Alunos" /></span>
					
						<span class="property-value" aria-labelledby="mediaAvaliacaoAlunos-label"><g:fieldValue bean="${professorInstance}" field="mediaAvaliacaoAlunos"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${professorInstance?.id}" />
					<g:link class="edit" action="edit" id="${professorInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
