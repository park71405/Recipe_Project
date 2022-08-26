import requests
import json
import pprint

service_key = '8da6d13adae24c45aeb4'
params = '/COOKRCP01/json/1/7'
url = 'http://openapi.foodsafetykorea.go.kr/api/' + service_key + params

#url 불러오기
response = requests.get(url)

contents = response.text

#문자열 json으로 변환
json_contnets = json.loads(contents)
#print(json_contnets)
#print(type(json_contnets))

#필요한 내용만 꺼내기
body = json_contnets['COOKRCP01']['row'][6]['RCP_PARTS_DTLS']
#print(body)

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

#print(parts)

json1 = dict(zip(range(1, len(parts)+1), parts))
print(json1)


