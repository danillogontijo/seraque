

class Instituicao {
    String nome

    static hasMany = [professores:Professor, disciplinas: Disciplina]

    static constraints = {
        nome blank: false, unique: true, nullable: false
    }

    String toString (){
    	"${this.nome}"
    }
}
