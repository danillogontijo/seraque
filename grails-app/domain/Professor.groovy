

class Professor {


    String nome
    Double mediaAvaliacaoAlunos

    static hasMany = [disciplinas : Disciplina,materiasSemestre : MateriaSemestre]
    static belongsTo = Disciplina
    static hasOne = [instituicao:Instituicao]

    static constraints = {
        nome blank: false, unique: true, nullable: false

    }
}
