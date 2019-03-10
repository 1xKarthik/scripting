import os
import time
import string
import random
import pyperclip
from bs4 import BeautifulSoup

directory = r"C:\Users\Karthik\Google Drive\ClipClip\Saved Clips\Laravel"


def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def copy_to_clipboard(directory):
    count = 0
    for file in os.listdir(directory):
        oldext = os.path.splitext(file)[1]
        abs_path = os.path.join(directory, file)
        new_filename = id_generator() + oldext
        os.rename(abs_path, os.path.join(directory, new_filename))
        new_abs_path_file = os.path.join(directory, new_filename)
        time.sleep(1)
        if new_abs_path_file.endswith(".html"):
            with open(new_abs_path_file, encoding="utf8") as f:
                s = f.read()
                soup = BeautifulSoup(s, features="lxml")
                text = soup.get_text()
                texts = text.replace('ï»¿', '')
                print(texts)
                pyperclip.copy(texts)
                count += 1

        else:
            with open(new_abs_path_file) as f:
                s = f.read()
                print(s)
                pyperclip.copy(s)
                count += 1

    return count


print(copy_to_clipboard(directory))
