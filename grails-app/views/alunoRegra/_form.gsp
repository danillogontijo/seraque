



<div class="fieldcontain ${hasErrors(bean: alunoRegraInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="alunoRegra.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${Aluno.list()}" optionKey="id" required="" value="${alunoRegraInstance?.aluno?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alunoRegraInstance, field: 'regra', 'error')} required">
	<label for="regra">
		<g:message code="alunoRegra.regra.label" default="Regra" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="regra" name="regra.id" from="${Regra.list()}" optionKey="id" required="" value="${alunoRegraInstance?.regra?.id}" class="many-to-one"/>
</div>

