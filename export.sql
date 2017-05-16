--------------------------------------------------------
--  File created - kedd-május-16-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQCALL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQCALL" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
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

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQCALL_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQCALL" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View AQ$DEF$_AQERROR
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$DEF$_AQERROR" ("QUEUE", "MSG_ID", "CORR_ID", "MSG_PRIORITY", "MSG_STATE", "DELAY", "DELAY_TIMESTAMP", "EXPIRATION", "ENQ_TIME", "ENQ_TIMESTAMP", "ENQ_USER_ID", "ENQ_TXN_ID", "DEQ_TIME", "DEQ_TIMESTAMP", "DEQ_USER_ID", "DEQ_TXN_ID", "RETRY_COUNT", "EXCEPTION_QUEUE_OWNER", "EXCEPTION_QUEUE", "USER_DATA", "ORIGINAL_QUEUE_NAME", "ORIGINAL_QUEUE_OWNER", "EXPIRATION_REASON") AS 
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

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."AQ$_DEF$_AQERROR_F" ("Q_NAME", "ROW_ID", "MSGID", "CORRID", "PRIORITY", "STATE", "DELAY", "EXPIRATION", "ENQ_TIME", "ENQ_UID", "ENQ_TID", "DEQ_TIME", "DEQ_UID", "DEQ_TID", "RETRY_COUNT", "EXCEPTION_QSCHEMA", "EXCEPTION_QUEUE", "CSCN", "DSCN", "CHAIN_NO", "LOCAL_ORDER_NO", "TIME_MANAGER_INFO", "STEP_NO", "USER_DATA", "QUEUE_ID") AS 
  SELECT  /*+ NO_MERGE (qo) USE_NL(qt) */ qt.q_name Q_NAME, qt.rowid ROW_ID, qt.msgid MSGID, qt.corrid CORRID, qt.priority PRIORITY, qt.state STATE, cast(FROM_TZ(qt.delay, '00:00') at time zone sessiontimezone as timestamp) DELAY, qt.expiration EXPIRATION, cast(FROM_TZ(qt.enq_time, '00:00') at time zone sessiontimezone as timestamp) ENQ_TIME, qt.enq_uid ENQ_UID, qt.enq_tid ENQ_TID, cast(FROM_TZ(qt.deq_time, '00:00') at time zone sessiontimezone as timestamp) DEQ_TIME, qt.deq_uid DEQ_UID, qt.deq_tid DEQ_TID, qt.retry_count RETRY_COUNT, qt.exception_qschema EXCEPTION_QSCHEMA, qt.exception_queue EXCEPTION_QUEUE, qt.cscn CSCN, qt.dscn DSCN, qt.chain_no CHAIN_NO, qt.local_order_no LOCAL_ORDER_NO, cast(FROM_TZ(qt.time_manager_info, '00:00') at time zone sessiontimezone as timestamp)   TIME_MANAGER_INFO, qt.step_no STEP_NO, qt.user_data USER_DATA , qo.qid QUEUE_ID  FROM "DEF$_AQERROR" qt, SYS.ALL_INT_DEQUEUE_QUEUES  qo  WHERE qt.q_name = qo.name AND qo.owner = 'SYSTEM' WITH READ ONLY;
--------------------------------------------------------
--  DDL for View MVIEW_EVALUATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EVALUATIONS" ("RUNID", "MVIEW_OWNER", "MVIEW_NAME", "RANK", "STORAGE_IN_BYTES", "FREQUENCY", "CUMULATIVE_BENEFIT", "BENEFIT_TO_COST_RATIO") AS 
  select
  t1.runid# as runid,
  summary_owner AS mview_owner,
  summary_name AS mview_name,
  rank# as rank,
  storage_in_bytes,
  frequency,
  cumulative_benefit,
  benefit_to_cost_ratio
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 1
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_EVALUATIONS"  IS 'This view gives DBA access to summary evaluation output';
--------------------------------------------------------
--  DDL for View MVIEW_EXCEPTIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_EXCEPTIONS" ("RUNID", "OWNER", "TABLE_NAME", "DIMENSION_NAME", "RELATIONSHIP", "BAD_ROWID") AS 
  select
  t1.runid# as runid,
  owner,
  table_name,
  dimension_name,
  relationship,
  bad_rowid
