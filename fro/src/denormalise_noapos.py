import os
import re
import glob
from pathlib import Path
import unidecode
import unicodedata

def nettoyageTextes(string):
#traitement des lettres ramistes
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
    string = re.sub(pattern, replace, string, flags=re.M)
    #remove apos
    pattern = r"[\'’ʼ]"
    replace  = ' '
    string = re.sub(pattern, replace, string, flags=re.M)
    # the hard way: clean diacritics
    nfkd_form = unicodedata.normalize('NFKD', string)
    pattern = r"[\u0300\u0301\u0308\u0327]"
    replace  = ''
    string = re.sub(pattern, replace, nfkd_form, flags=re.M)
    # and now some punctuation
    pattern = r'[\"«»,;:?!]'
    replace  = ''
    string = re.sub(pattern, replace, nfkd_form, flags=re.M)
    #élements entre partehèses
    # pattern = r'\([^\(]+\)'
    # replace = ''
    #élements entre partehèses
    # pattern = r'\[ [0-9]*Kb\]'
    # replace = ''
    # string = re.sub(pattern, replace, string, flags=re.M)
    # and finally, remove diacritics and clean
    # string = unidecode.unidecode(string)
    return string.encode("utf-8", "strict")


if __name__ == "__main__":

    string=''

    for directory in glob.glob("*/txt"):
        for file in os.listdir(directory):
            # create output dir if not exist
            Path(directory+ "_cleaned/").mkdir(parents=True, exist_ok=True)
            with open(directory + '/' + file, 'r') as f:
                string = f.read()
                stringNettoye = nettoyageTextes(string)

            with open(directory+ "_cleaned/" + file, 'wb') as f:
                f.write(stringNettoye)

