CREATE TABLE employee (
     first_name VARCHAR2(128),
     last_name VARCHAR2(128),
     empID NUMBER,
     salary NUMBER(6) ENCRYPT
);
CREATE TABLE employee (
     first_name VARCHAR2(128),
     last_name VARCHAR2(128),
     empID NUMBER ENCRYPT NO SALT,
     salary NUMBER(6) ENCRYPT USING '3DES168'
);

CREATE TABLE persons OF person
  ( homeaddress NOT NULL,
      UNIQUE (homeaddress.phone),
      CHECK (homeaddress.zip IS NOT NULL),
      CHECK (homeaddress.city <> 'San Francisco') );

CREATE TABLE purchaseorder_as_table OF XMLType
  XMLSCHEMA "http://xmlns.oracle.com/xdb/documentation/purchaseOrder.xsd"
  ELEMENT "PurchaseOrder";

CREATE TABLE purchaseorder_as_column OF XMLType
  XMLTYPE COLUMN xml_document
  ELEMENT
    "http://xmlns.oracle.com/xdb/documentation/purchaseOrder.xsd#PurchaseOrder";

CREATE TABLE po_binaryxml OF XMLType
 XMLTYPE STORE AS BINARY XML
 VIRTUAL COLUMNS
 (DATE_COL AS (XMLCast(XMLQuery('/PurchaseOrder/@orderDate'
 PASSING OBJECT_VALUE RETURNING CONTENT)
 AS DATE))) ;

CREATE TABLE po_binary OF XMLType;

create table junk (
       me date,
       primary key (me)
);

CREATE TABLE TEST
      AS 
      WITH TESTCTE AS (
        SELECT 1 ONE FROM DUAL
      )
      SELECT 'A', 'B', 'C'
      FROM DUAL
      JOIN TESTCTE;

