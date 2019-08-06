from flask import Flask, jsonify, request
from flask_cors import CORS

BOOKS = [
    {
        'title': 'On the Road',
        'author': 'Jack Kerouac',
        'read': True
    },
    {
        'title': 'Harry Potter and the Philosopher\'s Stone',
        'author': 'J. K. Rowling',
        'read': False
    },
    {
        'title': 'Green Eggs and Ham',
        'author': 'Dr. Seuss',
        'read': True
    }
]
#configuration
DEBUG = True

app = Flask(__name__)
app.config.from_object(__name__)

CORS(app, resources = {r'/*': {'origins': '*'}})

@app.route('/ping', methods=['GET'])
def ping_pong():
    return jsonify('pong!')
@app.route('/books', methods=['GET', 'POST'])
def all_books():
    response_obj = {'status': 'success'}
    if request.method == 'POST':
        post_data = request.get_json()
        BOOKS.append({
            'title': post_data.get('title'),
            'author': post_data.get('author'),
            'read': post_data.get('read')
        })
        response_obj['message'] = 'Book added!'
    else:
        response_obj['books'] = BOOKS
    return jsonify(response_obj)
if __name__ == '__main__':
    app.run()