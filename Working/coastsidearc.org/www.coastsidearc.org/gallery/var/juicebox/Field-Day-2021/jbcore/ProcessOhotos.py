import cv2
import pytesseract
import urllib
import numpy as np
import re
import imutils #added

resp = urllib.request.urlopen('https://i.ibb.co/27bKNJ8/book-rot2.jpg')
image = np.asarray(bytearray(resp.read()), dtype="uint8")
image = cv2.imdecode(image, cv2.IMREAD_COLOR) # Initially decode as color
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
gray = cv2.bitwise_not(gray)

rot_data = pytesseract.image_to_osd(image);
print("[OSD] "+rot_data)
rot = re.search('(?<=Rotate: )\d+', rot_data).group(0)

angle = float(rot)

# rotate the image to deskew it
rotated = imutils.rotate_bound(image, angle) #added


#  TODO: Rotated image can be saved here
print(pytesseract.image_to_osd(rotated));
print("[TEXT]")
# Run tesseract OCR on image
text = pytesseract.image_to_string(rotated, lang='eng', config="--psm 6")

# Print recognized text