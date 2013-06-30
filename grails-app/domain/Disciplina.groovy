

class Disciplina {

    String nome
    String descricao
    Integer cargaHoraria
    Double mediaNotas
    Double mediaAvaliacaoAlunos

    static hasMany = [requisitos:Requisito, professores: Professor, materiasSemestre : MateriaSemestre]
    static belongsTo = [instituicao:Instituicao]


    static constraints = {
        nome blank: false, unique: true, nullable: false
        descricao blank: false, unique: true, nullable: false
        cargaHoraria inList: [16,32,64,128], nullable: false

    }
}
