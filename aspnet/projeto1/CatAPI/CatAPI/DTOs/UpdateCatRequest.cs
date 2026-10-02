namespace CatAPI.DTOs
{
    public class UpdateCatRequest
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public string Breed { get; set; } = string.Empty;
    }
}