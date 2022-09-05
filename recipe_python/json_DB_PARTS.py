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
    with open('recipe_PARTS_8.json', encoding='utf-8') as json_file:
        json_data = json.load(json_file)
    
        for i in json_data:
            RCP_PAT_NM = i['RCP_PAT_NM']
            RCP_PAT_VL = i['RCP_PAT_VL']
            RCP_SEQ = i['RCP_SEQ']
            
            sql = "INSERT INTO recipe_parts8(RCP_SEQ, RCP_PAT_NM, RCP_PAT_VL) VALUES (%s, %s, %s)"
            val = (int(RCP_SEQ), str(RCP_PAT_NM), str(RCP_PAT_VL))

            curs.execute(sql, val)
            conn.commit()
    print(curs.rowcount, "record inserted")
    
insertsql_form_json()