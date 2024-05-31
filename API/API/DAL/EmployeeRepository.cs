using API.DAL.Interfaces;

namespace API.DAL;

public class EmployeeRepository : IEmployeeRepository
{

    private readonly ConnectionContext _context;

    public EmployeeRepository(ConnectionContext context)
    {
        _context = context;
    }

    public void Add(Employee employee)
    {
        _context.Employees.Add(employee);
        _context.SaveChanges();
    }

    public List<Employee> Get()
    {
        return _context.Employees.ToList();
    }
}