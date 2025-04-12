FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build-env
WORKDIR /app
COPY . ./
RUN dotnet restore
RUN dotnet build --configuration Release
RUN dotnet publish -c Release -o ./publish

FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /jay
COPY --from=build-env /app/publish/. /jay
ENTRYPOINT ["dotnet", "ElearnBackend.dll"]

