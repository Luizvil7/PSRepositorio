from database.database import db
from datetime import datetime

class Aluno(db.Model):
    __tablename__ = 'aluno'
    
    id_aluno = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), unique=True, nullable=False)
    senha = db.Column(db.String(255), nullable=False)
    data_nascimento = db.Column(db.Date, nullable=False)
    objetivo_prova = db.Column(db.String(200), nullable=False)
    data_cadastro = db.Column(db.DateTime, default=datetime.utcnow)

    def to_dict(self):
        return {
            "id_aluno": self.id_aluno,
            "nome": self.nome,
            "email": self.email,
            "objetivo_prova": self.objetivo_prova,
            "data_nascimento": str(self.data_nascimento)
        }