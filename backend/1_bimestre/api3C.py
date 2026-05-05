from flask import Flask, jsonify,request 
import json

app = Flask(__name__)

#função para ler o arquivo json
def carregar_turma():
    with open("turma.json", "r") as arquivo:
        dados = json.load(arquivo)
    return dados

def salvar_turma(turma):
    with open("turma.json", "w") as arquivo:
        json.dump(turma, arquivo, indent=4)
        
@app.route("/")
def home():
    return "API do 3C funcionando!" 
@app.route("/alunos")
def listar_alunos():
    turma = carregar_turma()
    return jsonify(turma)

@app.route("/alunos/<nome>")
def buscar_aluno(nome):
    turma = carregar_turma()
    for aluno in turma:
        if aluno ["nome"].lower() == nome.lower():
            return jsonify(aluno)
    return{"erro":"Aluno não encontrado"}

@app.route("/alunos/<int:id>")
def buscar_aluno_id(id):
    turma = carregar_turma()
    for aluno in turma:
        if aluno["id"] == id:
            return jsonify(aluno)
        return jsonify({"erro":"aluno não encontrado"})

@app.route("/adicionar/<nome>/<int:idade>")
def adicionar_aluno(nome, idade):
    turma = carregar_turma()
    novo_id = len(turma) + 1
    novo_aluno = {
        "id": novo_id,
        "nome": nome,
        "idade": idade
    }
    turma.append(novo_aluno)
    salvar_turma(turma)
    return jsonify({
        "mensagem":"aluno adicionado!",
        "aluno":novo_aluno
    })

@app.route("/remover/<int:id>")
def remover_aluno(id):
    turma = carregar_turma()
    for aluno in turma:
        if aluno["id"] == id:
            turma.remove(aluno)
            salvar_turma(turma)
            return jsonify({
                "mensagem": "aluno obliterado do arquivo com sucesso",
                "aluno": aluno
            })
    return jsonify({"erro":"aluno não encontrado"})

@app.route("/adicionar/alunos/form", methods=["post"])
def adicionar():
    turma = carregar_turma()
    nome = request.form["nome"]
    idade = int(request.form["idade"])

    novo_id = len(turma)+1

    novo_aluno = {
        "id": novo_id,
        "nome": nome,
        "idade": idade
    }

    turma.append(novo_aluno)

    salvar_turma(turma)

    return jsonify({
        "mensagem": "Aluno adicionar via FORM!",
        "aluno": novo_aluno
    })

@app.route("/remover/alunos/form", methods=["POST"])
def deletar():
    id = int(request.form["id"])
    return remover_aluno(id)

if __name__=="__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)