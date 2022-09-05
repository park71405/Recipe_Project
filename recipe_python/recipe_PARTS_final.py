import json
with open('recipe1.json', 'rt', encoding='UTF8') as file:
    json_contnets = json.load(file)

all = [] #결과 리스트
text = []
text.append("RCP_PAT_NM")
text.append("RCP_PAT_VL")
text.append("RCP_SEQ")

parts = json_contnets


#요리 재료 문자열 추출
def text_Ext1():
    for i in range(1358):
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
with open('recipe_PARTS.json', 'w', encoding='utf8') as outfile:
    jsonFile = json.dumps(all, indent=4, sort_keys=True, ensure_ascii=False)
    outfile.write(jsonFile)