from SYSTEM.MVIEW$_ADV_EXCEPTIONS t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_EXCEPTIONS"  IS 'This view gives DBA access to dimension validation results';
--------------------------------------------------------
--  DDL for View MVIEW_FILTER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTER" ("FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
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
   from system.mview$_adv_filter a, system.mview$_adv_log b, ALL_USERS u
   WHERE a.filterid# = b.runid#
   AND b.uname = u.username
   AND u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTER"  IS 'Workload filter records';
--------------------------------------------------------
--  DDL for View MVIEW_FILTERINSTANCE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_FILTERINSTANCE" ("RUNID", "FILTERID", "SUBFILTERNUM", "SUBFILTERTYPE", "STR_VALUE", "NUM_VALUE1", "NUM_VALUE2", "DATE_VALUE1", "DATE_VALUE2") AS 
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
   from system.mview$_adv_filterinstance a;

   COMMENT ON TABLE "SYSTEM"."MVIEW_FILTERINSTANCE"  IS 'Workload filter instance records';
--------------------------------------------------------
--  DDL for View MVIEW_LOG
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_LOG" ("ID", "FILTERID", "RUN_BEGIN", "RUN_END", "TYPE", "STATUS", "MESSAGE", "COMPLETED", "TOTAL", "ERROR_CODE") AS 
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
   from system.mview$_adv_log m, all_users u
   where m.uname = u.username
   and   u.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_LOG"  IS 'Advisor session log';
--------------------------------------------------------
--  DDL for View MVIEW_RECOMMENDATIONS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_RECOMMENDATIONS" ("RUNID", "ALL_TABLES", "FACT_TABLES", "GROUPING_LEVELS", "QUERY_TEXT", "RECOMMENDATION_NUMBER", "RECOMMENDED_ACTION", "MVIEW_OWNER", "MVIEW_NAME", "STORAGE_IN_BYTES", "PCT_PERFORMANCE_GAIN", "BENEFIT_TO_COST_RATIO") AS 
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
from SYSTEM.MVIEW$_ADV_OUTPUT t1, SYSTEM.MVIEW$_ADV_LOG t2, ALL_USERS u
where
  t1.runid# = t2.runid# and
  u.username = t2.uname and
  u.user_id = userenv('SCHEMAID') and
  t1.output_type = 0
order by t1.rank#;

   COMMENT ON TABLE "SYSTEM"."MVIEW_RECOMMENDATIONS"  IS 'This view gives DBA access to summary recommendations';
--------------------------------------------------------
--  DDL for View MVIEW_WORKLOAD
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."MVIEW_WORKLOAD" ("WORKLOADID", "IMPORT_TIME", "QUERYID", "APPLICATION", "CARDINALITY", "RESULTSIZE", "LASTUSE", "FREQUENCY", "OWNER", "PRIORITY", "QUERY", "RESPONSETIME") AS 
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
from SYSTEM.MVIEW$_ADV_WORKLOAD A, SYSTEM.MVIEW$_ADV_LOG B, ALL_USERS D
WHERE a.collectionid# = b.runid#
AND b.uname = d.username
AND d.user_id = userenv('SCHEMAID');

   COMMENT ON TABLE "SYSTEM"."MVIEW_WORKLOAD"  IS 'This view gives DBA access to shared workload';
