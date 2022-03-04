using xyz.Core.Interfaces;
using xyz.Domain.Models;
using xyz.Infrastructure.Interfaces;

namespace xyz.Core.Implementations
{
    public class CustomerBl : ICustomerBl
    {
        private readonly ICustomerDal _customerDal;

        public CustomerBl(ICustomerDal customerDal)
        {
            _customerDal = customerDal;
        }

        public Task<List<Customer>> GetCustomers()
        {
            try
            {
                return _customerDal.GetCustomers();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }

        public Task<List<Order>> GetCustomerOrders(int customerId)
        {
            try
            {
                return _customerDal.GetCustomerOrders(customerId);
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);
                throw;
            }
        }
    }
}
