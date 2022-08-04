@echo off
color 0a
pip freeze > requirements.txt
pip uninstall -r requirements.txt -y
pip install --upgrade pip
pip install pyinstaller
pip install pywin32