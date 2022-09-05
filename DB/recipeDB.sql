create database recipeDB;
use recipeDB;

/*
	RCP_SEQ : 일련번호
    RCP_NM  : 메뉴명 
    RCP_WAY2 : 조리방법 (끓이기)
    RCP_PAT2 : 요리종류 (후식)
    INFO_ENG : 열량
    RCP_PARTS_DTLS : 재료 정보
    ATT_FILE_NO_MAIN : 이미지 경로(소)
    ATT_FILE_NO_MK : 이미지 경로(대)
*/

create table recipe(
	RCP_SEQ int NOT NULL auto_increment, 
    RCP_NM VARCHAR(100) NOT NULL,
    RCP_WAY2 VARCHAR(20),
    RCP_PAT2 VARCHAR(20),
    INFO_ENG float,
    ATT_FILE_NO_MAIN text,
    ATT_FILE_NO_MK text,
    primary key(RCP_SEQ)
);

create table recipe_parts1(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);

create table recipe_parts2(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);

create table recipe_parts3(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);
create table recipe_parts4(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);
create table recipe_parts5(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);
create table recipe_parts6(
	PARTS_NO bigint NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE varchar(50),
    primary key(RCP_SEQ),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);
CREATE TABLE recipe_parts8 (
    PARTS_NO BIGINT NOT NULL AUTO_INCREMENT,
    RCP_SEQ INT NOT NULL,
    RCP_PAT_NM VARCHAR(100),
    RCP_PAT_VL VARCHAR(100),
    RCP_PAT_TYPE VARCHAR(50),
    PRIMARY KEY (PARTS_NO),
    FOREIGN KEY (RCP_SEQ)
        REFERENCES recipe (RCP_SEQ)
);
create table recipe_process(
	pro_no int NOT NULL auto_increment, 
    RCP_SEQ int NOT NULL,
    MANUAL01 text,
    MANUAL_IMG01 text,
    MANUAL02 text,
    MANUAL_IMG02 text,
    MANUAL03 text,
    MANUAL_IMG03 text,
    MANUAL04 text,
    MANUAL_IMG04 text,
    MANUAL05 text,
    MANUAL_IMG05 text,
    MANUAL06 text,
    MANUAL_IMG06 text,
    MANUAL07 text,
    MANUAL_IMG07 text,
    MANUAL08 text,
    MANUAL_IMG08 text,
    MANUAL09 text,
    MANUAL_IMG09 text,
    MANUAL10 text,
    MANUAL_IMG10 text,
    MANUAL11 text,
    MANUAL_IMG11 text,
    MANUAL12 text,
    MANUAL_IMG12 text,
    MANUAL13 text,
    MANUAL_IMG13 text,
    MANUAL14 text,
    MANUAL_IMG14 text,
    MANUAL15 text,
    MANUAL_IMG15 text,
    MANUAL16 text,
    MANUAL_IMG16 text,
    MANUAL17 text,
    MANUAL_IMG17 text,
    MANUAL18 text,
    MANUAL_IMG18 text,
    MANUAL19 text,
    MANUAL_IMG19 text,
    MANUAL20 text,
    MANUAL_IMG20 text,
    primary key(pro_no),
    foreign key(RCP_SEQ) REFERENCES recipe (RCP_SEQ)
);
