

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'aluno.label', default: 'Aluno')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-aluno" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-aluno" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list aluno">
			
				<g:if test="${alunoInstance?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="aluno.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${alunoInstance}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.senha}">
				<li class="fieldcontain">
					<span id="senha-label" class="property-label"><g:message code="aluno.senha.label" default="Senha" /></span>
					
						<span class="property-value" aria-labelledby="senha-label"><g:fieldValue bean="${alunoInstance}" field="senha"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="aluno.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${alunoInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="aluno.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${alunoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.accountExpired}">
				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><g:message code="aluno.accountExpired.label" default="Account Expired" /></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${alunoInstance?.accountExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.accountLocked}">
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><g:message code="aluno.accountLocked.label" default="Account Locked" /></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${alunoInstance?.accountLocked}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.ativo}">
				<li class="fieldcontain">
					<span id="ativo-label" class="property-label"><g:message code="aluno.ativo.label" default="Ativo" /></span>
					
						<span class="property-value" aria-labelledby="ativo-label"><g:formatBoolean boolean="${alunoInstance?.ativo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.dadosExtrato}">
				<li class="fieldcontain">
					<span id="dadosExtrato-label" class="property-label"><g:message code="aluno.dadosExtrato.label" default="Dados Extrato" /></span>
					
						<span class="property-value" aria-labelledby="dadosExtrato-label"><g:link controller="dadosExtrato" action="show" id="${alunoInstance?.dadosExtrato?.id}">${alunoInstance?.dadosExtrato?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><g:message code="aluno.passwordExpired.label" default="Password Expired" /></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${alunoInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alunoInstance?.semestres}">
				<li class="fieldcontain">
					<span id="semestres-label" class="property-label"><g:message code="aluno.semestres.label" default="Semestres" /></span>
					
						<g:each in="${alunoInstance.semestres}" var="s">
						<span class="property-value" aria-labelledby="semestres-label"><g:link controller="semestre" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${alunoInstance?.id}" />
					<g:link class="edit" action="edit" id="${alunoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
