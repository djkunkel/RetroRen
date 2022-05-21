# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/core/sdk:6.0 AS build
WORKDIR /bld

# copy csproj and restore as distinct layers
COPY src/*.sln .
COPY src/www/*.csproj ./www
RUN dotnet restore

# copy everything else and build app
COPY src/www/. ./www/
WORKDIR /bld/www
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
EXPOSE 80
ENTRYPOINT ["dotnet", "RetroRen.dll"]