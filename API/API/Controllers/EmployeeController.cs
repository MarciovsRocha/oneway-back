using API.DAL;
using API.ViewModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace API.Controllers;

[ApiController]
[Route("api/v1/emploee")]
public class EmployeeController : ControllerBase
{
    private readonly IEmployeeRepository _employeeRepository = new EmployeeRepository();
    

    [HttpPost]
    public IActionResult Add(EmployeeViewModel employeeView)
    {
        _employeeRepository.Add(new Employee(employeeView.name, employeeView.age, "null"));
        return Ok();
    }

    [HttpGet]
    public IActionResult Get()
    {
        var employees = _employeeRepository.Get();
        return Ok(employees);
    }
}