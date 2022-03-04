using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using xyz.Core.Interfaces;
using xyz.WebApp.Models;

namespace xyz.WebApp.Controllers
{
    public class CustomerController : Controller
    {
        private readonly ILogger<CustomerController> _logger;
        private readonly ICustomerBl _customerBl;

        public CustomerController(ILogger<CustomerController> logger, ICustomerBl customerBl)
        {
            _logger = logger;
            _customerBl = customerBl;
        }

        public async Task<IActionResult> Index()
        {
            var model = new CustomerModel();
            var customers = await _customerBl.GetCustomers();
            model.Customer = customers;

            return View(model);
        }

        public async Task<IActionResult> CustomerOrders(int customerId)
        {
            var model = new CustomerOrdersModel();
            var orders = await _customerBl.GetCustomerOrders(customerId);
            model.Orders = orders;

            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}