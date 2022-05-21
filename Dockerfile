# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /bld

# copy csproj and restore as distinct layers
COPY src/*.sln .
COPY src/web/*.csproj ./web/
RUN dotnet restore

# copy everything else and build app
COPY src/web/. ./web/
WORKDIR /bld/web
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:6.0
WORKDIR /app
COPY --from=build /app ./
#support seeding on empty database
COPY --from=build /bld/web/seed ./seed
EXPOSE 80
ENTRYPOINT ["dotnet", "RetroRen.dll"]