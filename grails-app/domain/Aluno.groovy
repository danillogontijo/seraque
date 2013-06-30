class Aluno {

	transient springSecurityService

	String matricula
	String senha
    String email
    String nome

    static hasOne = [dadosExtrato: DadosExtrato]
    static hasMany = [semestres: Semestre]

	static constraints = {
		matricula blank: false, unique: true, nullable: false,validator: {
            matricula.matches("[1-9]*")
        }
		senha blank: false  , nullable: false
        email email: true , blank: false, unique: true, nullable: false
        nome blank: false, nullable: false
	}

	static mapping = {
		senha column: '`password`'
	}


    /*************atributos e metodos do spring security******************/
    boolean ativo
    boolean accountExpired
    boolean accountLocked
    boolean passwordExpired


	Set<Regra> getAuthorities() {

		AlunoRegra.findAllByAluno(this).collect { it.regra } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		senha = springSecurityService.encodePassword(senha)
	}
}
