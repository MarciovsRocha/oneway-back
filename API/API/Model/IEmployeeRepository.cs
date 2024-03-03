namespace API;

public interface IEmployeeRepository
{
    void Add(Employee employee);

    List<Employee> Get();

}