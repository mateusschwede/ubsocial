namespace CatAPI.DTOs
{
    public class CreateCatRequest
    {
        public string Name { get; set; } = string.Empty;
        public string Breed { get; set; } = string.Empty;
    }
}