CREATE TABLE DEMO (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE DEMO (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE DEMO (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    TEST VARCHAR2(100) NOT NULL
);

CREATE TABLE products (
    id NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY (START WITH 101) NOT NULL PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(512),
    weight FLOAT,
    PRICE NUMERIC(10,-2)
);

CREATE TABLE products (
    id NUMBER(4) GENERATED BY DEFAULT ON NULL AS IDENTITY (START WITH 101 INCREMENT BY 1 CYCLE CACHE 200) NOT NULL PRIMARY KEY,
    name VARCHAR2(255) NOT NULL,
    description VARCHAR2(512),
    weight FLOAT,
    PRICE NUMERIC(10,-2)
);

create table "DVSADM".CMP3$58238005 nocompress tablespace "DVS_PROOF" nologging lob (VALUE) store as (tablespace "DVS_PROOF" enable storage in row nocache nologging) as select /*+ DYNAMIC_SAMPLING(0) FULL("DVSADM"."DVS_ARCHIVE") */ * from "DVSADM"."DVS_ARCHIVE" sample block( 6.734) mytab;

CREATE TABLE "APPLSYS"."FND_SEC_GUIDELINES_TL" (
    "CODE" VARCHAR2(20) NOT NULL ENABLE,
    "TITLE" VARCHAR2(100) NOT NULL ENABLE,
    "DESCRIPTION" VARCHAR2(2000) NOT NULL ENABLE,
    "INFO" CLOB NOT NULL ENABLE,
    "LANGUAGE" VARCHAR2(30) NOT NULL ENABLE,
    "SOURCE_LANG" VARCHAR2(4) NOT NULL ENABLE,
    "CREATED_BY" VARCHAR2(30) NOT NULL ENABLE,
    "CREATION_DATE" DATE NOT NULL ENABLE,
    "LAST_UPDATED_BY" NUMBER(15,0) NOT NULL ENABLE,
    "LAST_UPDATE_DATE" DATE NOT NULL ENABLE,
    "LAST_UPDATE_LOGIN" NUMBER(15,0))
    PCTFREE 10 PCTUSED 40 INITRANS 10 MAXTRANS 255 LOGGING
    STORAGE(
        INITIAL 4096
        NEXT 131072
        MINEXTENTS 1
        MAXEXTENTS 2147483645
        PCTINCREASE 0
        FREELISTS 4
        FREELIST GROUPS 4
        BUFFER_POOL DEFAULT)
    TABLESPACE "APPS_TS_TX_DATA"
    LOB ("INFO")
    STORE AS (
        TABLESPACE "APPS_TS_TX_DATA" ENABLE STORAGE IN ROW CHUNK 8192 PCTVERSION 10
        NOCACHE
        STORAGE(
            INITIAL 4096
            NEXT 131072
            MINEXTENTS 1
            MAXEXTENTS 2147483645
            PCTINCREASE 0
            FREELISTS 4
            FREELIST GROUPS 4
            BUFFER_POOL DEFAULT))
;

CREATE TABLE CATEGORIES (	
    "CATEGORY_ID" NUMBER(9,0), 
	"CATEGORY_NAME" VARCHAR2(15 BYTE), 
	"DESCRIPTION" VARCHAR2(2000 BYTE), 
	"PICTURE" VARCHAR2(255 BYTE)
) SEGMENT CREATION IMMEDIATE PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645 PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT) TABLESPACE "USERS" ;

CREATE TABLE "t_ddl_0027"(
    "PID" INT,
    "FID" INT,
    "NAME" VARCHAR(50) DEFAULT 'Tom',
    "ADDRESS" VARCHAR(50) NOT NULL,
    "DEPT" VARCHAR(50),
    CONSTRAINT "PK_ID" PRIMARY KEY("PID"),
    CONSTRAINT "CK_DEPT" CHECK ("DEPT" IN('IT', 'SALES', 'MANAGER')));

CREATE TABLE "C##RCUSER"."JSON_TRANS"(
    "ID" NUMBER(8,0) NOT NULL ENABLE,
    "TRANS_MSG" CLOB,
    CONSTRAINT "CHECK_JSON" CHECK (trans_msg is json) ENABLE,
    PRIMARY KEY ("ID") USING INDEX ENABLE,
    SUPPLEMENTAL LOG DATA (ALL) COLUMNS);

CREATE TABLE "ASEDBUSR"."ECLAIMPROCESS"
(	"PKEY" NUMBER(12,0) NOT NULL ENABLE,
	"BOID" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"METABO" NUMBER(12,0) NOT NULL ENABLE,
	"LASTUPDATE" TIMESTAMP (9) NOT NULL ENABLE,
	"PROCESSID" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ROWCOMMENT" VARCHAR2(15 CHAR),
	"CREATED" TIMESTAMP (9) NOT NULL ENABLE,
	"CREATEDUSER" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"REPLACED" TIMESTAMP (9) NOT NULL ENABLE,
	"REPLACEDUSER" VARCHAR2(40 CHAR),
	"ITSPROCSUMPKOGU" VARCHAR2(40 CHAR),
	"ITSPROCSUMINVOICE" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"IMPORTDATE" DATE NOT NULL ENABLE,
	"BATCHIMPORTSTATUS" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSECLAIMPROCVERS" VARCHAR2(40 CHAR),
	"ITSECLAIMPROCPAT" VARCHAR2(40 CHAR),
	"ITSPROCVERANLASSLE" VARCHAR2(40 CHAR),
	"ITSPROCAUSFUEHRLE" VARCHAR2(40 CHAR),
	"ITSPROCRECHSTELLER" VARCHAR2(40 CHAR),
	"ITSPROCBEARBOE" VARCHAR2(40 CHAR),
	"ITSPROCBEARBUSER" VARCHAR2(40 CHAR),
	"ITSSUMPROCZAHLER" VARCHAR2(40 CHAR),
	"ITSECLAIMSCHADEN" VARCHAR2(40 CHAR),
	"ITSECPLSTABRTYP" VARCHAR2(40 CHAR),
	"ITSECLAIMLSTFALL" VARCHAR2(40 CHAR),
	"ITSECLAIMFDOSSIER" VARCHAR2(40 CHAR),
	"VERARBEITUNGCOUNT" NUMBER(12,0),
	"ITSPROCBATCHLAUF" VARCHAR2(40 CHAR),
	"VORBEHALTOVR" NUMBER(12,0) NOT NULL ENABLE,
	"LSTSPERRENOVR" NUMBER(12,0) NOT NULL ENABLE,
	"SISTIERUNGOVR" NUMBER(12,0) NOT NULL ENABLE,
	"RUECKWEISUNGTEXT" VARCHAR2(350 CHAR),
	"FEHLERTEXT" VARCHAR2(1024 CHAR),
	"PROVSTATUS" VARCHAR2(40 CHAR),
	"ECLAIMSTATUS" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"SBENTSCHEID" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSSUMPROCLSTABR" VARCHAR2(40 CHAR),
	"RESPONSE" VARCHAR2(4000 CHAR),
	"MODIFIALLOWED" VARCHAR2(40 CHAR),
	"LSTAUFSCHUBOVR" NUMBER(12,0) NOT NULL ENABLE,
	"ISEXTERNALSTORED" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSPROCGBEREICH" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSPROCECLAIMMAND" VARCHAR2(40 CHAR),
	"HABEGRUENDUNG" VARCHAR2(40 CHAR),
	"ITSKUERZUNG" VARCHAR2(40 CHAR),
	"KUERZUNGPROZENT" NUMBER(9,2),
	"ITSSUMPROCKOGU" VARCHAR2(40 CHAR),
	"EKOGURUECKWCODE" VARCHAR2(40 CHAR),
	"EKOGUERLEDIGTCODE" VARCHAR2(40 CHAR),
	"SECONDOPINION" VARCHAR2(40 CHAR),
	"ITSTHERAPIEMETHODE" VARCHAR2(40 CHAR),
	"ITSPROCSUMKOGU" VARCHAR2(40 CHAR),
	"ITSLERBMELDUNG" VARCHAR2(40 CHAR),
	"PROCBEHANDORTOVR" NUMBER(12,0) NOT NULL ENABLE,
	"ITSAUSZAHLUNGSTYP" VARCHAR2(40 CHAR),
	"AUSZAHLTYPOVR" NUMBER(12,0) NOT NULL ENABLE,
	"VERARBEITSTATUS" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"FOREIGNCURRACTIV" NUMBER(12,0) NOT NULL ENABLE,
	"PROCRECHSTOVR" NUMBER(12,0) NOT NULL ENABLE,
	"ISESR" VARCHAR2(40 CHAR),
	"ITSKSKTARKOST" VARCHAR2(40 CHAR),
	"ITSPROCBEHANDORT" VARCHAR2(40 CHAR),
	"STATUS" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ERFREVISION" NUMBER(12,0) NOT NULL ENABLE,
	"ITSXMLSTORE" VARCHAR2(40 CHAR),
	"ITSANNULXMLSTORE" VARCHAR2(40 CHAR),
	"VORBESCHEXPFREIG" VARCHAR2(40 CHAR),
	"EINFEXPFREIG" VARCHAR2(40 CHAR),
	"SANKTIONSTUFEFLAG" VARCHAR2(40 CHAR),
	"SANKTIONSTUFEOVR" NUMBER(12,0) NOT NULL ENABLE,
	"BESTDATNOTENKURS" DATE,
	"RKOPFCOMMENT" VARCHAR2(255 CHAR),
	"INTERNCOMMENT" VARCHAR2(4000 CHAR),
	"OVRINTERNCOMMENT" NUMBER(12,0) NOT NULL ENABLE,
	"COMMENTLERB" VARCHAR2(4000 CHAR),
	"COMMENTLERBOVR" VARCHAR2(4000 CHAR),
	"COMMENTLERBKOPF" VARCHAR2(1000 CHAR),
	"COMMENTLERBKOPFPOS" VARCHAR2(40 CHAR),
	"OVRCOMMENTLERB" NUMBER(12,0) NOT NULL ENABLE,
	"OVRCOMMENTLERBKOPF" NUMBER(12,0) NOT NULL ENABLE,
	"COMMENTVERS" VARCHAR2(4000 CHAR),
	"COMMENTVERSOVR" VARCHAR2(4000 CHAR),
	"OVRCOMMENTVERS" NUMBER(12,0) NOT NULL ENABLE,
	"OVRCOMMENTVERSKOPF" NUMBER(12,0) NOT NULL ENABLE,
	"COMMENTVERSKOPF" VARCHAR2(1000 CHAR),
	"COMMENTVERSKOPFPOS" VARCHAR2(40 CHAR),
	"USEESRREDBANKINFO" VARCHAR2(40 CHAR),
	"ISKOGU" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSBEHANDLUNG" VARCHAR2(40 CHAR),
	"ITSSTORNOECLPROC" VARCHAR2(40 CHAR),
	"KOPIERT" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"STORNOCODE" VARCHAR2(40 CHAR),
	"MCDINVOICESTATUS" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ITSMCDXMLSTORE" VARCHAR2(40 CHAR),
	"TARIFGRPMDC" VARCHAR2(35 CHAR),
	"SUMPOTEINSPARUNG" NUMBER(14,4) NOT NULL ENABLE,
	"ABSCHLUSSDAT" TIMESTAMP (9),
	"PROCESSDATE" DATE,
	"LSTABRDATE" DATE,
	"LSTABRSTORNODATE" DATE,
	"REGELVARIABLE1" VARCHAR2(255 CHAR),
	"TREATMENTBEGIN" DATE,
	"TREATMENTEND" DATE,
	"ITSECLAIMPROCINS" VARCHAR2(40 CHAR),
	"ITSABTRGERKLG" VARCHAR2(40 CHAR),
	"ITSPROCCOPYFROM" VARCHAR2(40 CHAR),
	"ARCHIVETAG" VARCHAR2(40 CHAR),
	"ECLSABEDRGSTATUS" VARCHAR2(40 CHAR),
	"RECHNUNGSTYP" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"MCDVISIBLEDATE" TIMESTAMP (9),
	"ITSSENDUNG" VARCHAR2(40 CHAR),
	"MDBID" VARCHAR2(255 CHAR),
	"LSTZAHLUNGAN" VARCHAR2(40 CHAR),
	"LSTFORDERUNGAN" VARCHAR2(40 CHAR),
	"LSTZAHLUNGANOVR" NUMBER(12,0) NOT NULL ENABLE,
	"LSTFORDERUNGANOVR" NUMBER(12,0) NOT NULL ENABLE,
	"FRISTBEGINN" DATE DEFAULT NULL NOT NULL ENABLE,
	"EXTPRUEFSYSSTATUS" VARCHAR2(40 CHAR) DEFAULT NULL,
	"EXTPRUEFSYSDATE" DATE DEFAULT NULL,
	 SUPPLEMENTAL LOG DATA (ALL) COLUMNS
   ) PCTFREE 10 PCTUSED 40 INITRANS 40 MAXTRANS 255  LOGGING
  STORAGE(
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT"
  PARTITION BY LIST ("REPLACED")
 (PARTITION "P_CURR"  VALUES (TIMESTAMP '3000-01-01 00:00:00') SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 40 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT" ,
 PARTITION "P_ARCH"  VALUES (DEFAULT) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 40 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 8388608 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT" )  ENABLE ROW MOVEMENT;
  CREATE UNIQUE INDEX "ASEDBUSR"."PK1019008" ON "ASEDBUSR"."ECLAIMPROCESS" ("PKEY")
  PCTFREE 10 INITRANS 80 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT";
  ALTER TABLE "ASEDBUSR"."ECLAIMPROCESS" ADD CONSTRAINT "PK1019008" PRIMARY KEY ("PKEY")
  USING INDEX "ASEDBUSR"."PK1019008"  ENABLE;

CREATE TABLE "ASEDBUSR"."DOCBESTPARAMATTR"
(	"PKEY" NUMBER(12,0) NOT NULL ENABLE,
	"BOID" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"METABO" NUMBER(12,0) NOT NULL ENABLE,
	"LASTUPDATE" TIMESTAMP (9) NOT NULL ENABLE,
	"PROCESSID" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"ROWCOMMENT" VARCHAR2(15 CHAR),
	"CREATED" TIMESTAMP (9) NOT NULL ENABLE,
	"CREATEDUSER" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"REPLACED" TIMESTAMP (9) NOT NULL ENABLE,
	"REPLACEDUSER" VARCHAR2(40 CHAR),
	"ARCHIVETAG" VARCHAR2(40 CHAR),
	"GUELTAB" DATE NOT NULL ENABLE,
	"GUELTBIS" DATE NOT NULL ENABLE,
	"ITSPARAMATTRDEF" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"CODEVALUE" VARCHAR2(40 CHAR),
	"ITSBOVALUE" VARCHAR2(40 CHAR),
	"CLSBOVALUE" NUMBER(12,0),
	"INTVALUE" NUMBER(12,0),
	"DECVALUE" NUMBER(18,6),
	"TEXTVALUE" VARCHAR2(4000 CHAR),
	"DATEVALUE" DATE,
	"ITSDOCBESTELLUNG" VARCHAR2(40 CHAR) NOT NULL ENABLE,
	"MDBID" VARCHAR2(255 CHAR),
	"BIGTEXTVALUE" CLOB,
	"CK_CODEVALUE" VARCHAR2(40 CHAR),
	 CONSTRAINT "PK500332" PRIMARY KEY ("PKEY")
  USING INDEX PCTFREE 10 INITRANS 80 MAXTRANS 255 COMPUTE STATISTICS
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT"  ENABLE,
	 SUPPLEMENTAL LOG DATA (ALL) COLUMNS
   ) SEGMENT CREATION IMMEDIATE
  PCTFREE 10 PCTUSED 40 INITRANS 40 MAXTRANS 255
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "ASEDBUSR_DAT"
 LOB ("BIGTEXTVALUE") STORE AS SECUREFILE (
  TABLESPACE "ASEDBUSR_DAT" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

CREATE TABLE t_order
(SYS_ID VARCHAR2(32 CHAR) VISIBLE NOT NULL, 
ATTACHMENT_NAME VARCHAR2(1024 BYTE) INVISIBLE DEFAULT '');

CREATE TABLE "A"."B" ( "FIELD1" NUMBER(19,0) NOT NULL ENABLE, "FIELD2" NUMBER(19,0) NOT NULL ENABLE, PRIMARY KEY ("FIELD1") ENABLE ) 
ORGANIZATION INDEX NOCOMPRESS ;

CREATE BLOCKCHAIN TABLE bank_ledger (bank VARCHAR2(128), deposit_date DATE, deposit_amount NUMBER)
NO DROP UNTIL 31 DAYS IDLE
NO DELETE LOCKED
HASHING USING "SHA2_512" VERSION "v1";

CREATE BLOCKCHAIN TABLE bctab_part (trans_id number primary key, sender varchar2(50), recipient varchar2(50), trans_date DATE, amount number) 
     NO DROP UNTIL 16 DAYS IDLE
     NO DELETE UNTIL 25 DAYS AFTER INSERT
        HASHING USING "SHA2_512" VERSION "v1"
        PARTITION BY RANGE(trans_date)
        (PARTITION p1 VALUES LESS THAN (TO_DATE('30-09-2019','dd-mm-yyyy')),
                                PARTITION p2 VALUES LESS THAN (TO_DATE('31-12-2019','dd-mm-yyyy')),
                                PARTITION p3 VALUES LESS THAN (TO_DATE('31-03-2020','dd-mm-yyyy')),
                                PARTITION p4 VALUES LESS THAN (TO_DATE('30-06-2020','dd-mm-yyyy'))
                                );

CREATE TABLE T_ORDER
(
    ORDER_ID NUMBER(10) GENERATED BY DEFAULT AS IDENTITY START WITH 1 MAXVALUE 100,
    STATUS   VARCHAR2(10),
    COLUMN1  VARCHAR2(10)
);

CREATE TABLE DWH_INT_DBT.sensors_raw (
  SOURCE                 VARCHAR2(50),
  EVENTTS                VARCHAR2(30))
  STORAGE (
    BUFFER_POOL      DEFAULT
    FLASH_CACHE      DEFAULT
    CELL_FLASH_CACHE DEFAULT)
  NOCOMPRESS
  NOCACHE
  RESULT_CACHE (MODE DEFAULT)
  NOPARALLEL
  NOMONITORING;

-- see as https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/CREATE-TABLE.html#GUID-F9CE0CC3-13AE-4744-A43C-EAC7A71AAAB6
CREATE TABLE print_media_demo
( product_id NUMBER(6)
    , ad_id NUMBER(6)
    , ad_composite BLOB
    , ad_sourcetext CLOB
    , ad_finaltext CLOB
    , ad_fltextn NCLOB
    , ad_textdocs_ntab textdoc_tab
    , ad_photo BLOB
    , ad_graphic BFILE
    , ad_header adheader_typ
) NESTED TABLE ad_textdocs_ntab STORE AS textdocs_nestedtab_demo
      LOB (ad_composite, ad_photo, ad_finaltext)
      STORE AS(STORAGE (INITIAL 20M))
   PARTITION BY RANGE (product_id)
      (PARTITION p1 VALUES LESS THAN (3000) TABLESPACE tbs_01
         LOB (ad_composite, ad_photo)
         STORE AS (TABLESPACE tbs_02 STORAGE (INITIAL 10M))
         NESTED TABLE ad_textdocs_ntab STORE AS nt_p1 (TABLESPACE example),
       PARTITION P2 VALUES LESS THAN (MAXVALUE)
         LOB (ad_composite, ad_finaltext)
         STORE AS SECUREFILE (TABLESPACE auto_seg_ts)
         NESTED TABLE ad_textdocs_ntab STORE AS nt_p2
       )
   TABLESPACE tbs_03;

CREATE TABLE T (
    id number(9,0) primary key,
    data xmltype
);

CREATE TABLE "D1
"
("c1" INTEGER, "C2" INTEGER);

CREATE TABLE T (
    id number(9,0) primary key,
    data xmltype
) USAGE QUEUE;

CREATE TABLE tab (ID number(9) primary key, data xmltype, data2 xmltype) MEMOPTIMIZE FOR READ;
CREATE TABLE tab (ID number(9) primary key, data xmltype, data2 xmltype) NO MEMOPTIMIZE FOR READ;
CREATE TABLE tab (ID number(9) primary key, data xmltype, data2 xmltype) MEMOPTIMIZE FOR WRITE;
CREATE TABLE tab (ID number(9) primary key, data xmltype, data2 xmltype) NO MEMOPTIMIZE FOR WRITE;

CREATE TABLE tab IF NOT EXISTS (ID number(9) primary key);

CREATE TABLE T1 (
 "NAME" VARCHAR(10) NOT NULL,
 "ID" INT NOT NULL,
 "ADDRESS" VARCHAR(255),
 "SQ_NUMBER" NUMBER(10),
 "PQ_NUMBER" NUMBER(10),
 CONSTRAINTS UQ1 UNIQUE ("SQ_NUMBER", "PQ_NUMBER"));

create TABLE PROCESSED AS (
select * FROM T_ORDER_PROCESSED f)
       --     WHERE
       -- TO_CHAR(to_date('20'||f.nr_ano,'YYYY'),'YYYY')||'/'||TRIM(TO_CHAR(f.nr_mes,'00')) = :refCompAcad);
;

CREATE INDEX part_idx ON partitioned_by_index (part, val)
    GLOBAL PARTITION BY RANGE (part)
        ( PARTITION t0 VALUES LESS THAN (TIMESTAMP '2020-01-01 00:00:00')
        , PARTITION t1 VALUES LESS THAN (MAXVALUE) )
        ;

CREATE TABLE TBHSP27E (
 compid VARCHAR2(20) default '' not null,
 empno VARCHAR2(20) default '' not null,
 salarymonth VARCHAR2(10) default '' not null,
 position VARCHAR2(10) default '' not null,
 posttype VARCHAR2(10) default '',
 deptno VARCHAR2(10) default '',
 startdate VARCHAR2(8) default '',
 enddate VARCHAR2(8) default '',
 accounttype VARCHAR2(10) default '',
 attendrate NUMBER(10,4) default 0,
 meritscore VARCHAR2(10) default '',
 excitationfactor NUMBER(20,2) default 0,
 basesalary NUMBER(20,4) default 0,
 issuesalary NUMBER(20,4) default 0,
 createempno VARCHAR2(10) default '',
 createdate VARCHAR2(8) default '',
 createtime VARCHAR2(6) default '',
 updateempno VARCHAR2(10) default '',
 updatedate VARCHAR2(8) default '',
 updatetime VARCHAR2(6) default '',
 tenurerate NUMBER(10,4)
)
tablespace ERPDATA
 pctfree 10
 initrans 1
 maxtrans 255
 storage
 (
  initial 64K
  next 1M
  minextents 1
  maxextents unlimited
 )
;