package ubsocial.com.biblioteca.controller;
import java.util.List;
import java.util.Optional;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import jakarta.validation.Valid;
import ubsocial.com.biblioteca.model.entity.Livro;
import ubsocial.com.biblioteca.model.repositories.LivroRepository;

@RestController
@RequestMapping("/livros")
public class LivroResource {
    private LivroRepository livroRepository;

    public LivroResource(LivroRepository livroRepository) {
        this.livroRepository = livroRepository;
    }

    @GetMapping
    public List<Livro> get() {
        return livroRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Livro> get(@PathVariable Long id) {
        Optional<Livro> optional = livroRepository.findById(id);
        if(!optional.isPresent()) {
            return new ResponseEntity<Livro>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Livro>(optional.get(), HttpStatus.OK);
    }

    @PostMapping
     public Livro create(@RequestBody @Valid Livro livro) {
        return livroRepository.save(livro);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Livro> update(@PathVariable Long id, @RequestBody @Valid Livro livro) {
        Optional<Livro> optional = livroRepository.findById(id);
        if(!optional.isPresent()) {
            return new ResponseEntity<Livro>(HttpStatus.NOT_FOUND);
        }
        Livro livroAux = optional.get();
        livroAux.setTitulo(livro.getTitulo());
        livroAux.setAutor(livro.getAutor());
        livroAux.setDataPublicacao(livro.getDataPublicacao());
        livroAux.setIsbn(livro.getIsbn());
        livroAux.setPaginas(livro.getPaginas());
        livroRepository.save(livroAux);
        return new ResponseEntity<Livro>(livroAux, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Livro> delete(@PathVariable Long id) {
        if(!livroRepository.existsById(id)) {
            return new ResponseEntity<Livro>(HttpStatus.NOT_FOUND);
        }
        livroRepository.deleteById(id);
        return new ResponseEntity<Livro>(HttpStatus.NO_CONTENT);
    }
}