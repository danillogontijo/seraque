

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'disciplina.label', default: 'Disciplina')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-disciplina" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-disciplina" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list disciplina">
			
				<g:if test="${disciplinaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="disciplina.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${disciplinaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="disciplina.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${disciplinaInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.cargaHoraria}">
				<li class="fieldcontain">
					<span id="cargaHoraria-label" class="property-label"><g:message code="disciplina.cargaHoraria.label" default="Carga Horaria" /></span>
					
						<span class="property-value" aria-labelledby="cargaHoraria-label"><g:fieldValue bean="${disciplinaInstance}" field="cargaHoraria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.instituicao}">
				<li class="fieldcontain">
					<span id="instituicao-label" class="property-label"><g:message code="disciplina.instituicao.label" default="Instituicao" /></span>
					
						<span class="property-value" aria-labelledby="instituicao-label"><g:link controller="instituicao" action="show" id="${disciplinaInstance?.instituicao?.id}">${disciplinaInstance?.instituicao?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.materiasSemestre}">
				<li class="fieldcontain">
					<span id="materiasSemestre-label" class="property-label"><g:message code="disciplina.materiasSemestre.label" default="Materias Semestre" /></span>
					
						<g:each in="${disciplinaInstance.materiasSemestre}" var="m">
						<span class="property-value" aria-labelledby="materiasSemestre-label"><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.mediaAvaliacaoAlunos}">
				<li class="fieldcontain">
					<span id="mediaAvaliacaoAlunos-label" class="property-label"><g:message code="disciplina.mediaAvaliacaoAlunos.label" default="Media Avaliacao Alunos" /></span>
					
						<span class="property-value" aria-labelledby="mediaAvaliacaoAlunos-label"><g:fieldValue bean="${disciplinaInstance}" field="mediaAvaliacaoAlunos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.mediaNotas}">
				<li class="fieldcontain">
					<span id="mediaNotas-label" class="property-label"><g:message code="disciplina.mediaNotas.label" default="Media Notas" /></span>
					
						<span class="property-value" aria-labelledby="mediaNotas-label"><g:fieldValue bean="${disciplinaInstance}" field="mediaNotas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.professores}">
				<li class="fieldcontain">
					<span id="professores-label" class="property-label"><g:message code="disciplina.professores.label" default="Professores" /></span>
					
						<g:each in="${disciplinaInstance.professores}" var="p">
						<span class="property-value" aria-labelledby="professores-label"><g:link controller="professor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${disciplinaInstance?.requisitos}">
				<li class="fieldcontain">
					<span id="requisitos-label" class="property-label"><g:message code="disciplina.requisitos.label" default="Requisitos" /></span>
					
						<g:each in="${disciplinaInstance.requisitos}" var="r">
						<span class="property-value" aria-labelledby="requisitos-label"><g:link controller="requisito" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${disciplinaInstance?.id}" />
					<g:link class="edit" action="edit" id="${disciplinaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
