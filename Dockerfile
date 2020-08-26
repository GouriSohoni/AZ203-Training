#1
FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /src
COPY ["HotelReservationSystem/HotelReservationSystem.csproj", "HotelReservationSystem/"]
COPY ["HotelReservationSystemTypes/HotelReservationSystemTypes.csproj", "HotelReservationSystemTypes/"]
RUN dotnet restore "HotelReservationSystem/HotelReservationSystem.csproj"
#2
COPY . .
WORKDIR "/src/HotelReservationSystem"
RUN dotnet build "HotelReservationSystem.csproj" -c Release -o /app
#3
RUN dotnet publish "HotelReservationSystem.csproj" -c Release -o /app
#4
EXPOSE 80
WORKDIR /app
ENTRYPOINT ["dotnet", "HotelReservationSystem.dll"]