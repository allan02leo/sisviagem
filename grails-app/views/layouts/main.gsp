<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="pt-BR" class="no-js">
<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails" /></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
			type="image/x-icon">
		<link rel="apple-touch-icon"
			href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114"
			href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		
		<asset:stylesheet src="application.css" />
		
		<g:layoutHead />
	</head>

	<body>
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" rel="home" href="${request.contextPath}">Sis Viagem</a>
			</div>
	
			<div class="collapse navbar-collapse">
	
				<ul class="nav navbar-nav">
					<li><g:link controller="motorista" action="index">Motorista</g:link> </li>
					<li><g:link controller="veiculo" action="index">Veículos</g:link> </li>
					<li><g:link controller="solicitacao" action="index">Solicitações</g:link></li>
					<li><g:link controller="viagem" action="index">Viagens</g:link></li>
					<li><g:link controller="user" action="index">Usuários</g:link> </li>
					
				</ul>
				
				<div class="pull-right">
					<ul class="nav navbar-nav">
					<sec:ifLoggedIn>
						<li><a>Usuário <sec:loggedInUserInfo field="username"/></a></li>
						<li><a href="${request.contextPath}/j_spring_security_logout">Sair</a>
					</sec:ifLoggedIn>
					<sec:ifNotLoggedIn>
						<li><a href="${request.contextPath}/login/auth">Login</a>
						<li><g:link controller='user' action='create'>Registrar</g:link></li>
					</sec:ifNotLoggedIn>
					</ul>
				</div>
	
			</div>
		</div>
	
	
	
		<div class='container'>
			<g:layoutBody />
		</div>
	
	
	
		
	
	</body>
</html>