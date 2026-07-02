from flask import Blueprint, request, jsonify
from services.autenticacaoServices import registrar_usuario

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/register", methods=["POST"])
def register():
    data = request.json
    
    campos_obrigatorios = ["nome", "email", "senha", "data_nascimento", "objetivo_prova"]
    if not all(campo in data for campo in campos_obrigatorios):
        return jsonify({"error": "Faltam campos obrigatórios no formulário"}), 400

    resultado = registrar_usuario(data)

    if "error" in resultado:
        return jsonify({"error": resultado["error"]}), 400

    return jsonify({
        "message": "usuario criado",
        "id": resultado.get("id")
    }), 201