using xyz.Domain.Models;

namespace xyz.Core.Interfaces
{
    public interface ICustomerBl
    {
        Task<List<Customer>> GetCustomers();
        Task<List<Order>> GetCustomerOrders(int customerId);
    }
}
