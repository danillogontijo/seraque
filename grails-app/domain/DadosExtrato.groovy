

class DadosExtrato {
    Integer horasExtraCurriculares

    static belongsTo = [aluno : Aluno]

    static constraints = {
        horasExtraCurriculares min: 0 , max: 200
    }
}
