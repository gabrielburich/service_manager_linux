# service_manager_linux
Gerenciador para executar um script como um serviço Linux.

Instalação
==========

Insira ou crie um link simbolico do arquivo no diretorio /etc/init.d

Configure as Constantes do script:

SERVICE_DIR -> Diretório onde do script, ex: /opt/scripts
SERVICE_NAME -> Nome do script, ex: hello.sh
SERVICE_PID_FILE -> Arquivo contendo o PID do serviço.


Utilização
==========

service service_name status/stop/start/restart


