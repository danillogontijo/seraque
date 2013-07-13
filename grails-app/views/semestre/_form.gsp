



<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'media', 'error')} required">
	<label for="media">
		<g:message code="semestre.media.label" default="Media" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="media" value="${fieldValue(bean: semestreInstance, field: 'media')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="semestre.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${Aluno.list()}" optionKey="id" required="" value="${semestreInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'concluido', 'error')} ">
	<label for="concluido">
		<g:message code="semestre.concluido.label" default="Concluido" />
		
	</label>
	<g:checkBox name="concluido" value="${semestreInstance?.concluido}" />
</div>

<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'materiasAvulsas', 'error')} ">
	<label for="materiasAvulsas">
		<g:message code="semestre.materiasAvulsas.label" default="Materias Avulsas" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${semestreInstance?.materiasAvulsas?}" var="m">
    <li><g:link controller="materiaAvulsa" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materiaAvulsa" action="create" params="['semestre.id': semestreInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materiaAvulsa.label', default: 'MateriaAvulsa')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: semestreInstance, field: 'materiasSemestre', 'error')} ">
	<label for="materiasSemestre">
		<g:message code="semestre.materiasSemestre.label" default="Materias Semestre" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${semestreInstance?.materiasSemestre?}" var="m">
    <li><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materiaSemestre" action="create" params="['semestre.id': semestreInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre')])}</g:link>
</li>
</ul>

</div>

