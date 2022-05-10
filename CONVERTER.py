import os, sys

from PIL import Image

path = "C:/Users/bahaa/Colorectal Cancer RESNET/Dataset/5000Images/Tumour Epithelium/"

for item in os.listdir(path):
    im = Image.open(path+item)
    outfile = os.path.splitext(os.path.join(path, item))[0] + ".jpg"
    try:
        im.save(outfile, "JPEG", quality=80, optimize=True, progressive=True)
    except:
        print(outfile)

    
    