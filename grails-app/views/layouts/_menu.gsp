<div class="panel panel-default">
	<div class="panel-body">
		<div class="btn-group btn-group">
			<a href="${createLink(uri: '/')}" class="btn btn-default btn-sm"><i
				class='fa fa-home'></i> <g:message code="default.home.label" /></a>
				
			<g:link class="btn btn-default btn-sm" action="index">
				<i class='fa fa-table'></i>
				<g:message code="default.list.label" args="[entityName]" />
			</g:link>	
			<g:link class="btn btn-default btn-sm" action="index">
				<i class='fa fa-plus'></i>
				<g:message code="default.create.label" args="[entityName]" />
			</g:link>
		</div>
	</div>
</div>