from flask import Blueprint, request, jsonify
from services.aluno_service import AlunoService

aluno_bp = Blueprint('aluno', __name__)

@aluno_bp.route('/alunos', methods=['POST'])
def criar():
    dados = request.json
    try:
        aluno = AlunoService.criar_aluno(dados)
        return jsonify({"mensagem": "Aluno criado com sucesso", "aluno": aluno.to_dict()}), 201
    except Exception as e:
        print("Erro: ", e)
        return jsonify({"erro": str(e)}), 400

@aluno_bp.route('/alunos', methods=['GET'])
def listar():
    alunos = AlunoService.listar_alunos()
    return jsonify([aluno.to_dict() for aluno in alunos]), 200

@aluno_bp.route('/alunos/<int:id>', methods=['DELETE'])
def deletar(id):
    sucesso = AlunoService.deletar_aluno(id)
    if sucesso:
        return jsonify({"mensagem": "Aluno deletado"}), 200
    return jsonify({"erro": "Aluno não encontrado"}), 404