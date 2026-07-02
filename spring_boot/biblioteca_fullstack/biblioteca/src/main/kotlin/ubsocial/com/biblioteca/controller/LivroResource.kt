package ubsocial.com.biblioteca.controller
import jakarta.validation.Valid
import org.springframework.http.HttpStatus
import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.*
import ubsocial.com.biblioteca.model.entity.Livro
import ubsocial.com.biblioteca.model.repositories.LivroRepository

@RestController
@RequestMapping("/books")
class LivroResource(private val livroRepository: LivroRepository) {

    @GetMapping
    fun getAll(): List<Livro> = livroRepository.findAll()
    
    @GetMapping("/{id}")
    fun getById(@PathVariable id: Long): ResponseEntity<Livro> {
        val livro = livroRepository.findById(id)
        return if (livro.isPresent) ResponseEntity.ok(livro.get())
        else ResponseEntity.notFound().build()
    }

    @PostMapping
    fun create(@RequestBody @Valid livro: Livro): Livro = livroRepository.save(livro)

    @PutMapping("/{id}")
    fun update(@PathVariable id: Long, @RequestBody @Valid livro: Livro): ResponseEntity<Livro> {
        val optional = livroRepository.findById(id)
        if (optional.isEmpty) return ResponseEntity.notFound().build()

        val updated = optional.get().copy(
            title = livro.title,
            author = livro.author,
            published_date = livro.published_date,
            isbn = livro.isbn,
            pages = livro.pages,
            cover = livro.cover,
            language = livro.language
        )
        return ResponseEntity.ok(livroRepository.save(updated))
    }

    @DeleteMapping("/{id}")
    fun delete(@PathVariable id: Long): ResponseEntity<Void> {
        return if (livroRepository.existsById(id)) {
            livroRepository.deleteById(id)
            ResponseEntity.noContent().build()
        } else {
            ResponseEntity.notFound().build()
        }
    }
}