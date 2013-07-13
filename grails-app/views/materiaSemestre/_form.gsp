



<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'comentarioProfessor', 'error')} ">
	<label for="comentarioProfessor">
		<g:message code="materiaSemestre.comentarioProfessor.label" default="Comentario Professor" />
		
	</label>
	<g:textField name="comentarioProfessor" value="${materiaSemestreInstance?.comentarioProfessor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'comentarioDisiplina', 'error')} ">
	<label for="comentarioDisiplina">
		<g:message code="materiaSemestre.comentarioDisiplina.label" default="Comentario Disiplina" />
		
	</label>
	<g:textField name="comentarioDisiplina" value="${materiaSemestreInstance?.comentarioDisiplina}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'avaliacaoDisciplina', 'error')} ">
	<label for="avaliacaoDisciplina">
		<g:message code="materiaSemestre.avaliacaoDisciplina.label" default="Avaliacao Disciplina" />
		
	</label>
	<g:field name="avaliacaoDisciplina" type="number" min="0" max="5" value="${materiaSemestreInstance.avaliacaoDisciplina}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'avaliacaoProfessor', 'error')} ">
	<label for="avaliacaoProfessor">
		<g:message code="materiaSemestre.avaliacaoProfessor.label" default="Avaliacao Professor" />
		
	</label>
	<g:field name="avaliacaoProfessor" type="number" min="0" max="5" value="${materiaSemestreInstance.avaliacaoProfessor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="materiaSemestre.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: materiaSemestreInstance, field: 'nota')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'frequencia', 'error')} required">
	<label for="frequencia">
		<g:message code="materiaSemestre.frequencia.label" default="Frequencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frequencia" type="number" value="${materiaSemestreInstance.frequencia}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'disciplina', 'error')} required">
	<label for="disciplina">
		<g:message code="materiaSemestre.disciplina.label" default="Disciplina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="disciplina" name="disciplina.id" from="${Disciplina.list()}" optionKey="id" required="" value="${materiaSemestreInstance?.disciplina?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'professor', 'error')} required">
	<label for="professor">
		<g:message code="materiaSemestre.professor.label" default="Professor" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="professor" name="professor.id" from="${Professor.list()}" optionKey="id" required="" value="${materiaSemestreInstance?.professor?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaSemestreInstance, field: 'semestre', 'error')} required">
	<label for="semestre">
		<g:message code="materiaSemestre.semestre.label" default="Semestre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="semestre" name="semestre.id" from="${Semestre.list()}" optionKey="id" required="" value="${materiaSemestreInstance?.semestre?.id}" class="many-to-one"/>
</div>

