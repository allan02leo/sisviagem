<%@ page import="sisviagem.Veiculo" %>



<div class="form-group ${hasErrors(bean: veiculoInstance, field: 'placa', 'error')} required">
	<label for="placa">
		<g:message code="veiculo.placa.label" default="Placa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="placa" maxlength="8" required="" value="${veiculoInstance?.placa}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: veiculoInstance, field: 'passageiros', 'error')} required">
	<label for="passageiros">
		<g:message code="veiculo.passageiros.label" default="Passageiros" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="passageiros" type="number" value="${veiculoInstance.passageiros}" required="" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: veiculoInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="veiculo.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${veiculoInstance?.descricao}" class='form-control'/>

</div>

