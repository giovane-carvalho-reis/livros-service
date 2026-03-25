# Dockerfile para aplicação Spring Boot
FROM eclipse-temurin:25-jre-alpine

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia o jar gerado pelo Maven para o container
COPY target/livros-service-0.0.1-SNAPSHOT.jar app.jar

# Expõe a porta padrão do Spring Boot
EXPOSE 9191

# Comando para rodar a aplicação
ENTRYPOINT ["java","-jar","app.jar"]