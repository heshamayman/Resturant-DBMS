--------------------------------------------------------
--  File created - Thursday-December-23-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "CUSTOMERS" 
   (	"CUSTOMER_ID" NUMBER(4,0), 
	"FIRST_NAME" VARCHAR2(15), 
	"LAST_NAME" VARCHAR2(15), 
	"PHONE_NUMBER" NUMBER(11,0), 
	"FEED_BACK" VARCHAR2(4), 
	"CITY" VARCHAR2(15), 
	"STREET" VARCHAR2(10), 
	"BUILDING_NUMBER" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(15), 
	"MANAGER_ID" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(3,0), 
	"FIRST_NAME" VARCHAR2(15), 
	"LAST_NAME" VARCHAR2(15), 
	"SSN" NUMBER(16,0), 
	"SEX" VARCHAR2(6), 
	"SALARY" NUMBER(5,0), 
	"PHONE_NUMBER" NUMBER(11,0), 
	"CITY" VARCHAR2(15), 
	"STREET" VARCHAR2(10), 
	"BUILDING_NUMBER" NUMBER(4,0), 
	"SUPERVISOR_ID" NUMBER(4,0), 
	"DEPARTMENT_ID" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table MEALS
--------------------------------------------------------

  CREATE TABLE "MEALS" 
   (	"MEAL_ID" NUMBER(3,0), 
	"MEAL_NAME" VARCHAR2(10), 
	"MEAL_TYPE" VARCHAR2(10), 
	"MEAL_PRICE" NUMBER(3,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "ORDERS" 
   (	"ORDER_ID" NUMBER(8,0), 
	"ORDER_DATE" DATE, 
	"EMPLOYEE_ID" NUMBER(3,0), 
	"CUSTOMER_ID" NUMBER(4,0)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_MEALS
--------------------------------------------------------

  CREATE TABLE "ORDER_MEALS" 
   (	"QUANTITY" NUMBER(3,0), 
	"ORDER_ID" NUMBER(8,0), 
	"MEAL_ID" NUMBER(3,0)
   ) ;

---------------------------------------------------
--   DATA FOR TABLE CUSTOMERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CUSTOMERS

---------------------------------------------------
--   END DATA FOR TABLE CUSTOMERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE DEPARTMENTS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into DEPARTMENTS

---------------------------------------------------
--   END DATA FOR TABLE DEPARTMENTS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE EMPLOYEES
--   FILTER = none used
---------------------------------------------------
REM INSERTING into EMPLOYEES

---------------------------------------------------
--   END DATA FOR TABLE EMPLOYEES
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE MEALS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into MEALS

---------------------------------------------------
--   END DATA FOR TABLE MEALS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ORDERS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ORDERS

---------------------------------------------------
--   END DATA FOR TABLE ORDERS
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE ORDER_MEALS
--   FILTER = none used
---------------------------------------------------
REM INSERTING into ORDER_MEALS

---------------------------------------------------
--   END DATA FOR TABLE ORDER_MEALS
---------------------------------------------------

--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" MODIFY ("DEPARTMENT_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "DEPARTMENTS" ADD PRIMARY KEY ("DEPARTMENT_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_MEALS
--------------------------------------------------------

  ALTER TABLE "ORDER_MEALS" ADD CONSTRAINT "COMP_ORDER_MEALS_PK" PRIMARY KEY ("ORDER_ID", "MEAL_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD PRIMARY KEY ("ORDER_ID") ENABLE;
--------------------------------------------------------
--  Constraints for Table MEALS
--------------------------------------------------------

  ALTER TABLE "MEALS" MODIFY ("MEAL_TYPE" NOT NULL ENABLE);
 
  ALTER TABLE "MEALS" MODIFY ("MEAL_PRICE" NOT NULL ENABLE);
 
  ALTER TABLE "MEALS" ADD PRIMARY KEY ("MEAL_ID") ENABLE;
 
  ALTER TABLE "MEALS" ADD UNIQUE ("MEAL_NAME") ENABLE;
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" MODIFY ("FIRST_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("LAST_NAME" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("SSN" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("SALARY" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "EMPLOYEES" ADD PRIMARY KEY ("EMPLOYEE_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD UNIQUE ("SSN") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD UNIQUE ("PHONE_NUMBER") ENABLE;
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "CUSTOMERS" MODIFY ("PHONE_NUMBER" NOT NULL ENABLE);
 
  ALTER TABLE "CUSTOMERS" ADD PRIMARY KEY ("CUSTOMER_ID") ENABLE;
 
  ALTER TABLE "CUSTOMERS" ADD UNIQUE ("PHONE_NUMBER") ENABLE;
--------------------------------------------------------
--  DDL for Index COMP_ORDER_MEALS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "COMP_ORDER_MEALS_PK" ON "ORDER_MEALS" ("ORDER_ID", "MEAL_ID") 
  ;

--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "MANAGER_ID_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "DEPARTMENT_ID_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ENABLE;
 
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "SUPERVISOR_ID_FK" FOREIGN KEY ("SUPERVISOR_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "ORDERS" ADD CONSTRAINT "CUSTOMER_ID_FK_ORDERS" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "CUSTOMERS" ("CUSTOMER_ID") ENABLE;
 
  ALTER TABLE "ORDERS" ADD CONSTRAINT "EMPLOYEE_ID_FK_ORDERS" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_MEALS
--------------------------------------------------------

  ALTER TABLE "ORDER_MEALS" ADD CONSTRAINT "MEAL_ID_FK" FOREIGN KEY ("MEAL_ID")
	  REFERENCES "MEALS" ("MEAL_ID") ENABLE;
 
  ALTER TABLE "ORDER_MEALS" ADD CONSTRAINT "ORDER_ID_FK" FOREIGN KEY ("ORDER_ID")
	  REFERENCES "ORDERS" ("ORDER_ID") ENABLE;
