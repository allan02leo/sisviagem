<%@ page import="sisviagem.Solicitacao" %>



<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'origem', 'error')} required">
	<label for="origem">
		<g:message code="solicitacao.origem.label" default="Origem" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="origem" required="" value="${solicitacaoInstance?.origem}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'destino', 'error')} required">
	<label for="destino">
		<g:message code="solicitacao.destino.label" default="Destino" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="destino" required="" value="${solicitacaoInstance?.destino}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'objetivo', 'error')} required">
	<label for="objetivo">
		<g:message code="solicitacao.objetivo.label" default="Objetivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="objetivo" required="" value="${solicitacaoInstance?.objetivo}" class='form-control'/>

</div>

<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'observacoes', 'error')} ">
	<label for="observacoes">
		<g:message code="solicitacao.observacoes.label" default="Observacoes" />
		
	</label>
	<g:textField name="observacoes" value="${solicitacaoInstance?.observacoes}" class='form-control'/>

</div>

<g:hiddenField name="status" value="${solicitacaoInstance?.status}" class='form-control'/>

<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="solicitacao.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${solicitacaoInstance?.data}" class='form-control' />

</div>

<div class="form-group ${hasErrors(bean: solicitacaoInstance, field: 'qtd_pessoas', 'error')} required">
	<label for="qtd_pessoas">
		<g:message code="solicitacao.qtd_pessoas.label" default="Qtdpessoas" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="qtd_pessoas" type="number" value="${solicitacaoInstance.qtd_pessoas}" required="" class='form-control'/>

</div>


<g:hiddenField name="user.id" type="text" value="${sec.loggedInUserInfo(field:"id")}" class='form-control'/>
