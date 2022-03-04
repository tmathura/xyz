namespace xyz.Domain.Models
{
    public class Order
    {
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public int ReferenceNumber { get; set; }
        public DateTime AddedDate { get; set; }
        public bool Cancelled { get; set; }
        public bool Returned { get; set; }
        public bool Invoiced { get; set; }
    }
}