--------------------------------------------------------
--  DDL for View PRODUCT_PRIVS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "SYSTEM"."PRODUCT_PRIVS" ("PRODUCT", "USERID", "ATTRIBUTE", "SCOPE", "NUMERIC_VALUE", "CHAR_VALUE", "DATE_VALUE", "LONG_VALUE") AS 
  SELECT PRODUCT, USERID, ATTRIBUTE, SCOPE,
         NUMERIC_VALUE, CHAR_VALUE, DATE_VALUE, LONG_VALUE
  FROM SQLPLUS_PRODUCT_PROFILE
  WHERE USERID = 'PUBLIC' OR USER LIKE USERID;
--------------------------------------------------------
--  DDL for Type REPCAT$_OBJECT_NULL_VECTOR
--------------------------------------------------------

  CREATE OR REPLACE TYPE "SYSTEM"."REPCAT$_OBJECT_NULL_VECTOR" AS OBJECT
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
--  DDL for Table TERMEK
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."TERMEK" 
   (	"ID" NUMBER, 
	"CIM" VARCHAR2(100 BYTE), 
	"KIADAS_EVE" NUMBER(4,0), 
	"AR" NUMBER(10,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table KONYV
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KONYV" 
   (	"TERMEK_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table KONYV_SZERZO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KONYV_SZERZO" 
   (	"KONVY_TERMEK_ID" NUMBER, 
	"SZERZO" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FILM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."FILM" 
   (	"TERMEK_ID" NUMBER, 
	"RENDEZO" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table E_BOOK
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."E_BOOK" 
   (	"TERMEK_ID" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table E_BOOK_SZERZO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."E_BOOK_SZERZO" 
   (	"E_BOOK_TERMEK_ID" NUMBER, 
	"SZERZO" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table ZENE
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."ZENE" 
   (	"TERMEK_ID" NUMBER, 
	"EGYUTTES_NEVE" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table LAKCIM
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."LAKCIM" 
   (	"ID" NUMBER, 
	"IRSZAM" NUMBER(4,0) DEFAULT NULL, 
	"HAZSZAM" NUMBER(3,0) DEFAULT NULL, 
	"VAROS" VARCHAR2(100 BYTE) DEFAULT NULL, 
	"UTCA" VARCHAR2(100 BYTE) DEFAULT NULL
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table FELHASZNALO
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."FELHASZNALO" 
   (	"FELHASZNALO_ID" NUMBER, 
	"LAKCIM_ID" NUMBER, 
	"NEV" VARCHAR2(100 BYTE), 
	"TIPUS" VARCHAR2(20 BYTE), 
	"JELSZO" VARCHAR2(30 BYTE), 
	"TORZSVASARLO" NUMBER(1,0) DEFAULT 0
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MUFAJ
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."MUFAJ" 
   (	"TERMEK_ID" NUMBER, 
	"MUFAJ" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table VASARLAS
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."VASARLAS" 
   (	"TERMEK_ID" NUMBER, 
	"FELHASZNALO_ID" NUMBER, 
	"LAKCIM_ID" NUMBER, 
	"DATUM" DATE DEFAULT sysdate
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table KESZLET
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."KESZLET" 
   (	"TERMEK_ID" NUMBER, 
	"BOLT_ID" NUMBER, 
	"UZENET" VARCHAR2(100 BYTE)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOLT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."BOLT" 
   (	"BOLT_ID" NUMBER, 
	"TERMEK_ID" NUMBER, 
	"NEV" VARCHAR2(100 BYTE), 
	"DARABSZAM" NUMBER(4,0)
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Sequence TERMEK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."TERMEK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LAKCIM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."LAKCIM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence FELHASZNALO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."FELHASZNALO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOLT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "SYSTEM"."BOLT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
REM INSERTING into SYSTEM.TERMEK
SET DEFINE OFF;
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('1','Minta','1999','999');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('2','But I Feel the Bright Eyes...','1994','3000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('3','Girl','1910','666');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('4','Go By Go','1998','777');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('5','I Like It Here','1950','3000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('6','I Like It Here Too','1951','1000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('7','A mágia fénye','1998','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('8','A mágia színe','1999','1999');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('9','Egyenjogú rítusok','1992','3000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('10','Mort, A Halál kisinasa','1998','4000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('11','At the Heart of Winter','1999','1000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('12','Rubber Soul','1965','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('13','Led Zeppelin IV','1971','1000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('14','Paranoid','1970','1000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('15','13','2013','3000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('16','A remény rabjai','1994','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('17','A keresztapa','1972','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('18','A keresztapa II','1974','2222');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('19','A sötét lovag','2008','3000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('20','Schindler listája','2004','5000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('21','Ponyvaregény','2004','5000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('22','A Gyûrûk Ura: A gyûrû szövetsége','2001','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('23','A Birodalom visszavág','1980','2000');
Insert into SYSTEM.TERMEK (ID,CIM,KIADAS_EVE,AR) values ('24','Hetedik','1995','2000');
REM INSERTING into SYSTEM.KONYV
SET DEFINE OFF;
Insert into SYSTEM.KONYV (TERMEK_ID) values ('1');
Insert into SYSTEM.KONYV (TERMEK_ID) values ('2');
Insert into SYSTEM.KONYV (TERMEK_ID) values ('3');
Insert into SYSTEM.KONYV (TERMEK_ID) values ('4');
Insert into SYSTEM.KONYV (TERMEK_ID) values ('5');
Insert into SYSTEM.KONYV (TERMEK_ID) values ('6');
REM INSERTING into SYSTEM.KONYV_SZERZO
SET DEFINE OFF;
REM INSERTING into SYSTEM.FILM
SET DEFINE OFF;
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('17','Frank Darabont');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('18','Francis Ford Coppola');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('19','Francis Ford Coppola');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('20','Christopher Nolan');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('21','Steven Spielberg');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('22','Quentin Tarantino');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('23','Peter Jackson');
Insert into SYSTEM.FILM (TERMEK_ID,RENDEZO) values ('24','Irvin Kershner');
REM INSERTING into SYSTEM.E_BOOK
SET DEFINE OFF;
Insert into SYSTEM.E_BOOK (TERMEK_ID) values ('7');
Insert into SYSTEM.E_BOOK (TERMEK_ID) values ('8');
Insert into SYSTEM.E_BOOK (TERMEK_ID) values ('9');
Insert into SYSTEM.E_BOOK (TERMEK_ID) values ('10');
Insert into SYSTEM.E_BOOK (TERMEK_ID) values ('11');
REM INSERTING into SYSTEM.E_BOOK_SZERZO
SET DEFINE OFF;
Insert into SYSTEM.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('7','Carl Zuckmayer');
Insert into SYSTEM.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('8','Terry Pratchett');
Insert into SYSTEM.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('9','Terry Pratchett');
Insert into SYSTEM.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('10','Terry Pratchett');
Insert into SYSTEM.E_BOOK_SZERZO (E_BOOK_TERMEK_ID,SZERZO) values ('11','Terry Pratchett');
REM INSERTING into SYSTEM.ZENE
SET DEFINE OFF;
Insert into SYSTEM.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('12','Immortal');
Insert into SYSTEM.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('13','The Beatles');
Insert into SYSTEM.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('14','Led Zeppelin');
Insert into SYSTEM.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('15','Black Sabbath');
Insert into SYSTEM.ZENE (TERMEK_ID,EGYUTTES_NEVE) values ('16','Black Sabbath');
REM INSERTING into SYSTEM.LAKCIM
SET DEFINE OFF;
REM INSERTING into SYSTEM.FELHASZNALO
SET DEFINE OFF;
Insert into SYSTEM.FELHASZNALO (FELHASZNALO_ID,LAKCIM_ID,NEV,TIPUS,JELSZO,TORZSVASARLO) values ('1',null,'admin','admin','admin',null);
Insert into SYSTEM.FELHASZNALO (FELHASZNALO_ID,LAKCIM_ID,NEV,TIPUS,JELSZO,TORZSVASARLO) values ('2',null,'admin1','admin','admin1',null);
REM INSERTING into SYSTEM.MUFAJ
SET DEFINE OFF;
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('1','minta');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('2','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('3','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('4','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('5','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('5','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('6','sci-fi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('7','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('8','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('8','sci-fi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('9','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('9','sci-fi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('10','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('10','sci-fi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('11','humor');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('11','sci-fi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('12','black metal');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('13','psychedelic rock');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('14','psychedelic rock');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('15','doom metal');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('16','doom metal');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('17','bûnügyi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('17','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('18','bûnügyi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('18','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('19','bûnügyi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('19','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('20','akció');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('20','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('20','thriller');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('21','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('21','történelem');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('22','bûnügyi');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('22','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('23','dráma');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('23','fantasy');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('23','kaland');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('24','akció');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('24','kaland');
Insert into SYSTEM.MUFAJ (TERMEK_ID,MUFAJ) values ('24','sci-fi');
REM INSERTING into SYSTEM.VASARLAS
SET DEFINE OFF;
REM INSERTING into SYSTEM.KESZLET
SET DEFINE OFF;
REM INSERTING into SYSTEM.BOLT
SET DEFINE OFF;
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('1','1','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('2','2','Libri','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('3','3','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('4','4','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('5','5','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('6','6','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('7','7','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('8','8','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('9','9','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('10','10','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('11','11','Libri','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('12','18','Libri','2');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('13','12','Libri','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('14','12','Musik','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('15','13','Musik','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('16','14','Musik','2');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('17','15','Musik','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('18','16','Musik','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('19','17','Filmtár','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('20','18','Filmtár','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('21','19','Filmtár','2');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('22','20','Filmtár','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('23','21','Filmtár','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('24','22','Filmtár','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('25','23','Filmtár','2');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('27','21','Vegyesbolt','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('28','1','Vegyesbolt','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('29','5','Vegyesbolt','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('30','17','Vegyesbolt','3');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('31','10','Vegyesbolt','2');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('32','15','Vegyesbolt','1');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('33','12','Vegyesbolt','5');
Insert into SYSTEM.BOLT (BOLT_ID,TERMEK_ID,NEV,DARABSZAM) values ('35','24','Vegyesbolt','1');
--------------------------------------------------------
--  DDL for Index TERMEK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TERMEK_PK" ON "SYSTEM"."TERMEK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TERMEK_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TERMEK_UK1" ON "SYSTEM"."TERMEK" ("CIM", "KIADAS_EVE", "AR") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index KONYV_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."KONYV_PK" ON "SYSTEM"."KONYV" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index KONYV_SZERZO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."KONYV_SZERZO_PK" ON "SYSTEM"."KONYV_SZERZO" ("KONVY_TERMEK_ID", "SZERZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FILM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."FILM_PK" ON "SYSTEM"."FILM" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index E_BOOK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."E_BOOK_PK" ON "SYSTEM"."E_BOOK" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index E_BOOK_SZERZO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."E_BOOK_SZERZO_PK" ON "SYSTEM"."E_BOOK_SZERZO" ("E_BOOK_TERMEK_ID", "SZERZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index ZENE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."ZENE_PK" ON "SYSTEM"."ZENE" ("TERMEK_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LAKCIM_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LAKCIM_UK1" ON "SYSTEM"."LAKCIM" ("IRSZAM", "HAZSZAM", "VAROS", "UTCA") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
  ALTER INDEX "SYSTEM"."LAKCIM_UK1"  UNUSABLE;
--------------------------------------------------------
--  DDL for Index FELHASZNALO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."FELHASZNALO_PK" ON "SYSTEM"."FELHASZNALO" ("FELHASZNALO_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index FELHASZNALO_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."FELHASZNALO_UK1" ON "SYSTEM"."FELHASZNALO" ("NEV", "TIPUS", "JELSZO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MUFAJ_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."MUFAJ_PK" ON "SYSTEM"."MUFAJ" ("TERMEK_ID", "MUFAJ") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index VASARLAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."VASARLAS_PK" ON "SYSTEM"."VASARLAS" ("TERMEK_ID", "FELHASZNALO_ID", "LAKCIM_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOLT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."BOLT_PK" ON "SYSTEM"."BOLT" ("BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOLT_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."BOLT_UK1" ON "SYSTEM"."BOLT" ("TERMEK_ID", "NEV") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index LAKCÍM_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."LAKCÍM_PK" ON "SYSTEM"."LAKCIM" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."TABLE1_PK" ON "SYSTEM"."KESZLET" ("TERMEK_ID", "BOLT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Trigger TERMEK_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."TERMEK_ID_TRG" 
BEFORE INSERT ON TERMEK 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT TERMEK_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SYSTEM"."TERMEK_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger LAKCIM_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."LAKCIM_ID_TRG" 
BEFORE INSERT ON LAKCIM 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.ID IS NULL THEN
      SELECT LAKCIM_SEQ.NEXTVAL INTO :NEW.ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SYSTEM"."LAKCIM_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger FELHASZNALO_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."FELHASZNALO_ID_TRG" 
BEFORE INSERT ON FELHASZNALO 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.FELHASZNALO_ID IS NULL THEN
      SELECT FELHASZNALO_SEQ.NEXTVAL INTO :NEW.FELHASZNALO_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SYSTEM"."FELHASZNALO_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BOLT_ELFOGYOTT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."BOLT_ELFOGYOTT" 
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
ALTER TRIGGER "SYSTEM"."BOLT_ELFOGYOTT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger BOLT_ID_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "SYSTEM"."BOLT_ID_TRG" 
BEFORE INSERT ON BOLT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.BOLT_ID IS NULL THEN
      SELECT BOLT_SEQ.NEXTVAL INTO :NEW.BOLT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "SYSTEM"."BOLT_ID_TRG" ENABLE;
--------------------------------------------------------
--  DDL for Procedure ORA$_SYS_REP_AUTH
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SYSTEM"."ORA$_SYS_REP_AUTH" as
begin
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repschema TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.repcat$_repprop TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_aqcall TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_calldest TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_error TO SYS ' ||
                 'WITH GRANT OPTION';
  EXECUTE IMMEDIATE 'GRANT SELECT ON SYSTEM.def$_destination TO SYS ' ||
                 'WITH GRANT OPTION';
end;

/
--------------------------------------------------------
--  DDL for Package Body DBMS_REPCAT_AUTH
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
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

  CREATE OR REPLACE PACKAGE "SYSTEM"."DBMS_REPCAT_AUTH" wrapped
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
--  DDL for Synonymn CATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."CATALOG" FOR "SYS"."CATALOG";
--------------------------------------------------------
--  DDL for Synonymn COL
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."COL" FOR "SYS"."COL";
--------------------------------------------------------
--  DDL for Synonymn PRODUCT_USER_PROFILE
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PRODUCT_USER_PROFILE" FOR "SYSTEM"."SQLPLUS_PRODUCT_PROFILE";
--------------------------------------------------------
--  DDL for Synonymn PUBLICSYN
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."PUBLICSYN" FOR "SYS"."PUBLICSYN";
--------------------------------------------------------
--  DDL for Synonymn SYSCATALOG
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSCATALOG" FOR "SYS"."SYSCATALOG";
--------------------------------------------------------
--  DDL for Synonymn SYSFILES
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."SYSFILES" FOR "SYS"."SYSFILES";
--------------------------------------------------------
--  DDL for Synonymn TAB
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TAB" FOR "SYS"."TAB";
--------------------------------------------------------
--  DDL for Synonymn TABQUOTAS
--------------------------------------------------------

  CREATE OR REPLACE SYNONYM "SYSTEM"."TABQUOTAS" FOR "SYS"."TABQUOTAS";
--------------------------------------------------------
--  DDL for Queue DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQERROR',
     Queue_table         => 'SYSTEM.DEF$_AQERROR',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Error Queue for Deferred RPCs');
  END;
/
--------------------------------------------------------
--  DDL for Queue DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE(
     Queue_name          => 'SYSTEM.DEF$_AQCALL',
     Queue_table         => 'SYSTEM.DEF$_AQCALL',
     Queue_type          =>  0,
     Max_retries         =>  5,
     Retry_delay         =>  0,
     dependency_tracking =>  TRUE,
     comment             => 'Deferred RPC Queue');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQCALL
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQCALL"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  DDL for Queue Table DEF$_AQERROR
--------------------------------------------------------

   BEGIN DBMS_AQADM.CREATE_QUEUE_TABLE(
     Queue_table        => '"SYSTEM"."DEF$_AQERROR"',
     Queue_payload_type => 'VARIANT',
     storage_clause     => 'PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 TABLESPACE SYSTEM',
     Sort_list          => 'ENQ_TIME',
     Compatible         => '8.0.3');
  END;
/
--------------------------------------------------------
--  Constraints for Table TERMEK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."TERMEK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMEK" MODIFY ("CIM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMEK" MODIFY ("KIADAS_EVE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMEK" MODIFY ("AR" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."TERMEK" ADD CONSTRAINT "TERMEK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."TERMEK" ADD CONSTRAINT "TERMEK_UK1" UNIQUE ("CIM", "KIADAS_EVE", "AR")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KONYV" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KONYV" ADD CONSTRAINT "KONYV_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KONYV_SZERZO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KONYV_SZERZO" ADD CONSTRAINT "KONYV_SZERZO_PK" PRIMARY KEY ("KONVY_TERMEK_ID", "SZERZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."KONYV_SZERZO" MODIFY ("KONVY_TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."KONYV_SZERZO" MODIFY ("SZERZO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FILM" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FILM" MODIFY ("RENDEZO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FILM" ADD CONSTRAINT "FILM_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table E_BOOK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."E_BOOK" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."E_BOOK" ADD CONSTRAINT "E_BOOK_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table E_BOOK_SZERZO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."E_BOOK_SZERZO" MODIFY ("E_BOOK_TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."E_BOOK_SZERZO" MODIFY ("SZERZO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."E_BOOK_SZERZO" ADD CONSTRAINT "E_BOOK_SZERZO_PK" PRIMARY KEY ("E_BOOK_TERMEK_ID", "SZERZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table ZENE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZENE" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZENE" MODIFY ("EGYUTTES_NEVE" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."ZENE" ADD CONSTRAINT "ZENE_PK" PRIMARY KEY ("TERMEK_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table LAKCIM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."LAKCIM" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LAKCIM" MODIFY ("IRSZAM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LAKCIM" MODIFY ("HAZSZAM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LAKCIM" MODIFY ("VAROS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LAKCIM" MODIFY ("UTCA" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."LAKCIM" ADD CONSTRAINT "LAKCÍM_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."LAKCIM" ADD CONSTRAINT "LAKCIM_UK1" UNIQUE ("IRSZAM", "HAZSZAM", "VAROS", "UTCA")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE( INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
  ALTER INDEX "SYSTEM"."LAKCIM_UK1"  UNUSABLE; ENABLE;
--------------------------------------------------------
--  Constraints for Table FELHASZNALO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FELHASZNALO" MODIFY ("FELHASZNALO_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_CHK1" CHECK (TORZSVASARLO = 0 OR TORZSVASARLO = 1) ENABLE;
  ALTER TABLE "SYSTEM"."FELHASZNALO" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FELHASZNALO" MODIFY ("TIPUS" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FELHASZNALO" MODIFY ("JELSZO" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_PK" PRIMARY KEY ("FELHASZNALO_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."FELHASZNALO" ADD CONSTRAINT "FELHASZNALO_UK1" UNIQUE ("NEV", "TIPUS", "JELSZO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MUFAJ
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MUFAJ" MODIFY ("MUFAJ" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."MUFAJ" ADD CONSTRAINT "MUFAJ_PK" PRIMARY KEY ("TERMEK_ID", "MUFAJ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table VASARLAS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VASARLAS" MODIFY ("TERMEK_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VASARLAS" MODIFY ("FELHASZNALO_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VASARLAS" MODIFY ("LAKCIM_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VASARLAS" MODIFY ("DATUM" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."VASARLAS" ADD CONSTRAINT "VASARLAS_PK" PRIMARY KEY ("TERMEK_ID", "FELHASZNALO_ID", "LAKCIM_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table KESZLET
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KESZLET" ADD CONSTRAINT "TABLE1_PK" PRIMARY KEY ("TERMEK_ID", "BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOLT" MODIFY ("NEV" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."BOLT" ADD CONSTRAINT "BOLT_CHK1" CHECK (DARABSZAM >= 0) ENABLE;
  ALTER TABLE "SYSTEM"."BOLT" ADD CONSTRAINT "BOLT_PK" PRIMARY KEY ("BOLT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "SYSTEM"."BOLT" ADD CONSTRAINT "BOLT_UK1" UNIQUE ("TERMEK_ID", "NEV")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KONYV" ADD CONSTRAINT "TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KONYV_SZERZO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KONYV_SZERZO" ADD CONSTRAINT "KONYV_TERMEK_ID_FK" FOREIGN KEY ("KONVY_TERMEK_ID")
	  REFERENCES "SYSTEM"."KONYV" ("TERMEK_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FILM
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FILM" ADD CONSTRAINT "F_TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table E_BOOK
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."E_BOOK" ADD CONSTRAINT "E_TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table E_BOOK_SZERZO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."E_BOOK_SZERZO" ADD CONSTRAINT "E_BOOK_TERMEK_ID_FK" FOREIGN KEY ("E_BOOK_TERMEK_ID")
	  REFERENCES "SYSTEM"."E_BOOK" ("TERMEK_ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ZENE
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."ZENE" ADD CONSTRAINT "Z_TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FELHASZNALO
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."FELHASZNALO" ADD CONSTRAINT "LAKCIM_ID_FK" FOREIGN KEY ("LAKCIM_ID")
	  REFERENCES "SYSTEM"."LAKCIM" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MUFAJ
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."MUFAJ" ADD CONSTRAINT "M_TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table VASARLAS
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."VASARLAS" ADD CONSTRAINT "V_FELHASZNALO_ID_FK" FOREIGN KEY ("FELHASZNALO_ID")
	  REFERENCES "SYSTEM"."FELHASZNALO" ("FELHASZNALO_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."VASARLAS" ADD CONSTRAINT "V_LAKCIM_ID_FK" FOREIGN KEY ("LAKCIM_ID")
	  REFERENCES "SYSTEM"."LAKCIM" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."VASARLAS" ADD CONSTRAINT "V_TERMEK_ID_FK" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table KESZLET
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."KESZLET" ADD CONSTRAINT "TABLE1_FK1" FOREIGN KEY ("BOLT_ID")
	  REFERENCES "SYSTEM"."BOLT" ("BOLT_ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "SYSTEM"."KESZLET" ADD CONSTRAINT "TABLE1_FK2" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOLT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."BOLT" ADD CONSTRAINT "BOLT_FK1" FOREIGN KEY ("TERMEK_ID")
	  REFERENCES "SYSTEM"."TERMEK" ("ID") ON DELETE CASCADE ENABLE;
