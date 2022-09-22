from app import create_app
import os
import pytest
import json

@pytest.fixture
def client():
    app = create_app()
    app.config['TESTING']=True
    app.config['DEBUG']=True
    app.config['WTF_CSRF_ENABLED'] = False


    with app.test_client() as client:
        yield client



def test_get_products(client):
    rv = client.get('/api/v1/products')
    rv_data = json.loads(rv.data)
    assert rv.status_code  == 200, rv.data
    assert len(rv_data) == 6
 
 