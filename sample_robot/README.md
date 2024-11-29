Install Python 3.12 from [url](https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe)

Install following libraries through pip:

> python -m pip install --upgrade pip pipenv

From the **sample_robot** folder of the project folder run:

> python -m pipenv install

Enable **python environment**

> python -m pipenv shell

It based on local python interpreter and robot library, to execute test case use command

> robot -d results test\GWTEsercitazione.robot

PS to be correctly used install Robot Framework Selenium library in python interpreter (e.g. via pip)
Moreover before execute test case, launch manually chrome webdriver
