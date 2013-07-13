



<div class="fieldcontain ${hasErrors(bean: requisitoInstance, field: 'coRequisito', 'error')} ">
	<label for="coRequisito">
		<g:message code="requisito.coRequisito.label" default="Co Requisito" />
		
	</label>
	<g:checkBox name="coRequisito" value="${requisitoInstance?.coRequisito}" />
</div>

<div class="fieldcontain ${hasErrors(bean: requisitoInstance, field: 'disciplina', 'error')} required">
	<label for="disciplina">
		<g:message code="requisito.disciplina.label" default="Disciplina" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="disciplina" name="disciplina.id" from="${Disciplina.list()}" optionKey="id" required="" value="${requisitoInstance?.disciplina?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requisitoInstance, field: 'requisito', 'error')} required">
	<label for="requisito">
		<g:message code="requisito.requisito.label" default="Requisito" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requisito" name="requisito.id" from="${Disciplina.list()}" optionKey="id" required="" value="${requisitoInstance?.requisito?.id}" class="many-to-one"/>
</div>

