import requests
import json
import pprint

"""
RCP_SEQ     일련번호
RCP_NM      메뉴명
RCP_WAY2    조리방법
RCP_PAT2    요리종류
INFO_WGT    중량(1인분)
INFO_ENG    열량
HASH_TAG    해쉬태그
ATT_FILE_NO_MAIN 이미지경로(소)
ATT_FILE_NO_MK 이미지경로(대)
RCP_PARTS_DTLS 재료정보
MANUAL01    만드는법_01
MANUAL_IMG01 만드는법_이미지_01
...
MANUAL20    만드는법_20
MANUAL_IMG20 만드는법_이미지_20
"""

service_key = '8da6d13adae24c45aeb4'
params = '/COOKRCP01/json/1/1000'
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
with open('recipe1.json', 'w', encoding='utf8') as outfile:
    jsonFile = json.dumps(body, indent=4, sort_keys=True, ensure_ascii=False)
    outfile.write(jsonFile)