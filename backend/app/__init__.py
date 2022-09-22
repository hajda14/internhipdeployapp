from flask import Flask, jsonify
from flask_cors import CORS
import json
import os



cors = CORS()

def create_app(settings_override=None):
    app = Flask(__name__)
    
    CORS(app) 
    etc_dir="/etc/internship"
    root = os.path.join(app.root_path)
    
    @app.route("/api/v1/products")
    def api_products():
        try:  
            if app.debug:
                products_path=os.path.join(root,"products.json")
            else:
                products_path=os.path.join(etc_dir,"products.json")
                                        
            print(f"openning file: {products_path}")
            with open(os.path.join(products_path),"r") as f:
                return json.load(f)         
        
        except IOError as e:
            return jsonify({"status":"Error","message":f"I/O error({e.errno}): {e.strerror}"}), 503
    
    return app


    
    
    
# def main():
#     app.run(host="0.0.0.0",port=5640)
    
# if __name__ == "__main__":
#     main()



