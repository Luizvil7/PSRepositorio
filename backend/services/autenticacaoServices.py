from models.aluno import Aluno 
from database.database import db
from werkzeug.security import generate_password_hash
from datetime import datetime

def registrar_usuario(dados):
    email = dados["email"]
    
    usuario_existente = Aluno.query.filter_by(email=email).first()
    if usuario_existente:
        return {"error": "Email já cadastrado no sistema"}
    
    senha_hash = generate_password_hash(dados["senha"])
    
    try:
        data_nasc = datetime.strptime(dados["data_nascimento"], '%Y-%m-%d').date()
    except Exception:
        return {"error": "Formato de data inválido. Use AAAA-MM-DD"}

    novo_usuario = Aluno(
        nome=dados["nome"],
        email=email,
        senha=senha_hash,
        data_nascimento=data_nasc,
        objetivo_prova=dados["objetivo_prova"]
    )
    
    db.session.add(novo_usuario)
    db.session.commit()
    
    return {"message": "Usuário criado com sucesso", "id": novo_usuario.id_aluno}