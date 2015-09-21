<%@ page import="sisviagem.Viagem" %>
<%@ page import="sisviagem.ViagemStatus" %>

<div>
	<h5>Origem: <b>${solicitacao.origem }</b> - Destino: <b>${solicitacao.destino }</b></h5>
</div>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'km_saida', 'error')} required">
	<label for="km_saida">
		<g:message code="viagem.km_saida.label" default="Kmsaida" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="km_saida" value="${fieldValue(bean: viagemInstance, field: 'km_saida')}" required="" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'km_chegada', 'error')} required">
	<label for="km_chegada">
		<g:message code="viagem.km_chegada.label" default="Kmchegada" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="km_chegada" value="${fieldValue(bean: viagemInstance, field: 'km_chegada')}" required="" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'data_saida', 'error')} required">
	<label for="data_saida">
		<g:message code="viagem.data_saida.label" default="Datasaida" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_saida" precision="day"  value="${viagemInstance?.data_saida}" class='form-control' />

</div>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'data_retorno', 'error')} required">
	<label for="data_retorno">
		<g:message code="viagem.data_retorno.label" default="Dataretorno" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_retorno" precision="day"  value="${viagemInstance?.data_retorno}"  class='form-control' />

</div>


<div class="form-group ${hasErrors(bean: viagemInstance, field: 'motorista', 'error')} required">
	<label for="motorista">
		<g:message code="viagem.motorista.label" default="Motorista" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="motorista" name="motorista.id" from="${sisviagem.Motorista.list()}" optionKey="id" required="" value="${viagemInstance?.motorista?.id }" optionValue="nome" class='form-control'/>
	
</div>

<g:hiddenField id="solicitacao" name="solicitacao.id"  value="${params.id}"/>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="viagem.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${ViagemStatus.values()}" value="${ViagemStatus}" optionKey="key" class='form-control'/> 
	
</div>

<div class="form-group ${hasErrors(bean: viagemInstance, field: 'veiculo', 'error')} required">
	<label for="veiculo">
		<g:message code="viagem.veiculo.label" default="Veiculo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="veiculo" name="veiculo.id" from="${sisviagem.Veiculo.list()}" optionKey="id" required="" value="${viagemInstance?.veiculo?.id}" optionValue="placa" class='form-control'/>

</div>

