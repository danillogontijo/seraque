

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'dadosExtrato.label', default: 'DadosExtrato')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-dadosExtrato" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-dadosExtrato" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list dadosExtrato">
			
				<g:if test="${dadosExtratoInstance?.horasExtraCurriculares}">
				<li class="fieldcontain">
					<span id="horasExtraCurriculares-label" class="property-label"><g:message code="dadosExtrato.horasExtraCurriculares.label" default="Horas Extra Curriculares" /></span>
					
						<span class="property-value" aria-labelledby="horasExtraCurriculares-label"><g:fieldValue bean="${dadosExtratoInstance}" field="horasExtraCurriculares"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${dadosExtratoInstance?.aluno}">
				<li class="fieldcontain">
					<span id="aluno-label" class="property-label"><g:message code="dadosExtrato.aluno.label" default="Aluno" /></span>
					
						<span class="property-value" aria-labelledby="aluno-label"><g:link controller="aluno" action="show" id="${dadosExtratoInstance?.aluno?.id}">${dadosExtratoInstance?.aluno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${dadosExtratoInstance?.id}" />
					<g:link class="edit" action="edit" id="${dadosExtratoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
