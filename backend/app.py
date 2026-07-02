from flask import Flask
from models.aluno import db
from database.database import db
from controllers.autenticacao import auth_bp
from controllers.aluno_controller import aluno_bp
from flask_cors import CORS
from config import Config

app = Flask(__name__)

CORS(
    app,
    resources={r"/*": {"origins": "*"}},
    methods=["GET", "POST", "PUT", "DELETE", "OPTIONS"]
)

# banco
app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///database.db"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False

db.init_app(app)


# rotas
app.register_blueprint(auth_bp)

with app.app_context():
    db.create_all()

@app.route("/")
def home():
    return "API rodando!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)
    
    
from flask import Flask, render_template


app.config.from_object(Config)

db.init_app(app)

app.register_blueprint(aluno_bp, url_prefix='/api')

@app.route('/')
def index():
    return render_template('index.html')

if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    app.run(debug=True)