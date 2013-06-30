class MateriaAvulsa {

    String nome
    String descricao
    Integer cargaHoraria
    double nota
    Integer frequencia

    static belongsTo = [semestre:Semestre]
    
    static constraints = {
        nome blank: false, unique: true, nullable: false
        descricao blank: false, unique: true, nullable: false
        cargaHoraria inList: [16,32,64,128], nullable: false
        nota nullable: false
        frequencia nullable: false
    }
}
