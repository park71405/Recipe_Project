import pymysql.cursors
import json

def insertsql_form_json():
    # myslq 접속
    conn = pymysql.connect(
        host = "localhost",
        port = 3306,
        user = "root",
        password = "6342",
        database = "recipeDB",
        charset = "utf8"
    )

    #DB와 상호작용할 Cursor Object 가져오기
    curs = conn.cursor()

    #json 가져오기
    with open('recipe1.json', encoding='utf-8') as json_file:
        json_data = json.load(json_file)
    
        for i in json_data:
            RCP_SEQ = i['RCP_SEQ']
            RCP_NM = i['RCP_NM']
            RCP_WAY2 = i['RCP_WAY2']
            RCP_PAT2 = i['RCP_PAT2']
            INFO_ENG = i['INFO_ENG']
            ATT_FILE_NO_MAIN = i['ATT_FILE_NO_MAIN']
            ATT_FILE_NO_MK = i['ATT_FILE_NO_MK']
            
            sql = "INSERT INTO recipe(RCP_SEQ, RCP_NM, RCP_WAY2, RCP_PAT2, INFO_ENG, ATT_FILE_NO_MAIN, ATT_FILE_NO_MK) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            val = (int(RCP_SEQ), str(RCP_NM), str(RCP_WAY2), str(RCP_PAT2), float(INFO_ENG), str(ATT_FILE_NO_MAIN), str(ATT_FILE_NO_MK))

            curs.execute(sql, val)
            conn.commit()
    print(curs.rowcount, "record inserted")
    
insertsql_form_json()