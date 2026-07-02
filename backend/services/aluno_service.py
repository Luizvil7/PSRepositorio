from models.aluno import Aluno 
from database.database import db
from datetime import datetime

class AlunoService:
    @staticmethod
    def criar_aluno(dados):
        data_nasc = datetime.strptime(dados['data_nascimento'], '%Y-%m-%d').date()
        
        objetivos_lista = dados['objetivo_prova']
        objetivos_texto = ", ".join(objetivos_lista) if isinstance(objetivos_lista, list) else objetivos_lista

        novo_aluno = Aluno(
            nome=dados['nome'],
            email=dados['email'],
            senha=dados['senha'],
            data_nascimento=data_nasc,
            objetivo_prova=objetivos_texto
        )
        db.session.add(novo_aluno)
        db.session.commit()
        return novo_aluno

    @staticmethod
    def listar_alunos():
        return Aluno.query.all()

    @staticmethod
    def buscar_aluno(id_aluno):
        return Aluno.query.get(id_aluno)

    @staticmethod
    def deletar_aluno(id_aluno):
        aluno = Aluno.query.get(id_aluno)
        if aluno:
            db.session.delete(aluno)
            db.session.commit()
            return True
        return False