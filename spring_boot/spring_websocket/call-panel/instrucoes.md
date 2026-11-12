# Projeto Spring Boot Java Websocket

## O que é Websocket?
Protocolo de comunicação full-duplex (túnel) via conexão única TCP bidirecional entre cliente e servidor. No HTTP tradicional, cliente abre conexão web TCP, envia requisição HTTP ao servidor, que responde e encerrra conexão. Para nova comunicação, cliente precisa abrir novamente conexão. WebSocket mantém conexão aberta/persistente, com menor latência, permitindo comunicação assíncrona constante entre cliente e servidor em tempo real, via eventos, sendo ideal para aplicações como chats, games, notificações em tempo real, dashboards, aplicações financeiras, etc. Spring Boot utiliza STOMP (Simple Text Oriented Messaging Protocol) sobre WebSocket, suportando mensagens de texto e binárias, com tópicos e filas.

## 1. Criar projeto (start.spring.io):
- Project: Gradle - Groovy
- Language: Java
- Spring Boot: 4.1.2 (mais recente)
- Group: com.example
- Artifact: call-panel
- Name: call-panel
- Package name: com.example.call-panel
- Packaging: Jar
- Configuration: Properties
- Java: 27
- Dependencies:
    - Spring Web
    - Spring Data JPA
    - Oracle Driver
    - Lombok (responsável por gerar getters, setters, construtores, etc)
    - Spring Boot DevTools
    - Websocket
Generate

## 2. Configurar banco de dados Oracle:
- Executar 'docker-compose up' (requer Docker em execução)
- Conectar SGBD:
    - Driver: Oracle
    - Connection Type: Service Name
    - Hostname: localhost
    - Port: 1521
    - Service: FREEPDB1
    - Driver: Thin
    - Authentication: User & Password
    - User: system
    - Password: senha123
- Testar conexão, e confirmar
- Configurar conexão do projeto em 'application.properties'
- Executar projeto: .\gradlew bootRun
- Testar projeto no browser: http://localhost:8080 (aparecerá página com erro, pois endpoints ainda não foram implementados)

## 3. Programar projeto:
Controller acessa Service, Service acessa Repository, Repository acessa BD
- Pacote principal, criar pacotes:
    - config
    - controller
    - model / dto e entity
    - repository
    - service

- Criar entity 'Call'
- Criar repository 'CallRepository'
- Criar DTO 'CallDTO'
- Criar service 'CallService'
- Criar controller 'CallController'

## 4. Testar endpoints (Postman):
- Adicionar call (POST): http://localhost:8080/calls com Body Raw JSON: {"name": "Call 1", "room": "Room 1"}

## 5. Configurar Websocket:
- Criar classe 'WebSocketConfig' no pacote config
- Criar página HTML 'index.html' no diretório resources/static

## 6. Testar Websocket:
- Abrir página HTML no browser: http://localhost:8080
- Abrir console do browser (F12) e verificar se a conexão foi estabelecida
- Adicionar call (POST): http://localhost:8080/calls com Body Raw JSON: {"name": "Call 1", "room": "Room 1"}
- Verificar se a mensagem foi recebida no console do browser