using xyz.Core.Implementations;
using xyz.Core.Interfaces;
using xyz.Infrastructure.Implementations;
using xyz.Infrastructure.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

IConfiguration configuration = builder.Configuration;

builder.Services.AddSingleton<ICustomerDal, CustomerDal>(serviceProvider => new CustomerDal(configuration.GetValue<string>("Database:ConnectionString"))); ;
builder.Services.AddSingleton<ICustomerBl, CustomerBl>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Customer}/{action=Index}/{id?}");

app.Run();
