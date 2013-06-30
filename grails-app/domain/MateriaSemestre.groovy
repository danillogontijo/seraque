class MateriaSemestre {

    double nota
    Integer frequencia
    Integer avaliacaoDisciplina
    Integer avaliacaoProfessor
    String comentarioProfessor
    String comentarioDisiplina

    static hasOne = [disciplina:Disciplina, professor:Professor]
    static belongsTo = [semestre : Semestre]

    static constraints = {
        comentarioProfessor nullable: true
        comentarioDisiplina nullable: true
        avaliacaoDisciplina nullable: true, min: 0, max: 5
        avaliacaoProfessor nullable: true, min: 0, max: 5
        nota nullable: false
        frequencia nullable: false
    }
}
