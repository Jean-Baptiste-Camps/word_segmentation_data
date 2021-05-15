import os
import re

def nettoyageTextes(string):
    pattern = r'\[Col. [0-9A-Z]*\]'
    replace = ''
#traitement des lettres ramistes
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'v'
    replace  = 'u'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'V'
    replace  = 'u'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'j'
    replace  = 'i'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'J'
    replace  = 'I'
#normalisation orthographique
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'charissimi'
    replace  = 'karissimi'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'nihil'
    replace  = 'nichil'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'chari'
    replace  = 'cari'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'Iesus'
    replace  = 'iehsu'
    string = re.sub(pattern, replace, string, flags=re.M) 
#élements entre partehèses
    pattern = r'\([^\(]+\)'
    replace = ''
    string = re.sub(pattern, replace, string, flags=re.M) 
#élements entre partehèses
    pattern = r'\[ [0-9]*Kb\]'
    replace = ''
    string = re.sub(pattern, replace, string, flags=re.M) 
#traitement diphtongues ae et oe
    pattern = r'ae'
    replace  = 'e'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'oe'
    replace = 'e'
    string = re.sub(pattern, replace, string, flags=re.M) 
    pattern = r'OE'
    replace = 'e'
    stringNettoye = re.sub(pattern, replace, string, flags=re.M) 
    return stringNettoye.encode("utf-8", "strict")


if __name__ == "__main__":

    string=''
    directory = "./PLTextes"

    for file in os.listdir(directory):

        with open(directory + '/' + file, 'r') as f:
            string = f.read()

            stringNettoye = nettoyageTextes(string)

        with open('./PLnettoye/' + file+"nettoye.txt", 'w') as f:
            f.write(stringNettoye)

