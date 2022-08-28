import requests
import json

service_key = '8da6d13adae24c45aeb4'
params = '/COOKRCP01/json/1/7'
url = 'http://openapi.foodsafetykorea.go.kr/api/' + service_key + params

response = requests.get(url)
contents = response.text
json_contnets = json.loads(contents)

#요리 재료 문자열 추출
def text_Ext1():
    body = json_contnets['COOKRCP01']['row'][6]['RCP_PARTS_DTLS']

#요리 재료 분해 후 딕셔너리로 재조합
def text_Ext2(body):    
    
    parts = []
    body2 = ""
    for i in body:
        if i == '(':
            parts.append(body2)
            body2 = ""
        elif i == ')':
            parts.append(body2)
            body2 = ""
        elif i == ',':
            continue
        elif i == ' ':
            continue
        elif i == '\n':
            continue
        else:
            body2 += i