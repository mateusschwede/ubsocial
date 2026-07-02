package ubsocial.com.biblioteca.model.repositories
import org.springframework.data.jpa.repository.JpaRepository
import ubsocial.com.biblioteca.model.entity.Livro

interface LivroRepository : JpaRepository<Livro, Long>