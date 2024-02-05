using HelloDoc.Models;
using Microsoft.AspNetCore.Mvc;
using Npgsql;
using System.Diagnostics;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace HelloDoc.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly string _connectionString;

        public HomeController(ILogger<HomeController> logger, IConfiguration configuration)
        {
            _logger = logger;
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }
     
        [HttpGet]
        public async Task<ActionResult<IEnumerable<emp_details>>> Index()
        {
            var products = new List<emp_details>();

            using (var connection = new NpgsqlConnection(_connectionString))
            {
                await connection.OpenAsync();

                using (var cmd = new NpgsqlCommand("SELECT * FROM emp_details", connection))
                using (var reader = await cmd.ExecuteReaderAsync())
                {
                    while (await reader.ReadAsync())
                    {
                        var product = new emp_details
                        {
                            emp_id = reader.GetInt32(reader.GetOrdinal("emp_id")),
                            emp_name = reader.GetString(reader.GetOrdinal("emp_name")),
                            emp_designation = reader.GetString(reader.GetOrdinal("emp_designation")),
                            emp_location = reader.GetString(reader.GetOrdinal("emp_location"))
                            // Add other properties accordingly
                        };
                        products.Add(product);
                    }
                }
            }

            return View(products);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}


