
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
            RCP_SEQ = i ['RCP_SEQ']
            MANUAL01 = i['MANUAL01']
            MANUAL_IMG01 = i['MANUAL_IMG01']
            MANUAL02 = i['MANUAL02']
            MANUAL_IMG02 = i['MANUAL_IMG02']
            MANUAL03 = i['MANUAL03']
            MANUAL_IMG03 = i['MANUAL_IMG03']
            MANUAL04 = i['MANUAL04']
            MANUAL_IMG04 = i['MANUAL_IMG04']
            MANUAL05 = i['MANUAL05']
            MANUAL_IMG05 = i['MANUAL_IMG05']
            MANUAL06 = i['MANUAL06']
            MANUAL_IMG06 = i['MANUAL_IMG06']
            MANUAL07 = i['MANUAL07']
            MANUAL_IMG07 = i['MANUAL_IMG07']
            MANUAL08 = i['MANUAL08']
            MANUAL_IMG08 = i['MANUAL_IMG08']
            MANUAL09 = i['MANUAL09']
            MANUAL_IMG09 = i['MANUAL_IMG09']
            MANUAL10 = i['MANUAL10']
            MANUAL_IMG10 = i['MANUAL_IMG10']
            MANUAL11 = i['MANUAL11']
            MANUAL_IMG11 = i['MANUAL_IMG11']
            MANUAL12 = i['MANUAL12']
            MANUAL_IMG12 = i['MANUAL_IMG12']
            MANUAL13 = i['MANUAL13']
            MANUAL_IMG13 = i['MANUAL_IMG13']
            MANUAL14 = i['MANUAL14']
            MANUAL_IMG14 = i['MANUAL_IMG14']
            MANUAL15 = i['MANUAL15']
            MANUAL_IMG15 = i['MANUAL_IMG15']
            MANUAL16 = i['MANUAL16']
            MANUAL_IMG16 = i['MANUAL_IMG16']
            MANUAL17 = i['MANUAL17']
            MANUAL_IMG17 = i['MANUAL_IMG17']
            MANUAL18 = i['MANUAL18']
            MANUAL_IMG18 = i['MANUAL_IMG18']
            MANUAL19 = i['MANUAL19']
            MANUAL_IMG19 = i['MANUAL_IMG19']
            MANUAL20 = i['MANUAL20']
            MANUAL_IMG20 = i['MANUAL_IMG20']
            
            sql = "INSERT INTO recipe_process(RCP_SEQ, MANUAL01, MANUAL_IMG01, MANUAL02, MANUAL_IMG02, MANUAL03, MANUAL_IMG03, MANUAL04, MANUAL_IMG04, MANUAL05, MANUAL_IMG05, MANUAL06, MANUAL_IMG06, MANUAL07, MANUAL_IMG07, MANUAL08, MANUAL_IMG08, MANUAL09, MANUAL_IMG09, MANUAL10, MANUAL_IMG10, MANUAL11, MANUAL_IMG11, MANUAL12, MANUAL_IMG12, MANUAL13, MANUAL_IMG13, MANUAL14, MANUAL_IMG14, MANUAL15, MANUAL_IMG15, MANUAL16, MANUAL_IMG16, MANUAL17, MANUAL_IMG17, MANUAL18, MANUAL_IMG18, MANUAL19, MANUAL_IMG19, MANUAL20, MANUAL_IMG20) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            
            val = (int(RCP_SEQ), str(MANUAL01), str(MANUAL_IMG01), str(MANUAL02), str(MANUAL_IMG02), str(MANUAL03), str(MANUAL_IMG03), str(MANUAL04), str(MANUAL_IMG04), str(MANUAL05), str(MANUAL_IMG05), str(MANUAL06), str(MANUAL_IMG06), str(MANUAL07), str(MANUAL_IMG07), str(MANUAL08), str(MANUAL_IMG08), str(MANUAL09), str(MANUAL_IMG09), str(MANUAL10), str(MANUAL_IMG10), str(MANUAL11), str(MANUAL_IMG11), str(MANUAL12), str(MANUAL_IMG12), str(MANUAL13), str(MANUAL_IMG13), str(MANUAL14), str(MANUAL_IMG14), str(MANUAL15), str(MANUAL_IMG15), str(MANUAL16), str(MANUAL_IMG16), str(MANUAL17), str(MANUAL_IMG17), str(MANUAL18), str(MANUAL_IMG18), str(MANUAL19), str(MANUAL_IMG19), str(MANUAL20), str(MANUAL_IMG20))

            curs.execute(sql, val)
            conn.commit()
    print(curs.rowcount, "record inserted")
    
insertsql_form_json()

