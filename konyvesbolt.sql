--------------------------------------------------------
--  File created - csütörtök-május-18-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQCALL" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQCALL_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'H656415' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
  SELECT q_name QUEUE, msgid MSG_ID, corrid CORR_ID, priority MSG_PRIORITY, decode(state, 0,   'READY',
                                1,   'WAIT',
                                2,   'PROCESSED',
                                3,   'EXPIRED',
                                10,  'BUFFERED_EXPIRED') MSG_STATE, cast(FROM_TZ(delay, '00:00')
                  at time zone sessiontimezone as date) DELAY, cast(FROM_TZ(delay, '00:00')
               at time zone sessiontimezone as timestamp) DELAY_TIMESTAMP, expiration, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as date) ENQ_TIME, cast(FROM_TZ(enq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  ENQ_TIMESTAMP, enq_uid ENQ_USER_ID, enq_tid ENQ_TXN_ID, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as date) DEQ_TIME, cast(FROM_TZ(deq_time, '00:00')
                  at time zone sessiontimezone as timestamp) 
                  DEQ_TIMESTAMP, deq_uid DEQ_USER_ID, deq_tid DEQ_TXN_ID, retry_count,  decode (state, 0, exception_qschema, 
                                  1, exception_qschema, 
                                  2, exception_qschema,  
                                  NULL) EXCEPTION_QUEUE_OWNER,  decode (state, 0, exception_queue, 
                                  1, exception_queue, 
                                  2, exception_queue,  
                                  NULL) EXCEPTION_QUEUE,  user_data,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_queue), NULL)
                                ORIGINAL_QUEUE_NAME,  decode (state, 3, 
                     decode (deq_tid, 'INVALID_TRANSACTION', NULL, 
                             exception_qschema), NULL)
                                ORIGINAL_QUEUE_OWNER,  decode(state, 3, 
                     decode(deq_time, NULL, 
                       decode(deq_tid, NULL,
                       decode (expiration , NULL , 'MAX_RETRY_EXCEEDED',
                            'TIME_EXPIRATION'),
                              'INVALID_TRANSACTION', NULL,
                              'MAX_RETRY_EXCEEDED'), NULL), NULL) 
                             EXPIRATION_REASON  FROM "DEF$_AQERROR" WHERE state != 7 AND   state != 9 WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$_DEF$_AQERROR_F
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'H656415' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from H656415.MVIEW$_ADV_OUTPUT t1, H656415.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;
 

   COMMENT ON TABLE "H656415"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from H656415.MVIEW$_ADV_EXCEPTIONS t1, H656415.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');
 

   COMMENT ON TABLE "H656415"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from H656415.mview$_adv_filter a, H656415.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');
 

   COMMENT ON TABLE "H656415"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
  select
      a.runid# as runid,
      a.filterid# as filterid,
      a.subfilternum# as subfilternum,
      decode(a.subfiltertype,1,'APPLICATION',2,'CARDINALITY',3,'LASTUSE',
                             4,'FREQUENCY',5,'USER',6,'PRIORITY',7,'BASETABLE',
                             8,'RESPONSETIME',9,'COLLECTIONID',10,'TRACENAME',
                             11,'SCHEMA','UNKNOWN') AS subfiltertype,
      a.str_value,
      to_number(decode(a.num_value1,-999,NULL,a.num_value1)) AS num_value1,
      to_number(decode(a.num_value2,-999,NULL,a.num_value2)) AS num_value2,
      a.date_value1,
      a.date_value2
   from H656415.mview$_adv_filterinstance a;
 

   COMMENT ON TABLE "H656415"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
  select
      m.runid# as id,
      m.filterid# as filterid,
      m.run_begin,
      m.run_end,
      decode(m.run_type,1,'EVALUATE',2,'EVALUATE_W',3,'RECOMMEND',
                      4,'RECOMMEND_W',5,'VALIDATE',6,'WORKLOAD',
                      7,'FILTER','UNKNOWN') AS type,
      decode(m.status,0,'UNUSED',1,'CANCELLED',2,'IN_PROGRESS',3,'COMPLETED',
                    4,'ERROR','UNKNOWN') AS status,
      m.message,
      m.completed,
      m.total,
      m.error_code
   from H656415.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');
 

   COMMENT ON TABLE "H656415"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  t1.from_clause as all_tables,
  fact_tables,
  grouping_levels,
  query_text,
  rank# as recommendation_number,
  action_type as recommended_action,
  summary_owner as mview_owner,
  summary_name as mview_name,
  storage_in_bytes,
  pct_performance_gain,
  benefit_to_cost_ratio
