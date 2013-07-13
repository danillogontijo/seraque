



<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="professor.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${professorInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'disciplinas', 'error')} ">
	<label for="disciplinas">
		<g:message code="professor.disciplinas.label" default="Disciplinas" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'instituicao', 'error')} required">
	<label for="instituicao">
		<g:message code="professor.instituicao.label" default="Instituicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instituicao" name="instituicao.id" from="${Instituicao.list()}" optionKey="id" required="" value="${professorInstance?.instituicao?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'materiasSemestre', 'error')} ">
	<label for="materiasSemestre">
		<g:message code="professor.materiasSemestre.label" default="Materias Semestre" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${professorInstance?.materiasSemestre?}" var="m">
    <li><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materiaSemestre" action="create" params="['professor.id': professorInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: professorInstance, field: 'mediaAvaliacaoAlunos', 'error')} required">
	<label for="mediaAvaliacaoAlunos">
		<g:message code="professor.mediaAvaliacaoAlunos.label" default="Media Avaliacao Alunos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mediaAvaliacaoAlunos" value="${fieldValue(bean: professorInstance, field: 'mediaAvaliacaoAlunos')}" required=""/>
</div>

