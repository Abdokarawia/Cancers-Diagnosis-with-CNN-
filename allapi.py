from operator import imod
from flask import Flask, request, render_template, jsonify
import numpy as np
#import tensorflow as tf
from tensorflow.keras.preprocessing.image import load_img
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model


import os
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'


app = Flask(__name__)

model_colo = load_model("ColorectalModelWithUpdate")
class_names_colo = ['Adipose Tissue', 'Complex Stroma', 'Debris and Mucus',
               'Empty','Immune Cell Conglomerates', 'Mucosal Glands',
               'Simple Stroma','Tumour Epithelium']

model_skin = load_model("SkinThreeClassesModelClassWeighting")
class_names_skin = ['Benign lesions of the keratosis','Melanoma', 'Melanocytic nevi',] 

model_breast = load_model("MultiClassModel")
class_names_breast = ['Density1Benign', 'Density1Malignant', 'Density2Benign',
               'Density2Malignant','Density3Benign', 'Density3Malignant',
               'Density4Benign','Density4Malignant']              


@app.route('/colorectal', methods=['POST', 'GET'])
def Diagnose_colo():
    imagefile = request.files['imagefile']
    image_path =  './test/' +imagefile.filename
    imagefile.save(image_path)

    img_width, img_height = 150, 150
    img = load_img(image_path, target_size = (img_width, img_height))
    img = img_to_array(img)
    img = np.expand_dims(img, axis = 0)
    probs = list(model_colo.predict(img)[0])
    prob = max(probs)
    indx = probs.index(prob)
    confidence_per = round(prob*100, 2)
    print('The predicted class is ' + class_names_breast[indx])
    print('Confidence is ' + str(confidence_per))
    predicted_class_name = class_names_colo[indx]

    
    return jsonify(class_name = predicted_class_name, confidence = confidence_per)


@app.route('/skin', methods=['POST', 'GET'])
def Diagnose_skin():
    imagefile = request.files['imagefile']
    image_path =  './test/' +imagefile.filename
    imagefile.save(image_path)

    img_width, img_height = 200, 150
    img = load_img(image_path, target_size = (img_width, img_height))
    img = img_to_array(img)
    img = np.expand_dims(img, axis = 0)
    probs = list(model_skin.predict(img)[0])
    prob = max(probs)
    indx = probs.index(prob)
    confidence_per = round(prob*100,2)
    print('The predicted class is ' + class_names_breast[indx])
    print('Confidence is ' + str(confidence_per))
    predicted_class_name = class_names_skin[indx]

    
    return jsonify(class_name = predicted_class_name, confidence = confidence_per)


@app.route('/breast', methods=['POST', 'GET'])
def Diagnose_breast():
    imagefile = request.files['imagefile']
    image_path =  './test/' +imagefile.filename
    imagefile.save(image_path)

    img_width, img_height = 160, 160
    img = load_img(image_path, target_size = (img_width, img_height))
    img = img_to_array(img)
    img = np.expand_dims(img, axis = 0)
    probs = list(model_breast.predict(img)[0])
    prob = max(probs)
    indx = probs.index(prob)
    confidence_per = round(prob*100,2)
    print('The predicted class is ' + class_names_breast[indx])
    print('Confidence is ' + str(confidence_per))
    predicted_class_name = class_names_breast[indx]

    
    return jsonify(class_name = predicted_class_name, confidence = confidence_per)


if __name__ == "__main__":
    app.run(host= '0.0.0.0')
    