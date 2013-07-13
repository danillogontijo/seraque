<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'home.css')}">
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id = "user">
			<span>Foto</span>
		</div>	

		<div id = "content-side"> 
			<div id = "content-inner">

				<div id = "academic" class ="menu"> 
					%{-- Trocar por botoes do grails com links para as referentes views   --}%
					<button id = "bt_academic"> Extrato</button>
				</div>
				
				<div id = "fluxo" class = "menu">
					%{-- Trocar por botoes do grails com links para as referentes views   --}%
					<button id = "bt_privada">Fluxo</button>
				</div>
				
				<div id = "pesquisa" class ="menu"> 
					%{-- Trocar por botoes do grails com links para as referentes views   --}%
					<button id = "bt_lupa">Pesquisa</button>
				</div>
				
				<div id = "relatorios" class ="menu">
					%{-- Trocar por botoes do grails com links para as referentes views   --}%
					<button id = "bt_relatorios">Relatorios</button>
				</div>
			</div>
		</div>
	</body>
</html>
