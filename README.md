# 🤖 AI Generetor

Um projeto de App para testar as possibilidades utilizando a API da [OpenAI](https://openai.com/), para gerar diversos tipos de conteúdo com inteligência artificial. O projeto foi desenvolvido em Flutter com BloC e seguindo os padrões propostos pela  Clean Architecture.

<p align="middle">
<img src="https://github.com/jonathan1313/Ai-Image-Generation/blob/clean-arch/images-examples/image-generation-example.gif" width="30%">
<img src="https://github.com/jonathan1313/Ai-Image-Generation/blob/clean-arch/images-examples/text-generation-example.gif" width="30%">
<img src="https://github.com/jonathan1313/Ai-Image-Generation/blob/clean-arch/images-examples/chat-ai-example.gif" width="30%">
</p>

## 🚀 Configurando para Utilizar

### Instalação Flutter

Para iniciar o projeto antes de mais nada se certifique que o Flutter SDK está instalado e configurado corretamente em sua máquina e que está usando a versão mais recente. 

É possível fazer essa verificação utilizando o comando abaixo:
```
flutter doctor
```
Caso você não possua o Flutter instalado a [Documentação Oficial](https://docs.flutter.dev/get-started/install) oferece instruções detalhas de como fazer todas as configurações necessárias.

### Gerando um Key na OpenAI

Para ter acesso às requisições será necessário criar uma API KEY na [Plataforma da OpenAI](https://platform.openai.com/).

Basta acessar a plataforma e criar uma conta, ao fazer login será possível clicar em seu perfil no canto superior direito, onde estará escrito ‘Personal’. Clique em ‘View API keys’ e na tela que vai abrir clique em ‘Create new secret key’. Após isso sua nova chave será gerada e poderá ser copiada, guarde-a em um local seguro.

Essa API não é gratuita, mas eles oferecem $18.00 para novas contas com validade de 90 dias. O suficiente para fazer teste e estudar os recursos. Caso após esgotar todo seu saldo ou a validade, é possível cadastrar um forma de pagamento e continuar utilizando a API, a cobrança é feita em cima de cada requisição e no site oficial é possível ter mais detalhes.

(P.S. Usei a mesma KEY por mais de 2 meses, fazendo requisições diariamente tanto de imagens quanto de texto, e até esse momento ainda tenho saldo disponível. Então acredito que seja possível testar bastante antes de ter que gastar algum dinheiro.)

### Inicializando o Projeto

Escolha uma pasta de sua preferência e utilizando o terminal use o seguinte comando para clonar o repositorio:
```
git clone https://github.com/jonathan1313/Ai-Image-Generation.git
```

Após o processo terminar, acesse a pasta criada:
```
cd Ai-Image-Generation/
```

Instale os pacotes do Flutter:
```
flutter pub get
```

Abra o projeto em sua IDE:
```
cd .
```

Acesse a pasta lib -> core e no arquivo ‘api_constants.example.dart’, no parâmetro ‘secretKey’ substitua o valor ‘YOUR_OPENAI_API_KEY_HERE’ por sua chave gerada no site da OpenAI.

Após isso salve o arquivo, e renomeie-o, removendo o ‘.example’ devendo ficar com nome ‘api_constants.dart’.

Com isso já é possível executar o App utilizando o comando ```flutter run``` ou usando o comando próprio de sua IDE.

[⬆ Voltar ao topo](https://github.com/jonathan1313/Ai-Image-Generation)<br>