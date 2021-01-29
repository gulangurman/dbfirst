#project setup for .net core 3.1
dotnet new mvc -f netcoreapp3.1 -o dbfirst --no-https

cd dbfirst

#all packages must target .net core 3.1
dotnet add package Microsoft.EntityFrameworkCore --version 3.1.11
dotnet add package Microsoft.EntityFrameworkCore.Design --version 3.1.11
dotnet add package Pomelo.EntityFrameworkCore.MySql --version 3.2.4

#ef cli tool can be the latest
dotnet tool install -g dotnet-ef --version 5.0.2

#create model classes and dbcontext from database
dotnet ef dbcontext scaffold "server=localhost;database=peopledb;user=peopledb_user;password=123456" Pomelo.EntityFrameworkCore.MySql -o Models -f

#code generator must target EF Core 3.1
dotnet tool install --global dotnet-aspnet-codegenerator --version 3.1.4

#use these two packages if you want to scaffold controller and/or views
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design --version 3.1.4
dotnet add package Microsoft.EntityFrameworkCore.SqlServer --version 3.1.11

#scaffold controller and views like so
dotnet aspnet-codegenerator controller -name AuthorController -m Author -dc peopledbContext -outDir Controllers -f
dotnet aspnet-codegenerator controller -name CustomerController -m Customer -dc peopledbContext -outDir Controllers --useDefaultLayout --referenceScriptLibraries -f

dotnet run
