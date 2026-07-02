package ubsocial.com.biblioteca.model.entity
import com.fasterxml.jackson.annotation.JsonFormat
import jakarta.persistence.*
import jakarta.validation.constraints.NotBlank
import jakarta.validation.constraints.NotNull
import jakarta.validation.constraints.Size
import java.time.LocalDate

@Entity
data class Livro(
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    val id: Long? = null,

    @field:NotBlank
    @field:Size(min = 1, max = 255, message = "Título precisa ter entre 1 e 255 caracteres")
    @Column(length = 255)
    val title: String = "",

    @field:NotBlank
    @field:Size(min = 1, max = 255, message = "Autor precisa ter entre 1 e 255 caracteres")
    @Column(length = 255)
    val author: String = "",

    @field:NotNull
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
    @Column(name = "published_date")
    val published_date: LocalDate = LocalDate.now(),

    @field:NotBlank
    @field:Size(min = 13, max = 13, message = "ISBN precisa ter 13 caracteres")
    @Column(unique = true)
    val isbn: String = "",

    val pages: Int = 0,

    @field:Size(min = 1, max = 255, message = "Capa/Gênero precisa ter entre 1 e 255 caracteres")
    @Column(length = 255)
    val cover: String? = null,

    @field:NotBlank
    @field:Size(min = 1, max = 255, message = "Idioma precisa ter entre 1 e 255 caracteres")
    @Column(length = 255)
    val language: String = ""
)