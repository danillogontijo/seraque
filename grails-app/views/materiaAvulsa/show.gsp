

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-materiaAvulsa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-materiaAvulsa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list materiaAvulsa">
			
				<g:if test="${materiaAvulsaInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="materiaAvulsa.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${materiaAvulsaInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaAvulsaInstance?.descricao}">
				<li class="fieldcontain">
					<span id="descricao-label" class="property-label"><g:message code="materiaAvulsa.descricao.label" default="Descricao" /></span>
					
						<span class="property-value" aria-labelledby="descricao-label"><g:fieldValue bean="${materiaAvulsaInstance}" field="descricao"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaAvulsaInstance?.cargaHoraria}">
				<li class="fieldcontain">
					<span id="cargaHoraria-label" class="property-label"><g:message code="materiaAvulsa.cargaHoraria.label" default="Carga Horaria" /></span>
					
						<span class="property-value" aria-labelledby="cargaHoraria-label"><g:fieldValue bean="${materiaAvulsaInstance}" field="cargaHoraria"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaAvulsaInstance?.nota}">
				<li class="fieldcontain">
					<span id="nota-label" class="property-label"><g:message code="materiaAvulsa.nota.label" default="Nota" /></span>
					
						<span class="property-value" aria-labelledby="nota-label"><g:fieldValue bean="${materiaAvulsaInstance}" field="nota"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaAvulsaInstance?.frequencia}">
				<li class="fieldcontain">
					<span id="frequencia-label" class="property-label"><g:message code="materiaAvulsa.frequencia.label" default="Frequencia" /></span>
					
						<span class="property-value" aria-labelledby="frequencia-label"><g:fieldValue bean="${materiaAvulsaInstance}" field="frequencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaAvulsaInstance?.semestre}">
				<li class="fieldcontain">
					<span id="semestre-label" class="property-label"><g:message code="materiaAvulsa.semestre.label" default="Semestre" /></span>
					
						<span class="property-value" aria-labelledby="semestre-label"><g:link controller="semestre" action="show" id="${materiaAvulsaInstance?.semestre?.id}">${materiaAvulsaInstance?.semestre?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${materiaAvulsaInstance?.id}" />
					<g:link class="edit" action="edit" id="${materiaAvulsaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
