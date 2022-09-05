import requests
import json
import pprint

"""
RCP_SEQ     일련번호    "17"
RCP_NM      메뉴명      "칼륨 듬뿍 고구마죽"
RCP_WAY2    조리방법    "끓이기"
RCP_PAT2    요리종류    "후식"
INFO_ENG    열량        "205"
HASH_TAG    해쉬태그    "계란"
ATT_FILE_NO_MAIN 이미지경로(소) "http://www ... "
ATT_FILE_NO_MK 이미지경로(대)   "http://www ... "
RCP_PARTS_DTLS 재료정보 
    "고구마죽\n고구마 100g(2/3개), 설탕 2g(1/3작은술), 찹쌀가루 3g(2/3작은술),물 200ml(1컵), 잣 8g(8알)"
MANUAL01    만드는법_01
MANUAL_IMG01 만드는법_이미지_01 "http://www ... "
...
MANUAL20    만드는법_20
MANUAL_IMG20 만드는법_이미지_20 "http://www ... "
"""

service_key = '8da6d13adae24c45aeb4'
params = '/COOKRCP01/json/1000/1358'
url = 'http://openapi.foodsafetykorea.go.kr/api/' + service_key + params

#url 불러오기
response = requests.get(url)

contents = response.text

#문자열 json으로 변환
json_contnets = json.loads(contents)
#print(json_contnets)
#print(type(json_contnets))

#필요한 내용만 꺼내기
body = json_contnets['COOKRCP01']['row']
#print(body)

#json 파일 저장
with open('recipe2.json', 'w', encoding='utf8') as outfile:
    jsonFile = json.dumps(body, indent=4, sort_keys=True, ensure_ascii=False)
    outfile.write(jsonFile)