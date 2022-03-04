using System.Data;
using System.Data.SqlClient;
using xyz.Domain.Models;
using xyz.Infrastructure.Interfaces;

namespace xyz.Infrastructure.Implementations
{
    public class CustomerDal : ICustomerDal
    {
        private readonly string _connectionString;
        public CustomerDal(string connectionString)
        {
            _connectionString = connectionString;
        }

        public async Task<List<Customer>> GetCustomers()
        {
            List<Customer> customers;
            
            await using var sqlConnection = new SqlConnection(_connectionString);
            await sqlConnection.OpenAsync();
            var sqlCommand = sqlConnection.CreateCommand();
            var sqlTransaction = sqlConnection.BeginTransaction();
            sqlCommand.Transaction = sqlTransaction;

            try
            {
                customers = await GetCustomers(sqlCommand);

                await sqlTransaction.CommitAsync();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);

                await sqlTransaction.RollbackAsync();

                throw;
            }

            return customers;
        }

        public async Task<List<Customer>> GetCustomers(SqlCommand sqlCommand)
        {
            var customers = new List<Customer>();

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "customer_get";
            sqlCommand.Parameters.Clear();

            await using var sqlDataReader = await sqlCommand.ExecuteReaderAsync();
            while (await sqlDataReader.ReadAsync())
            {
                var customer = new Customer
                {
                    Id = Convert.ToInt32(sqlDataReader["id"]),
                    Name = Convert.ToString(sqlDataReader["name"]),
                    Surname = Convert.ToString(sqlDataReader["surname"]),
                    AddressLine1 = Convert.ToString(sqlDataReader["address_line_1"]),
                    AddedDate = Convert.ToDateTime(sqlDataReader["added_date"])
                };

                customers.Add(customer);
            }

            return customers;
        }

        public async Task<List<Order>> GetCustomerOrders(int customerId)
        {
            List<Order> orders;

            await using var sqlConnection = new SqlConnection(_connectionString);
            await sqlConnection.OpenAsync();
            var sqlCommand = sqlConnection.CreateCommand();
            var sqlTransaction = sqlConnection.BeginTransaction();
            sqlCommand.Transaction = sqlTransaction;

            try
            {
                orders = await GetCustomerOrders(sqlCommand, customerId);

                await sqlTransaction.CommitAsync();
            }
            catch (Exception exception)
            {
                Console.WriteLine(exception);

                await sqlTransaction.RollbackAsync();

                throw;
            }

            return orders;
        }

        public async Task<List<Order>> GetCustomerOrders(SqlCommand sqlCommand, int customerId)
        {
            var customers = new List<Order>();

            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.CommandText = "customer_order_get";
            sqlCommand.Parameters.Clear();

            sqlCommand.Parameters.Add("@customer_id", SqlDbType.Int).Value = customerId;

            await using var sqlDataReader = await sqlCommand.ExecuteReaderAsync();
            while (await sqlDataReader.ReadAsync())
            {
                var customer = new Order
                {
                    Id = Convert.ToInt32(sqlDataReader["id"]),
                    CustomerId = Convert.ToInt32(sqlDataReader["customer_id"]),
                    ReferenceNumber = Convert.ToInt32(sqlDataReader["reference_number"]),
                    AddedDate = Convert.ToDateTime(sqlDataReader["added_date"]),
                    Cancelled = Convert.ToBoolean(sqlDataReader["cancelled"]),
                    Returned = Convert.ToBoolean(sqlDataReader["returned"]),
                    Invoiced = Convert.ToBoolean(sqlDataReader["invoiced"])
                };

                customers.Add(customer);
            }

            return customers;
        }
    }
}