from H656415.MVIEW$_ADV_OUTPUT t1, H656415.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;
 

   COMMENT ON TABLE "H656415"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
  select
  a.collectionid# as workloadid,
  a.collecttime as import_time,
  a.queryid# as queryid,
  a.application,
  a.cardinality,
  a.resultsize,
  a.qdate as lastuse,
  a.frequency,
  a.uname as owner,
  a.priority,
  a.sql_text as query,
  a.exec_time as responsetime
from H656415.MVIEW$_ADV_WORKLOAD A, H656415.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');
 

   COMMENT ON TABLE "H656415"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "H656415"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "H656415"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
(
  -- type owner, name, hashcode for the type represented by null_vector
  type_owner      VARCHAR2(30),
  type_name       VARCHAR2(30),
  type_hashcode   RAW(17),
  -- null_vector for a particular object instance
  -- ROBJ REVISIT: should only contain the null image, and not version#
  null_vector     RAW(2000)
)

/
--------------------------------------------------------
--  DDL for Table BOLT
--------------------------------------------------------

  CREATE TABLE "H656415"."BOLT" 
   (	"BOLT_ID" NUMBER, 
	"TERMEK_ID" NUMBER, 
	"NEV" VARCHAR2(100 BYTE), 
	"DARABSZAM" VARCHAR2(4 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table E_BOOK
--------------------------------------------------------

  CREATE TABLE "H656415"."E_BOOK" 
   (	"TERMEK_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table E_BOOK_SZERZO
--------------------------------------------------------

  CREATE TABLE "H656415"."E_BOOK_SZERZO" 
   (	"E_BOOK_TERMEK_ID" NUMBER, 
	"SZERZO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONYV
--------------------------------------------------------

  CREATE TABLE "H656415"."KONYV" 
   (	"TERMEK_ID" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KONYV_SZERZO
--------------------------------------------------------

  CREATE TABLE "H656415"."KONYV_SZERZO" 
   (	"KONYV_TERMEK_ID" NUMBER, 
	"SZERZO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FILM
--------------------------------------------------------

  CREATE TABLE "H656415"."FILM" 
   (	"TERMEK_ID" NUMBER, 
	"RENDEZO" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table TERMEK
--------------------------------------------------------

  CREATE TABLE "H656415"."TERMEK" 
   (	"ID" NUMBER, 
	"CIM" VARCHAR2(100 BYTE), 
	"KIADAS_EVE" NUMBER(4,0), 
	"AR" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ZENE
--------------------------------------------------------

  CREATE TABLE "H656415"."ZENE" 
   (	"TERMEK_ID" NUMBER, 
	"EGYUTTES_NEVE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table LAKCIM
--------------------------------------------------------

  CREATE TABLE "H656415"."LAKCIM" 
   (	"ID" NUMBER, 
	"IRSZAM" NUMBER(4,0), 
	"HAZSZAM" NUMBER(3,0), 
	"VAROS" VARCHAR2(100 BYTE), 
	"UTCA" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FELHASZNALO
--------------------------------------------------------

  CREATE TABLE "H656415"."FELHASZNALO" 
   (	"FELHASZNALO_ID" NUMBER, 
	"LAKCIM_ID" NUMBER, 
	"NEV" VARCHAR2(100 BYTE), 
	"TIPUS" VARCHAR2(20 BYTE), 
	"JELSZO" VARCHAR2(30 BYTE), 
	"TORZSVASARLO" NUMBER(1,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table VASARLAS
--------------------------------------------------------

  CREATE TABLE "H656415"."VASARLAS" 
   (	"TERMEK_ID" NUMBER, 
	"FELHASZNALO_ID" NUMBER, 
	"LAKCIM_ID" NUMBER, 
	"DATUM" DATE DEFAULT SYSDATE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table KESZLET
--------------------------------------------------------

  CREATE TABLE "H656415"."KESZLET" 
   (	"TERMEK_ID" NUMBER, 
	"BOLT_ID" NUMBER, 
	"UZENET" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table MUFAJ
--------------------------------------------------------

  CREATE TABLE "H656415"."MUFAJ" 
   (	"TERMEK_ID" NUMBER, 
	"MUFAJ" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Sequence BOLT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."BOLT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOLT_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."BOLT_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TERMEK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."TERMEK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence TERMEK_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."TERMEK_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LAKCIM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."LAKCIM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LAKCIM_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."LAKCIM_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FELHASZNALO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."FELHASZNALO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FELHASZNALO_SEQ1
--------------------------------------------------------

   CREATE SEQUENCE  "H656415"."FELHASZNALO_SEQ1"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into H656415.BOLT
SET DEFINE OFF;
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('71','1','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('72','2','Libri','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('73','3','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('74','4','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('75','5','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('76','6','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('77','7','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('78','8','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('79','9','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('80','10','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('81','11','Libri','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('82','18','Libri','2');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('83','12','Libri','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('84','12','Musik','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('85','13','Musik','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('86','14','Musik','2');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('87','15','Musik','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('88','16','Musik','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('89','17','Filmtár','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('90','18','Filmtár','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('91','19','Filmtár','2');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('92','20','Filmtár','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('93','21','Filmtár','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('94','22','Filmtár','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('95','23','Filmtár','2');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('97','21','Vegyesbolt','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('98','1','Vegyesbolt','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('99','5','Vegyesbolt','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('100','17','Vegyesbolt','3');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('101','10','Vegyesbolt','2');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('102','15','Vegyesbolt','1');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('103','12','Vegyesbolt','5');
Insert into H656415.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('105','24','Vegyesbolt','1');
REM INSERTING into H656415.E_BOOK
SET DEFINE OFF;
Insert into H656415.E_BOOK (TERMEK_ID) values ('7');
Insert into H656415.E_BOOK (TERMEK_ID) values ('8');
Insert into H656415.E_BOOK (TERMEK_ID) values ('9');
Insert into H656415.E_BOOK (TERMEK_ID) values ('10');
Insert into H656415.E_BOOK (TERMEK_ID) values ('11');
REM INSERTING into H656415.E_BOOK_SZERZO
SET DEFINE OFF;
Insert into H656415.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('7','Carl Zuckmayer');
Insert into H656415.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('8','Terry Pratchett');
Insert into H656415.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('9','Terry Pratchett');
Insert into H656415.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('10','Terry Pratchett');
Insert into H656415.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('11','Terry Pratchett');
REM INSERTING into H656415.KONYV
SET DEFINE OFF;
Insert into H656415.KONYV (TERMEK_ID) values ('1');
Insert into H656415.KONYV (TERMEK_ID) values ('2');
Insert into H656415.KONYV (TERMEK_ID) values ('3');
Insert into H656415.KONYV (TERMEK_ID) values ('4');
Insert into H656415.KONYV (TERMEK_ID) values ('5');
Insert into H656415.KONYV (TERMEK_ID) values ('6');
REM INSERTING into H656415.KONYV_SZERZO
SET DEFINE OFF;
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('1','Mintaszerzõ');
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('2','Bill Crider');
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('3','O. Henry');
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('4','Jon A. Jackson');
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('5','Polly Cameron');
Insert into H656415.KONYV_SZERZO (KONYV_TERMEK_ID,SZERZO) values ('6','Carl Zuckmayer');
REM INSERTING into H656415.FILM
SET DEFINE OFF;
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('17','Frank Darabont');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('18','Francis Ford Coppola');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('19','Francis Ford Coppola');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('20','Christopher Nolan');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('21','Steven Spielberg');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('22','Quentin Tarantino');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('23','Peter Jackson');
Insert into H656415.FILM (TERMEK_ID,RENDEZO) values ('24','Irvin Kershner');
REM INSERTING into H656415.TERMEK
SET DEFINE OFF;
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('15','13','2013','3000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('23','A Birodalom visszavág','1980','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('22','A Gyûrûk Ura: A gyûrû szövetsége','2001','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('17','A keresztapa','1972','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('18','A keresztapa II','1974','2222');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('7','A mágia fénye','1998','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('8','A mágia színe','1999','1999');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('16','A remény rabjai','1994','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('19','A sötét lovag','2008','3000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('11','At the Heart of Winter','1999','1000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('2','But I Feel the Bright Eyes...','1994','3000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('9','Egyenjogú rítusok','1992','3000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('3','Girl','1910','666');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('4','Go By Go','1998','777');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('24','Hetedik','1995','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('5','I Like It Here','1950','3000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('6','I Like It Here Too','1951','1000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('13','Led Zeppelin IV','1971','1000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('1','Minta','1999','999');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('10','Mort, A Halál kisinasa','1998','4000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('14','Paranoid','1970','1000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('21','Ponyvaregény','2004','5000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('12','Rubber Soul','1965','2000');
Insert into H656415.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('20','Schindler listája','2004','5000');
REM INSERTING into H656415.ZENE
SET DEFINE OFF;
Insert into H656415.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('12','Immortal');
Insert into H656415.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('13','The Beatles');
Insert into H656415.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('14','Led Zeppelin');
Insert into H656415.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('15','Black Sabbath');
Insert into H656415.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('16','Black Sabbath');
REM INSERTING into H656415.LAKCIM
SET DEFINE OFF;
Insert into H656415.LAKCIM (ID,IRSZAM,HAZSZAM,VAROS,UTCA) values ('3','6725','10','Szeged','Tisza Lajos krt.');
Insert into H656415.LAKCIM (ID,IRSZAM,HAZSZAM,VAROS,UTCA) values ('4','6725','14','Szeged','Tisza Lajos krt.');
Insert into H656415.LAKCIM (ID,IRSZAM,HAZSZAM,VAROS,UTCA) values ('2','6725','24','Szeged','Tisza Lajos krt.');
Insert into H656415.LAKCIM (ID,IRSZAM,HAZSZAM,VAROS,UTCA) values ('1','6725','88','Szeged','Tisza Lajos krt.');
REM INSERTING into H656415.FELHASZNALO
SET DEFINE OFF;
Insert into H656415.FELHASZNALO (FELHASZNALO_ID,LAKCIM_ID,NEV,TIPUS,JELSZO,TORZSVASARLO) values ('3','1','andrea123','felhasznalo','123',null);
Insert into H656415.FELHASZNALO (FELHASZNALO_ID,LAKCIM_ID,NEV,TIPUS,JELSZO,TORZSVASARLO) values ('4','2','bela123','felhasznalo','123',null);
REM INSERTING into H656415.VASARLAS
SET DEFINE OFF;
REM INSERTING into H656415.KESZLET
SET DEFINE OFF;
REM INSERTING into H656415.MUFAJ
SET DEFINE OFF;
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('1','minta');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('2','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('3','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('4','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('5','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('5','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('6','sci-fi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('7','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('8','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('8','sci-fi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('9','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('9','sci-fi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('10','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('10','sci-fi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('11','humor');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('11','sci-fi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('12','black metal');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('13','psychedelic rock');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('14','psychedelic rock');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('15','doom metal');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('16','doom metal');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('17','bûnügyi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('17','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('18','bûnügyi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('18','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('19','bûnügyi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('19','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('20','akció');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('20','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('20','thriller');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('21','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('21','történelem');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('22','bûnügyi');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('22','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('23','dráma');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('23','fantasy');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('23','kaland');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('24','akció');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('24','kaland');
Insert into H656415.MUFAJ (TERMEK_ID,MUFAJ) values ('24','sci-fi');
--------------------------------------------------------
--  DDL for Index BOLT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."BOLT_PK" ON "H656415"."BOLT" ("BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index BOLT_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."BOLT_UK1" ON "H656415"."BOLT" ("NEV", "TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index E_BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."E_BOOK_PK" ON "H656415"."E_BOOK" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index E_BOOK_SZERZO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."E_BOOK_SZERZO_PK" ON "H656415"."E_BOOK_SZERZO" ("E_BOOK_TERMEK_ID", "SZERZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."KONYV_PK" ON "H656415"."KONYV" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KONYV_SZERZO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."KONYV_SZERZO_PK" ON "H656415"."KONYV_SZERZO" ("KONYV_TERMEK_ID", "SZERZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FILM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."FILM_PK" ON "H656415"."FILM" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TERMEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."TERMEK_PK" ON "H656415"."TERMEK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index TERMEK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."TERMEK_UK1" ON "H656415"."TERMEK" ("CIM", "KIADAS_EVE", "AR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index ZENE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."ZENE_PK" ON "H656415"."ZENE" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LAKCIM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."LAKCIM_PK" ON "H656415"."LAKCIM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index LAKCIM_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."LAKCIM_UK1" ON "H656415"."LAKCIM" ("IRSZAM", "HAZSZAM", "VAROS", "UTCA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index FELHASZNALO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."FELHASZNALO_PK" ON "H656415"."FELHASZNALO" ("FELHASZNALO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index VASARLAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."VASARLAS_PK" ON "H656415"."VASARLAS" ("TERMEK_ID", "FELHASZNALO_ID", "LAKCIM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index KESZLET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."KESZLET_PK" ON "H656415"."KESZLET" ("TERMEK_ID", "BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index MUFAJ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "H656415"."MUFAJ_PK" ON "H656415"."MUFAJ" ("TERMEK_ID", "MUFAJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger BOLT_ELFOGYOTT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "H656415"."BOLT_ELFOGYOTT" 
AFTER UPDATE OR INSERT ON BOLT
FOR EACH ROW
 WHEN (NEW.DARABSZAM = 0) DECLARE 
  v_figyelmeztetes  BOLT.UZENET%TYPE;
  v_termek_cim      TERMEK.CIM%TYPE;
BEGIN
  SELECT CIM INTO v_termek_cim FROM TERMEK WHERE TERMEK.ID = :NEW.TERMEK_ID;
  v_figyelmeztetes := v_termek_cim || ' elfogyott!';
  INSERT INTO KESZLET (BOLT_ID, TERMEK_ID, UZENET) VALUES (:NEW.BOLT_ID, :NEW.TERMEK_ID, v_figyelmeztetes);
END;
/
ALTER TRIGGER "H656415"."BOLT_ELFOGYOTT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BOLT_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "H656415"."BOLT_ID_TRG" 
BEFORE INSERT ON BOLT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BOLT_ID IS NULL THEN
      SELECT BOLT_SEQ1.NEXTVAL INTO :NEW.BOLT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "H656415"."BOLT_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TERMEK_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "H656415"."TERMEK_ID_TRG" 
BEFORE INSERT ON TERMEK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TERMEK_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "H656415"."TERMEK_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LAKCIM_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "H656415"."LAKCIM_ID_TRG" 
BEFORE INSERT ON LAKCIM 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT LAKCIM_SEQ1.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "H656415"."LAKCIM_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FELHASZNALO_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "H656415"."FELHASZNALO_ID_TRG" 
BEFORE INSERT ON FELHASZNALO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.FELHASZNALO_ID IS NULL THEN
      SELECT FELHASZNALO_SEQ1.NEXTVAL INTO :NEW.FELHASZNALO_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "H656415"."FELHASZNALO_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "H656415"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON H656415.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "H656415"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
b
b9d 39c
PBMGkNCh5NDAdLezCHsLvZaVi/swg5UrNSCDfI4Zvp0VB6GpRld+By6E2nVdlFHT2g2kK9zM
8jSnsuee7mkmJD+W3Mo36HQvUfOe7jH5vP7tu1i0jDykzR0pUhJZUcY6xVrSwNPoNVPcT72N
eHhGwyRBj2+0vKbgTmcZKBMJzETRfOl2YGDDVB3FvKBSixMMqfWSX8uh3wPGOi8W9vOASC3z
0UvPqL7KR78SykUEoBCxpMGmE8pgElC/dagmVpIIt7QA6sneMlNb2OO/1zTN44ACRsm+2JAo
zD41TcuGaNUqDYNDRbPEKzeRZeXxrx1UvOWsYTNaO6icaV/NrtZbmXpDuGA/sqnz4jnKFK8S
0VC+Yjh2iJEV5edD2+8pyMgx44NVDiAQ+sjjDkpGc0IxXrm/v52yduhnj/xnkualIm/RyAv0
Q/YzRAHy7NvyavbajIvCFoZWpbO3Jw8NwkoU25ysfgvXZJrw4vPjh4hHR4Mpto6jFMM+dZPW
3N9HL971bTBgyAL0BjASEFXe83D+IoBYX0VQVk5+t7p7iUsmfyK5t+cECNpNOL6UaACcsAYB
Le+yLOAqFHSvCXlWcECxG7wXjAA2/XmBwvKBNLcggXKVp3i9cNzab0Mq9qSAcIYgRFxRdAOe
sTDZNOx6HkJTbCRKCMiJzgjQQW476DlOZD+9Gwh+AA/Y3PIDOfyhlvXT6HsjW33mASJUuORB
la5Jb3rB4syO6QO2a5vSHu26Gwib2EflS8bqC1hZhpHsvM+mAaWJ2x72JyrPe8V7Ohjbre49
gRsjAtspIYfP5958sSnHdkz32nGAXnrEY95lEHGwkuXLlj9y6I21aAyd3/lJkuEAEBxzZVnm
IaNJBwl8u33+SqGLZzILy1QxmA+pF8yUaQ+yRU/5+3n1mY4=


/
--------------------------------------------------------
--  DDL for Package DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE "H656415"."DBMS_REPCAT_AUTH" wrapped
a000000
1
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
abcd
9
bf d6
0cfc6e4Sm6mfaMYwsbW2JygBepcwg/BKmJ4VZy/pO06UXsVUMejsissTcGWYR4qeK4TPqfDK
q7UPH+SmKP6nW9zmxMZnuK1VDzM0Iv9O4E4SvvsnHWn+EPF9hR+oBFe3fEro6RQ5R5Ejd1nr
e+fAK010dExf76gg/c6ZB3YxGPHDOqkGI4lV6HNsd57gKLwTd0bxan5UwJriIpt7Vjc=


/
--------------------------------------------------------
--  Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "H656415"."BOLT" ADD CONSTRAINT "BOLT_CHK1" CHECK (DARABSZAM >= 0) ENABLE;
 
  ALTER TABLE "H656415"."BOLT" ADD CONSTRAINT "BOLT_PK" PRIMARY KEY ("BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."BOLT" ADD CONSTRAINT "BOLT_UK1" UNIQUE ("NEV", "TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."BOLT" MODIFY ("BOLT_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."BOLT" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."BOLT" MODIFY ("NEV" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."BOLT" MODIFY ("DARABSZAM" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table E_BOOK
--------------------------------------------------------

  ALTER TABLE "H656415"."E_BOOK" ADD CONSTRAINT "E_BOOK_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."E_BOOK" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table E_BOOK_SZERZO
--------------------------------------------------------

  ALTER TABLE "H656415"."E_BOOK_SZERZO" ADD CONSTRAINT "E_BOOK_SZERZO_PK" PRIMARY KEY ("E_BOOK_TERMEK_ID", "SZERZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."E_BOOK_SZERZO" MODIFY ("E_BOOK_TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."E_BOOK_SZERZO" MODIFY ("SZERZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "H656415"."KONYV" ADD CONSTRAINT "KONYV_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."KONYV" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table KONYV_SZERZO
--------------------------------------------------------

  ALTER TABLE "H656415"."KONYV_SZERZO" ADD CONSTRAINT "KONYV_SZERZO_PK" PRIMARY KEY ("KONYV_TERMEK_ID", "SZERZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."KONYV_SZERZO" MODIFY ("KONYV_TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."KONYV_SZERZO" MODIFY ("SZERZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "H656415"."FILM" ADD CONSTRAINT "FILM_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."FILM" MODIFY ("RENDEZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TERMEK
--------------------------------------------------------

  ALTER TABLE "H656415"."TERMEK" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."TERMEK" MODIFY ("CIM" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."TERMEK" MODIFY ("KIADAS_EVE" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."TERMEK" MODIFY ("AR" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."TERMEK" ADD CONSTRAINT "TERMEK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."TERMEK" ADD CONSTRAINT "TERMEK_UK1" UNIQUE ("CIM", "KIADAS_EVE", "AR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZENE
--------------------------------------------------------

  ALTER TABLE "H656415"."ZENE" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."ZENE" MODIFY ("EGYUTTES_NEVE" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."ZENE" ADD CONSTRAINT "ZENE_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LAKCIM
--------------------------------------------------------

  ALTER TABLE "H656415"."LAKCIM" ADD CONSTRAINT "LAKCIM_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."LAKCIM" ADD CONSTRAINT "LAKCIM_UK1" UNIQUE ("IRSZAM", "HAZSZAM", "VAROS", "UTCA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."LAKCIM" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."LAKCIM" MODIFY ("IRSZAM" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."LAKCIM" MODIFY ("HAZSZAM" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."LAKCIM" MODIFY ("VAROS" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."LAKCIM" MODIFY ("UTCA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FELHASZNALO
--------------------------------------------------------

  ALTER TABLE "H656415"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_CHK1" CHECK (TORZSVASARLO = 0 OR TORZSVASARLO = 1) ENABLE;
 
  ALTER TABLE "H656415"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_PK" PRIMARY KEY ("FELHASZNALO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."FELHASZNALO" MODIFY ("FELHASZNALO_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."FELHASZNALO" MODIFY ("LAKCIM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."FELHASZNALO" MODIFY ("NEV" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."FELHASZNALO" MODIFY ("TIPUS" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."FELHASZNALO" MODIFY ("JELSZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table VASARLAS
--------------------------------------------------------

  ALTER TABLE "H656415"."VASARLAS" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."VASARLAS" MODIFY ("FELHASZNALO_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."VASARLAS" MODIFY ("LAKCIM_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."VASARLAS" MODIFY ("DATUM" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."VASARLAS" ADD CONSTRAINT "VASARLAS_PK" PRIMARY KEY ("TERMEK_ID", "FELHASZNALO_ID", "LAKCIM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KESZLET
--------------------------------------------------------

  ALTER TABLE "H656415"."KESZLET" ADD CONSTRAINT "KESZLET_PK" PRIMARY KEY ("TERMEK_ID", "BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."KESZLET" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."KESZLET" MODIFY ("BOLT_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MUFAJ
--------------------------------------------------------

  ALTER TABLE "H656415"."MUFAJ" ADD CONSTRAINT "MUFAJ_PK" PRIMARY KEY ("TERMEK_ID", "MUFAJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
 
  ALTER TABLE "H656415"."MUFAJ" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
 
  ALTER TABLE "H656415"."MUFAJ" MODIFY ("MUFAJ" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "H656415"."BOLT" ADD CONSTRAINT "BOLT_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table E_BOOK
--------------------------------------------------------

  ALTER TABLE "H656415"."E_BOOK" ADD CONSTRAINT "E_BOOK_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table E_BOOK_SZERZO
--------------------------------------------------------

  ALTER TABLE "H656415"."E_BOOK_SZERZO" ADD CONSTRAINT "E_BOOK_SZERZO_FK1" FOREIGN KEY ("E_BOOK_TERMEK_ID")
	  REFERENCES "H656415"."E_BOOK" ("TERMEK_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "H656415"."KONYV" ADD CONSTRAINT "KONYV_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV_SZERZO
--------------------------------------------------------

  ALTER TABLE "H656415"."KONYV_SZERZO" ADD CONSTRAINT "KONYV_SZERZO_FK1" FOREIGN KEY ("KONYV_TERMEK_ID")
	  REFERENCES "H656415"."KONYV" ("TERMEK_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "H656415"."FILM" ADD CONSTRAINT "FILM_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZENE
--------------------------------------------------------

  ALTER TABLE "H656415"."ZENE" ADD CONSTRAINT "ZENE_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FELHASZNALO
--------------------------------------------------------

  ALTER TABLE "H656415"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_FK1" FOREIGN KEY ("FELHASZNALO_ID")
	  REFERENCES "H656415"."LAKCIM" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VASARLAS
--------------------------------------------------------

  ALTER TABLE "H656415"."VASARLAS" ADD CONSTRAINT "VASARLAS_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "H656415"."VASARLAS" ADD CONSTRAINT "VASARLAS_FK2" FOREIGN KEY ("FELHASZNALO_ID")
	  REFERENCES "H656415"."FELHASZNALO" ("FELHASZNALO_ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "H656415"."VASARLAS" ADD CONSTRAINT "VASARLAS_FK3" FOREIGN KEY ("LAKCIM_ID")
	  REFERENCES "H656415"."LAKCIM" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KESZLET
--------------------------------------------------------

  ALTER TABLE "H656415"."KESZLET" ADD CONSTRAINT "KESZLET_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
 
  ALTER TABLE "H656415"."KESZLET" ADD CONSTRAINT "KESZLET_FK2" FOREIGN KEY ("BOLT_ID")
	  REFERENCES "H656415"."BOLT" ("BOLT_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MUFAJ
--------------------------------------------------------

  ALTER TABLE "H656415"."MUFAJ" ADD CONSTRAINT "MUFAJ_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "H656415"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
