package ubsocial.com.biblioteca.model.repositories;
import ubsocial.com.biblioteca.model.entity.Livro;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LivroRepository extends JpaRepository<Livro, Long> {
}