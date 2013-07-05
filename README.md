Sera que eu Formo??
=======

Olá tudo joia? Voc6e faz faculdade e tá tão fudido que não sabe nem mesmo se Você formará?

Bem vindo ao time!!

Pensando nisso e para ajudar você pobre estudante que provavelmente está na merda e resolvemos criar o Será Que eu formo,

que por sinal ainda não foi criado hehe

Está em desenvolvimento muuuuuuito lento e o faremos para que nós tambem possamos formar, então aguarde que tudo se ajeita!


Para meus colegas desenvolvedores que estão neste desesperado grupo de desenvolvimento, segue micro tutorial de git.


Micro Tutorial de Git

para usarmos git precisamos entender alguns termos:

Sistema de controle de versao Distriuido: 
	Sistema de controle de versao distribuido é aquele em que todos os usarios tem todo o codigo e todo o historico de seus commits e alteracoes feitas na própria maquina, no sistema de controle de versão distribuido é possível fazer diversas alteracões na sua maquina manter um historico dos commits sem que seja necessário acesso a rede de dados, ou seja, caso haja falha na rede o programador pode continuar tranquilamente fazendo seus commits locais e só depois fazer o commit de todas as alterações no repositorio comum

Commit: 
	É a alteração quando submetida, quando a alteração é realizada desde que isso deixe algum codigo funcional o programador realiza um commit, lembrando que bons commits são commits com poucos arquivos alterados, a fim de ser facil buscar aquela determinada alteração... e você vai buscar
 
Checkout: 
	Checkout é quando voce troca de branch(pode ser chamada tambem de switch branch), com checkout é possivel tambem desfazer alteracoes em algum arquivo

branch:
	é o ramo de desenvolvimento, sempre que for fazer alguma alteracao crie um branch separado para aquela alteração seu projeto pode ter infinitos branchs nao se preocupe, nomeie bem seus branchs para que você saiba em qual foi feita alteração x
	Existem alguns branchs mais importantes, ou talvez tipos de branchs
	sao eles:
		
		master e dev e Tag- Master e dev sao os mais importantes branchs, as boas praticas dizem que não se deve alterar nada no master, quando voce cria um projeto git, automaticamente voce cria um branch master ou seja, o seu branch de producao, Antes de começar a desenvolver voce criar o branch dev, nele voce cria o seu branch da primeira feature, dai nessa feature voce desenvolve e realiza commits nela mesma, assim que terminar a funcionalidade desta feature voce realiza um merge com o branch dev,agora o dev está com todos os commits da feature que voce fundiu, agora eu dou merge com o master? NÃO, agora voce criará outra feature e continuará o desenvolvimento, apenas quando voce tiver uma versao de producao voce irá juntar a master, e seria interessante voce criar uma release para isso, sempre que você tiver uma versão pronta para produção voce da um commit no master voce pode criar uma tag tambem, tags são as "versoes" e são imutáveis, você não faz commits em tags, elas são interessantes quando é necessario voltar uma versao de codigo. 
		
		
		hotfix  - Voce cria um hotfix apartir da sua versão de produção para fazer pequenas alterações
		feature - São branchs de desenvolvimento de novas funcionalidades
		release - Quando voce resolve que tem uma versao de producao é normal que no seu diretorio de desenvolvimento esteja com codigo que não deve ser visto pelo usuário final, como logs e melhoramento de desempenho, para isso cria-se uma release antes de mandar para o branch master e criar uma tag para aquela versao/release
		
respoitorio: é onde seu cófigo está salvo.


Mao na massa:
	Se voce usa windows ou Mac baixe o source-tree
	Se voce usa linux baixe o SmartGit

Por que nao usar a ide? pode ser usado mas esses programas apesar de separados sao proprios para isso, e bem estruturados para esse sistema de controle de versao, pode nao ser na mesma tela, mas e daí? é só usar o alt tab e pronto, melhor até do que mudar sua perspectiva
