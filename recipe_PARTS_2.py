from cgitb import text
import requests
import json

service_key = '8da6d13adae24c45aeb4'
params = '/COOKRCP01/json/1000/1358'
url = 'http://openapi.foodsafetykorea.go.kr/api/' + service_key + params

response = requests.get(url)
contents = response.text
json_contnets = json.loads(contents)

all = [] #결과 리스트
text = []
text.append("RCP_PAT_NM")
text.append("RCP_PAT_VL")
text.append("RCP_SEQ")

parts = json_contnets['COOKRCP01']['row']
#print(parts)

print(len(parts))
print("---------------------")

#요리 재료 문자열 추출

def text_Ext1():
    for i in range(62):
        parts1 = parts[i]['RCP_PARTS_DTLS']
        RCP_SEQ = parts[i]['RCP_SEQ']
        
        #요리 재료 분해 후 재조합
        body = ""   
        parts2 = [] 

        for j in parts1:
            if j == '(':
                parts2.append(body)
                body = ""
            elif j == ')':
                parts2.append(body)
                body = ""
                parts2.append(RCP_SEQ)
                json1 = dict(zip(text, parts2))
                all.append(json1)
                parts2 = []
            elif j == ',':
                continue
            elif j == ' ':
                continue
            elif j == '\n':
                continue
            else:
                body += j

text_Ext1()
#print(all)

#json 파일 저장
with open('recipe_PARTS_2.json', 'w', encoding='utf8') as outfile:
    jsonFile = json.dumps(all, indent=4, sort_keys=True, ensure_ascii=False)
    outfile.write(jsonFile)


print("끝")
