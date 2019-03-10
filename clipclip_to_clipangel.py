import os
import time
import string
import random
import pyperclip
from bs4 import BeautifulSoup

rootdir = r"C:\Users\Karthik\Google Drive\ClipClip\Saved Clips"


def id_generator(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))


def copy_to_clipboard(directory):
    total = 0
    for root, dirs, files in os.walk(directory):
        # print(root)
        count = 0
        for file in files:
            # print(file)
            oldext = os.path.splitext(file)[1]
            abs_path = os.path.join(root, file)
            new_filename = id_generator() + oldext
            os.rename(abs_path, os.path.join(root, new_filename))
            new_abs_path_file = os.path.join(root, new_filename)
            time.sleep(1)
            if new_abs_path_file.endswith(".html"):
                with open(new_abs_path_file, encoding="utf8") as f:
                    s = f.read()
                    soup = BeautifulSoup(s, features="lxml")
                    text = soup.get_text()
                    texts = text.replace('ï»¿', '')
                    # print(texts)
                    pyperclip.copy(texts)
                    count += 1

            elif new_abs_path_file.endswith(".txt"):
                with open(new_abs_path_file, encoding="utf8", errors='ignore') as f:
                    s = f.read()
                    # print(s)
                    pyperclip.copy(s)
                    count += 1
            else:
                print(f"ERROR################################### - {new_abs_path_file}")
                continue

        print(f"{root} - {count}")
        total += count

    return total


print(copy_to_clipboard(rootdir))
