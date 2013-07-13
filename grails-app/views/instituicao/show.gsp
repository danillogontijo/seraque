

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'instituicao.label', default: 'Instituicao')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-instituicao" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-instituicao" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list instituicao">
			
				<g:if test="${instituicaoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="instituicao.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${instituicaoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${instituicaoInstance?.disciplinas}">
				<li class="fieldcontain">
					<span id="disciplinas-label" class="property-label"><g:message code="instituicao.disciplinas.label" default="Disciplinas" /></span>
					
						<g:each in="${instituicaoInstance.disciplinas}" var="d">
						<span class="property-value" aria-labelledby="disciplinas-label"><g:link controller="disciplina" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${instituicaoInstance?.professores}">
				<li class="fieldcontain">
					<span id="professores-label" class="property-label"><g:message code="instituicao.professores.label" default="Professores" /></span>
					
						<g:each in="${instituicaoInstance.professores}" var="p">
						<span class="property-value" aria-labelledby="professores-label"><g:link controller="professor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${instituicaoInstance?.id}" />
					<g:link class="edit" action="edit" id="${instituicaoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
