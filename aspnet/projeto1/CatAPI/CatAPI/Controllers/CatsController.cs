using CatAPI.DTOs;
using CatAPI.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace CatAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatsController(ICatService service) : ControllerBase
    {
        [HttpGet]
        public async Task<ActionResult<List<CatResponse>>> GetCats()
            => Ok(await service.GetAllCatsAsync());

        [HttpGet("{id}")]
        public async Task<ActionResult<CatResponse>> GetCat(int id)
        {
            var cat = await service.GetCatByIdAsync(id);
            return cat is null ? NotFound("Gato com ID não encontrado") : Ok(cat);
        }

        [HttpPost]
        public async Task<ActionResult<CatResponse>> AddCat(CreateCatRequest cat)
        {
            var createdCat = await service.AddCatAsync(cat);
            return CreatedAtAction(nameof(GetCat), new { id = createdCat.Id }, createdCat);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<CatResponse>> UpdateCat(int id, UpdateCatRequest cat)
        {
            var updated = await service.UpdateCatAsync(id, cat);
            return updated ? Ok() : NotFound("Gato com ID não encontrado");
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteCat(int id)
        {
            var deleted = await service.DeleteCatAsync(id);
            return deleted ? NoContent() : NotFound("Gato com ID não encontrado");
        }
    }
}