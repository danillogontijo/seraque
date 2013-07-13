

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requisito.label', default: 'Requisito')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requisito" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requisito" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requisito">
			
				<g:if test="${requisitoInstance?.coRequisito}">
				<li class="fieldcontain">
					<span id="coRequisito-label" class="property-label"><g:message code="requisito.coRequisito.label" default="Co Requisito" /></span>
					
						<span class="property-value" aria-labelledby="coRequisito-label"><g:formatBoolean boolean="${requisitoInstance?.coRequisito}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${requisitoInstance?.disciplina}">
				<li class="fieldcontain">
					<span id="disciplina-label" class="property-label"><g:message code="requisito.disciplina.label" default="Disciplina" /></span>
					
						<span class="property-value" aria-labelledby="disciplina-label"><g:link controller="disciplina" action="show" id="${requisitoInstance?.disciplina?.id}">${requisitoInstance?.disciplina?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requisitoInstance?.requisito}">
				<li class="fieldcontain">
					<span id="requisito-label" class="property-label"><g:message code="requisito.requisito.label" default="Requisito" /></span>
					
						<span class="property-value" aria-labelledby="requisito-label"><g:link controller="disciplina" action="show" id="${requisitoInstance?.requisito?.id}">${requisitoInstance?.requisito?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requisitoInstance?.id}" />
					<g:link class="edit" action="edit" id="${requisitoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
