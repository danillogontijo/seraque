

import static org.junit.Assert.*
import org.junit.*

class AlunoTests {

    @Before
    void setUp() {
        // Setup logic here
    }

    @After
    void tearDown() {
        // Tear down logic here
    }

    @Test
    void testInsercao() {

        def aluno = new Aluno()
        aluno.nome = 'teste'
        aluno.matricula = '09123'
        aluno.senha = '090909'
        aluno.email = 'lucas@teste.com'
        assertTrue aluno.validate()
        assertTrue aluno.validate()
        assertTrue aluno.validate()

    }
}
