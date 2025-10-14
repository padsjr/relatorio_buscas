import os

class Config:
    """Configurações base da aplicação"""
    
    # Configurações do Flask
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'dev-secret-key-change-in-production'
    DEBUG = os.environ.get('FLASK_DEBUG', 'False').lower() == 'true'
    
    # Configurações do banco de dados
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///relatorios.db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    
    # Configurações de upload
    UPLOAD_FOLDER = 'static/uploads'
    MAX_CONTENT_LENGTH = 16 * 1024 * 1024  # 16MB max file size
    ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'bmp', 'tiff', 'webp'}
    
    # Configurações de templates
    TEMPLATE_INTRODUCAO = 'modelo_introducao_buscas.docx'
    TEMPLATE_DIAS = 'modelo_buscas_por_dias.docx'
    TEMPLATE_FINAL = 'modelo_resultado_final_buscas.docx'

class DevelopmentConfig(Config):
    """Configurações para desenvolvimento"""
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = 'sqlite:///relatorios_dev.db'

class ProductionConfig(Config):
    """Configurações para produção"""
    DEBUG = False
    # Em produção, configure variáveis de ambiente apropriadas
    SECRET_KEY = os.environ.get('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URL') or 'sqlite:///relatorios.db'

# Configuração padrão baseada na variável de ambiente
config = {
    'development': DevelopmentConfig,
    'production': ProductionConfig,
    'default': DevelopmentConfig
}
