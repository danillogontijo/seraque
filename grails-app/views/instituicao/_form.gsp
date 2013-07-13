



<div class="fieldcontain ${hasErrors(bean: instituicaoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="instituicao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${instituicaoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: instituicaoInstance, field: 'disciplinas', 'error')} ">
	<label for="disciplinas">
		<g:message code="instituicao.disciplinas.label" default="Disciplinas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${instituicaoInstance?.disciplinas?}" var="d">
    <li><g:link controller="disciplina" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="disciplina" action="create" params="['instituicao.id': instituicaoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'disciplina.label', default: 'Disciplina')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: instituicaoInstance, field: 'professores', 'error')} ">
	<label for="professores">
		<g:message code="instituicao.professores.label" default="Professores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${instituicaoInstance?.professores?}" var="p">
    <li><g:link controller="professor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="professor" action="create" params="['instituicao.id': instituicaoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'professor.label', default: 'Professor')])}</g:link>
</li>
</ul>

</div>

