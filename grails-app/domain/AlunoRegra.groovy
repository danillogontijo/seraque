

import org.apache.commons.lang.builder.HashCodeBuilder

class AlunoRegra implements Serializable {

	Aluno aluno
	Regra regra

	boolean equals(other) {
		if (!(other instanceof AlunoRegra)) {
			return false
		}

		other.aluno?.id == aluno?.id &&
			other.regra?.id == regra?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (aluno) builder.append(aluno.id)
		if (regra) builder.append(regra.id)
		builder.toHashCode()
	}

	static AlunoRegra get(long alunoId, long regraId) {
		find 'from AlunoRegra where aluno.id=:alunoId and regra.id=:regraId',
			[alunoId: alunoId, regraId: regraId]
	}

	static AlunoRegra create(Aluno aluno, Regra regra, boolean flush = false) {
		new AlunoRegra(aluno: aluno, regra: regra).save(flush: flush, insert: true)
	}

	static boolean remove(Aluno aluno, Regra regra, boolean flush = false) {
		AlunoRegra instance = AlunoRegra.findByAlunoAndRegra(aluno, regra)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Aluno aluno) {
		executeUpdate 'DELETE FROM AlunoRegra WHERE aluno=:aluno', [aluno: aluno]
	}

	static void removeAll(Regra regra) {
		executeUpdate 'DELETE FROM AlunoRegra WHERE regra=:regra', [regra: regra]
	}

	static mapping = {
		id composite: ['regra', 'aluno']
		version false
	}
}
