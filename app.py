#import libraries
import numpy as np
from flask import Flask, render_template,request
import pickle#Initialize the flask App
app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))

#default page of our web-app
@app.route('/')
def home():
    return render_template('index.html')

@app.route('/prediction')
def prediction_page():
    return render_template('prediction.html')

#To use the predict button in our web-app
@app.route('/predict',methods=['POST'])
def predict():
    #For rendering results on HTML GUI
    int_features = [float(x) for x in request.form.values()]
    print("******************************")
    print(int_features)
    final_features = [np.array(int_features)]
    print(final_features)
    prediction = model.predict(final_features)
    output = round(prediction[0], 2)
    print(prediction)
    print(round(prediction[0], 2))
    if output == 0:
        output = "CKD"
    else:
        output = "Not CKD" 
    print("******************************")
    return render_template('index.html', prediction_text='Your Result :{}'.format(output))

if __name__ == "__main__":
    app.run(debug=True)