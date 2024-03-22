using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.AspNetCore.Http;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace OneWay.EmpresaAPI;

public static class GetAllProducts
{
    [FunctionName("GetAllProducts")]
    public static async Task<IActionResult> RunAsync(
        [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "products")] HttpRequest req)
    {
        var producList = Enumerable.Range(1, 10).Select(
            index=> new Product
            {
                Id = Random.Shared.Next(1,100), 
                Price = Random.Shared.NextDouble()
            }).ToArray();
        return new OkObjectResult(producList);
    }
}