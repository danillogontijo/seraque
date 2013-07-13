



<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="materiaAvulsa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${materiaAvulsaInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="materiaAvulsa.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${materiaAvulsaInstance?.descricao}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'cargaHoraria', 'error')} required">
	<label for="cargaHoraria">
		<g:message code="materiaAvulsa.cargaHoraria.label" default="Carga Horaria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="cargaHoraria" from="${materiaAvulsaInstance.constraints.cargaHoraria.inList}" required="" value="${fieldValue(bean: materiaAvulsaInstance, field: 'cargaHoraria')}" valueMessagePrefix="materiaAvulsa.cargaHoraria"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'nota', 'error')} required">
	<label for="nota">
		<g:message code="materiaAvulsa.nota.label" default="Nota" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nota" value="${fieldValue(bean: materiaAvulsaInstance, field: 'nota')}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'frequencia', 'error')} required">
	<label for="frequencia">
		<g:message code="materiaAvulsa.frequencia.label" default="Frequencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="frequencia" type="number" value="${materiaAvulsaInstance.frequencia}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaAvulsaInstance, field: 'semestre', 'error')} required">
	<label for="semestre">
		<g:message code="materiaAvulsa.semestre.label" default="Semestre" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="semestre" name="semestre.id" from="${Semestre.list()}" optionKey="id" required="" value="${materiaAvulsaInstance?.semestre?.id}" class="many-to-one"/>
</div>

