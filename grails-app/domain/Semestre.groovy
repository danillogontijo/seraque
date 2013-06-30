

class Semestre {

    boolean concluido
    Double media

    static belongsTo = [aluno : Aluno]
    static hasMany = [materiasSemestre : MateriaSemestre,materiasAvulsas:MateriaAvulsa ]

    static constraints = {
        media nullable: false
    }
}
