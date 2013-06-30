



<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'matricula', 'error')} required">
	<label for="matricula">
		<g:message code="aluno.matricula.label" default="Matricula" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="matricula" required="" value="${alunoInstance?.matricula}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'senha', 'error')} required">
	<label for="senha">
		<g:message code="aluno.senha.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="senha" required="" value="${alunoInstance?.senha}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="aluno.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${alunoInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="aluno.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${alunoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="aluno.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${alunoInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="aluno.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${alunoInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'ativo', 'error')} ">
	<label for="ativo">
		<g:message code="aluno.ativo.label" default="Ativo" />
		
	</label>
	<g:checkBox name="ativo" value="${alunoInstance?.ativo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'dadosExtrato', 'error')} required">
	<label for="dadosExtrato">
		<g:message code="aluno.dadosExtrato.label" default="Dados Extrato" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="dadosExtrato" name="dadosExtrato.id" from="${DadosExtrato.list()}" optionKey="id" required="" value="${alunoInstance?.dadosExtrato?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="aluno.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${alunoInstance?.passwordExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: alunoInstance, field: 'semestres', 'error')} ">
	<label for="semestres">
		<g:message code="aluno.semestres.label" default="Semestres" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alunoInstance?.semestres?}" var="s">
    <li><g:link controller="semestre" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="semestre" action="create" params="['aluno.id': alunoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'semestre.label', default: 'Semestre')])}</g:link>
</li>
</ul>

</div>

