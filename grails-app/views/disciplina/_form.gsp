



<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="disciplina.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${disciplinaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="disciplina.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${disciplinaInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'cargaHoraria', 'error')} required">
	<label for="cargaHoraria">
		<g:message code="disciplina.cargaHoraria.label" default="Carga Horaria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cargaHoraria" from="${disciplinaInstance.constraints.cargaHoraria.inList}" required="" value="${fieldValue(bean: disciplinaInstance, field: 'cargaHoraria')}" valueMessagePrefix="disciplina.cargaHoraria"/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'instituicao', 'error')} required">
	<label for="instituicao">
		<g:message code="disciplina.instituicao.label" default="Instituicao" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="instituicao" name="instituicao.id" from="${Instituicao.list()}" optionKey="id" required="" value="${disciplinaInstance?.instituicao?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'materiasSemestre', 'error')} ">
	<label for="materiasSemestre">
		<g:message code="disciplina.materiasSemestre.label" default="Materias Semestre" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${disciplinaInstance?.materiasSemestre?}" var="m">
    <li><g:link controller="materiaSemestre" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materiaSemestre" action="create" params="['disciplina.id': disciplinaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materiaSemestre.label', default: 'MateriaSemestre')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'mediaAvaliacaoAlunos', 'error')} required">
	<label for="mediaAvaliacaoAlunos">
		<g:message code="disciplina.mediaAvaliacaoAlunos.label" default="Media Avaliacao Alunos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mediaAvaliacaoAlunos" value="${fieldValue(bean: disciplinaInstance, field: 'mediaAvaliacaoAlunos')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'mediaNotas', 'error')} required">
	<label for="mediaNotas">
		<g:message code="disciplina.mediaNotas.label" default="Media Notas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="mediaNotas" value="${fieldValue(bean: disciplinaInstance, field: 'mediaNotas')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'professores', 'error')} ">
	<label for="professores">
		<g:message code="disciplina.professores.label" default="Professores" />
		
	</label>
	<g:select name="professores" from="${Professor.list()}" multiple="multiple" optionKey="id" size="5" value="${disciplinaInstance?.professores*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: disciplinaInstance, field: 'requisitos', 'error')} ">
	<label for="requisitos">
		<g:message code="disciplina.requisitos.label" default="Requisitos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${disciplinaInstance?.requisitos?}" var="r">
    <li><g:link controller="requisito" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requisito" action="create" params="['disciplina.id': disciplinaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requisito.label', default: 'Requisito')])}</g:link>
</li>
</ul>

</div>

