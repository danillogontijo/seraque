



<div class="fieldcontain ${hasErrors(bean: dadosExtratoInstance, field: 'horasExtraCurriculares', 'error')} required">
	<label for="horasExtraCurriculares">
		<g:message code="dadosExtrato.horasExtraCurriculares.label" default="Horas Extra Curriculares" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="horasExtraCurriculares" type="number" min="0" max="200" value="${dadosExtratoInstance.horasExtraCurriculares}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: dadosExtratoInstance, field: 'aluno', 'error')} required">
	<label for="aluno">
		<g:message code="dadosExtrato.aluno.label" default="Aluno" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="aluno" name="aluno.id" from="${Aluno.list()}" optionKey="id" required="" value="${dadosExtratoInstance?.aluno?.id}" class="many-to-one"/>
</div>

