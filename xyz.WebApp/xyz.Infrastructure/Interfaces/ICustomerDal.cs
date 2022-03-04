using xyz.Domain.Models;

namespace xyz.Infrastructure.Interfaces
{
    public interface ICustomerDal
    {
        Task<List<Customer>> GetCustomers();
        Task<List<Order>> GetCustomerOrders(int customerId);
    }
}
