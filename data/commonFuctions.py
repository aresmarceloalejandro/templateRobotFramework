import random
import string
import datetime
import json
import os

from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword("Load Json File")
def load_json(file):
    file_path = os.path.dirname(os.path.abspath(__file__)) + file
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)
        return json.dumps(data)
    except FileNotFoundError:
        print(f"El archivo {file_path} no se encontró.")
        return None
    except json.JSONDecodeError:
        print(f"Error al decodificar el archivo JSON {file_path}.")
        return None
    except Exception as e:
        print(f"Se produjo un error: {e}")
        return None

def get_browser_driver():
    return BuiltIn().get_library_instance('SeleniumLibrary').driver


@keyword("Dismiss Alert")
def dismissAlert():
    driver = get_browser_driver()
    webdriver.ActionChains(driver).send_keys(Keys.ESCAPE).perform()


@keyword("Generate Random Phone Number")
def generateRandomPhoneNumber():
    phoneNumber = str(random.randint(1000, 9000))
    return phoneArea + phoneNumber


@keyword("Generate Random From Array")
def generateRandomFromArray(array):
    randomValue = str(random.choice(array))
    return randomValue


@keyword("Generate Random String by size")
def generateRandomStringBySize(size=6):
    letters = string.ascii_letters
    return ''.join(random.choice(letters) for i in range(size))


@keyword("Generate Random Numeric String by size")
def generateRandomNumericStringBySize(size=6):
    digits = string.digits
    return ''.join(random.choice(digits) for _ in range(size))


@keyword("Generate Random Date")
def generateRandomDate(format, shortDate=False):
    actualDate = datetime.date.today()
    if shortDate:
        minDate = actualDate - datetime.timedelta(days=365 * 1)
        maxDate = actualDate - datetime.timedelta(days=365 * 4)
    else:
        minDate = actualDate - datetime.timedelta(days=365 * 18)
        maxDate = actualDate - datetime.timedelta(days=365 * 70)

    dateFormated = datetime.date.fromordinal(random.randint(maxDate.toordinal(), minDate.toordinal()))
    return dateFormated.strftime(format)


@keyword("Generate Random Number")
def generateRandomNumber(x, y):
    return random.randint(x, y)

