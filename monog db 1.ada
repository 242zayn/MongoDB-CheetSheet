=-How to connect to Mongodb:-
***************************
1. open cmd 
2. mongod : server 
3. intial start : error cannot write data into default path : c:/data/db/
4. goto c: mkdir data cd data mkdir db

How to Run mongoclient:-
*************************
1. make sure your mongod server is running.
2. open another instance of cmd.
3. type mongo
mongo shell>
>

Important setting about mongo
********************************
By default port : 27017
dbPath : C:/data/db/
architecture : 64-bit
host : DESKTOP-N1OGJKU <your-pcname>

How to create a new database :-
*******************************
1. use command : database created then select or if not it will creat it.
2. how to get current db : db command
3. by default db : test

Note :: during is `use ` command , memory => temporty memory => currentSxope of DB object .
NOTE :: WHAT IS DATABSE WHICH IS PRESENT BUT NOT SHOW IN LIST;
ans :: `ans` database 
why mongodb does like this ?

1. it is a database system , hence it is more resposiblity of the mongodb that it do waste any memory. 
any database without any collection is not witten it will not save them in secondry memory. 
By default Object or Internal db of mongodb
*******************************************
1. show databases

	1. admin 0.000GB Round Figure GB.
	2. config 0.000GB
	3. local 0.000GB
	4. test 0.000GB

Note :: Since the database size variation in GB, we will never be able to know any major changes in database size.

How to see list of collections in Current Database :-
****************************************************
1. use <db-name>
2. show collections
	collection-1
	collection-2
	collection-3
	...
	collection-n
or
3. db.getCollectionNames()
	["collection-1","collection-2","collection-3","collection-n"]

show collections : Query or statement
db.getCollectionNames() : Procedure

Mongo support two types of statements:-
****************************************
1. Query Statements : lower case without semicolon
2. Procedure Statements : functions calls : camelCase without semicolon.

How to see the list of records in a collection : (select * from <table-name>)
*****************************************************************************
db.<db-collection-name>.find() : using this we can find the all records stored in a collection.

How to create a new collection : (create table)
***********************************************
db.createCollection("<collection-name>")

How to insert a document-object or a Object 
*******************************************
Note :: here, one object is equivalent to row, or Record

Types of Insert
****************
1. Single Insert : Insert as Object {}
2. Bulk Insert : Insert as Array of Object [{},{},{},{}...]

db.<collection-name>.insert()
How to find the All Inserted Records:-
*************************************
db.emp.find()
{ "_id" : ObjectId("61d863df9cc262aad0e158dd"), "emp_id" : 1001, "emp_name" : "ravi", "class" : "12th" }

How mongodb is different from other database in terms of automicity
**************************************************************************
Note:- ObjectId mongodb it is universally unique, because of unix timestamp

Unix Timestamp : is total milliseconds invested, day by day from Jan 01 1970 12:00:00 Am at UTC. (Universal timestamp/timezone conversion), as per greenwhich 
avg time at London. +5:30 


System 32 Bit : 12 hexadecimal Object Id.
System 64 Bit : 24 hexadecimal Object Id.

Server ---> 32 Bit ---> Mysql --> Pk --> integer 11
Server ---> 64 Bit ---> Mysql --> PK --> Integer 11
Server ---> 64 Bit ---> Mysql --> PK --> BigInt 20

"_id" : Primary Key : ObjectID

Object Id : System Architecture and its minimum Architecture 32 Bit
64 Bit ---> 24 Bit
32 bit ---> 12 Bit

Min Architecture --> 32Bit --> 12Bit
Unitary Method : 1 Bit ObjectId ---------------> 12/32 => Ratio => 3/8 Bit
Ratio Architecuture to ObjectId -> 3:8 Bit.

Questions:- if sever specification is as followed
DD4-3X
T1B SSD 100MBS RD/wr speed
16 GB Ram
Architeture 16 Bit
OS : Unix/centos
Processor : 5.5Ghz to 5.89Ghz octa-8z i-core

What is the length of object id?
ans: 6

ObjectId breakup (12 bit/bytes)
***********************************
4 Bytes : timestamp : hexadecimal Format 01.01.1970 12.00 am to 21-11-2022  08:30:10 AM +5:30 in second timestamp (4x8x2 Bit)
3 Bytes : Mac-address Id (Machine Access code)l99+
2 Byte : process_id (pid)
3 Byte : Random Numbers 

61d863df9cc262aad0e158dd => some sort Hashing Algorithms.
In Application, we can store this "_id" store in session for updating and deleting the data.

update student_Table where stdid = '1001';
db.collection.update({_id:"61d863df9cc262aad0e158dd"})
 
How to see data after bulk insert : db.emp.find()
*************************************************

> db.emp.find() : by default this is projection 
> db.emp.find().pretty() : by
> db.emp.find().projection() or db.emp.find() in version < 6.x

otherwise in difference, projection(),pretty(),find() in version > 6.x

In SQL, there are two important Concept
*************************************************1. projection : select* from tablename (Query wihtout where clause or any condition).
2. selection : selection with condition like where clause, limit, group by.

>db.collection.find()
>db.collection.find().projection()
Data show in Horizontal  projection



{ "_id" : ObjectId("61d863df9cc262aad0e158dd"), "emp_id" : 1001, "emp_name" : "ravi", "class" : "12th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158de"), "emp_id" : 1002, "emp_name" : "shyam", "class" : "11th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158df"), "emp_id" : 1003, "emp_name" : "dubey", "class" : "10th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e0"), "emp_id" : 1004, "emp_name" : "shyam-2", "class" :"11th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e1"), "emp_id" : 1007, "emp_name" : "shyam-3", "class" :"9th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e2"), "emp_id" : 1008, "emp_name" : "shyam-4", "class" :"10th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e3"), "emp_id" : 1009, "emp_name" : "shyam-5", "class" :"11th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e4"), "emp_id" : 1005, "emp_name" : "shyam-6", "class" :"12th" }
{ "_id" : ObjectId("61d867cc9cc262aad0e158e5"), "emp_id" : 1006, "emp_name" : "shyam-7", "class" :"10th" }

>db.collection.find().pretty()
data will be show in, vertical format.
db.version() <=6.x
   
document-1 or object-1
{ "_id" : ObjectId("61d863df9cc262aad0e158dd"),
"emp_id" : 1001,
"emp_name" : "ravi"
"class" : "12th"
},

document-2 or object-2
{ "_id" : ObjectId("61d867cc9cc262aad0e158de"),
"emp_id" : 1002,
"emp_name" : "shyam",
"class" : "11th"
}
]

Note ::
1. select* from tableanme where columnname = 'value';
2. db.collection.find({key:"value"});

What are keyword in mongodb:-
****************************************
in mongodb, we have keyword like sql syntax(clauses)
they start with $keyword
Eg:-
And OR => SQL
$and and $or
in => SQL
$in from => SQL
$from
Note:: this is not valid, in case of operators.
 != => SQL != not EqualTo
$ne
Note:: trick : stdid=value
               stdid:value => qual to
               operator => $keyword => as a key...



How to fetch records on the basis of some conditions or predicates
******************************************************************
syntax:
db.<collection-name>.find({key:value})
SQL : select * from collection-name where key='value';
keyword in Mongo : $keyword

db.collection.find({Keyname :{$keyword:value}})  : int
db.collection.find({Keyname :{$keyword:"value"}})  : string


!= :$ne
>= :$gte
<= :$lte
< : $lt
> : $gt

syntax :
db.<collection-name>.find({key:{$keyword:value}})
SQL : select * from collection-name where key!='value';

what is difference B/W
db.collection.find()
And
db.collection.find({})
db.collection.find() =db.collection.find({})


Q1-  given, there is table emp,


   given, emp(#empid,empname,empsal)
      |
   properties
  1. unique, 2.empname 3.empsal
************************************
  empid|  empname  | empsal
**********************************
  spi-201| ravi |100
  spi-301| anuj |200
  spi-401| ram  |300  

2- Table how many primary key.
    1pk+other Unique
3- what is composite key.
    pk+Ak(alternet key)
4- what will be query to query to in mongodb
   for showing only empid
   empid => objectId 
  ans:- select empid from emp;
  db.emp.find({},{_id:1});
  or
  db.emp.find({},{empname:0,empsal:0});

Note::- _id or objectId is by default enabled in mongodb

 

How to fetch records perticular columns 
****************************************
syntax: in order use collection name 
db.<collection-name>.find({conditions},{<column-names>:<0 or 1>})

0 : hide
1 : show

Mongodb ---> switch ---> All Columns are shown
			emp_id : 1
			emp_name : 1
			class :1

			emp_id : 0
			emp_name : 0
			class :0
			
Example:-
> db.student.find({},{name:1,_id:1})
{ "_id" : ObjectId("61ee2d1342556a6a994e343a"), "name" : "ravi" }
{ "_id" : ObjectId("61ee3d3442556a6a994e343b"), "name" : "sandeep" }
{ "_id" : ObjectId("61ee3d3442556a6a994e343c"), "name" : "kuldeep" }
{ "_id" : ObjectId("61ee3d3442556a6a994e343d"), "name" : "pawandeep" }
{ "_id" : ObjectId("61ee3d3442556a6a994e343e"), "name" : "Ratandeep" }


Using And and Or Conditions in Mongodb:-
****************************************
$keyword : $and , $or
Eg:-
db.collection.find()
SQL : Select * from collection

Eg:-
db.employee.find({condition},{selection in columns})
db.collection.find({$and:})
SQL  : select * from collecton where condition = 'something' and condition = 'something';
	{$and:[{condition-key:'something'},{condition-key:'something'}]}
	
> db.student.find({$and:{name:"ravi",marks:50}})
Error: error: {
        "ok" : 0,
        "errmsg" : "$and must be an array",
        "code" : 2,
        "codeName" : "BadValue"
}
> db.student.find({$and:[{name:"ravi",marks:50}]})
{ "_id" : ObjectId("61ee2d1342556a6a994e343a"), "roll" : 1001, "name" : "ravi", "marks" : 50 }

> db.student.find({$and:[{name:"ravi",marks:50}]},{roll:1,name:1})
{ "_id" : ObjectId("61ee2d1342556a6a994e343a"), "roll" : 1001, "name" : "ravi" }


Example of How to combine Multiple Condition with Mongo-db using or
********************************************************************
> db.student.find( {$or:[{roll:1002},{marks:{$gt:50}}]}).pretty()


How to update the record in, mongodb:-
************************************

in mongodb update work on following manner => no of matching records,
if no of matching records equal = 1, update will work
if no of matching is more than one only the top most record will be updated
so inorder to, update multi-record we need specify the multi as true

syntax:
SQL : update table-name set column=value,column=value,column=value,column=value where
$condition = ...

db.collection.find({conditon},{configuration})
or 
we use $set:[{key:value},{key:value},{key:value},{key:value}]

db.collection.update({condition},{$set:{key:value,key:value,key:value}},{multi:true|false})


db.emp.update({emp_id:{$gte:1007}},{$set:{emp_name:"awnish"}},{multi:true})

How to delete the record in, mongodb:-
************************************
we use db.collection.remove({condition},{true|false})

Difference B/w update and delete
*********************************
by default delete deletes all the matching record
but if you want to delete only single matching records
we specify true

by default in update it updates only first record but if you
want to update all the matching records then, we specify multi=true

Upsert in Mongo-db :-
*********************
upsert = update + insert
if match => 1 update (found or pre-existing)
if not match => 0 insert (Not found)

Syntax:- 
db.collection.update({condition},{key:value,key:value,key:value},{upsert:true})

limiting the Query:-
********************
limit(n) method : to limit the Query
db.collection.limit(n)
db.emp.find().limit(n)

Skipping the Query :-
********************
when we run the limit Query Top Record to n record data is fetched.
when we run the skip Query Top Record to n will skipped and Remaining data will be Returned as a result.

db.collection.find(); //All Records
db.collection.find().skip(n)

How to clear the screen
***********************
cls

How to order the data in mongodb
********************************
since mongodb stores the data in un-structured format, there is no logical arrangement or sequence.
so in-order to manage that, user is explicitly responsible to handle it.

db.collection.sort({key:aesc|desc})
aesc = 1
desc = -1
db.collection.find().sort({key:1}) 
db.collection.find().sort({key:-1}) 

How to create the indexes in mongodb
************************************
Indexes are used or created over the perticular column or key to extract the data or performing the searching
very fast.
in local db or for less number of records creating index will not effect the performance
but definetly if you have cloud server where internet connection and large amount data like 1-lakh record
at time is the constraint.
in that case you can use the concept of indexes.

How Indexes works:-
*****************
They organise the groups into different blocks of records called as pages internally in db catalogue 
and when ever we want to fetch the records instead of searching it from top to Bottom Line by line
it will direclty jump into that page
Indexes are similar to Book Indexes

Index
*******
Unit 1 ----------------> Page 1 to 5
Unit 2 ----------------> Page 10 to 15
Unit 3 ----------------> Page 20 to 25
Unit 4 ----------------> Page 100 to 105

Older Version of Mongo:-
****************************
db.collection.ensureIndex({column_name:1})

1 :create Index
db.collection.ensureIndex() this is replace by createIndex
db.emp.createIndex({emp_id:1})

Joins and Relationships with Multiple Collection set
****************************************************

In Mongo we use embedded Data Rather Than Joins :- There is Redundant Duplicated data without Normalisation.
department Table

dept_id department
1.  Hr
2. 	Manager
3. 	Faculty

Emp Table
empid	empname	dept_id
1001    Ravi     1
1002    vikas    2
1003    awnish   3

Embedded Data While Inserting we insert entire data as Single Data
Embedded Document Object
{empid:1001,empname:Ravi,dept:{depid:1,department:Hr}}
{empid:1002,empname:vikas,dept:{depid:1,department:Manager}}
{empid:1003,empname:awnish,dept:{depid:1,department:Faculty}}

Pretty Output
*************
In order to Increase,display Padding in vertical we pretty function
db.collection.find().pretty()

Concept of Foriegn Key and Primary Key
***************************************
This is not Recommended way to Organise in multiple Object as a collection.
In RDBMS we have two table and we join them by the means of, Joins
using referencial Integrity B/w PK and FK
If you want store the data it is recommended to store the data in form,
in form of Embedded Data Object

we can use lookup Aggregration. to achieve this.
Syntax:
db.collection1.aggregrate({$lookup:{from:"",localField:"",ForiegnField:"",as:""}})

As soon as you as clause 2nd Collection will become as field in collection1

Trick:-
*******
 
db.createCollection("<collection>")
db.department.insert();
		|
		|if collection does not exist then also it will be created 
		|automatically.
		
db.dept.insert([
{id:1,name:"Hr"},
{id:2,name:"Faculty"},
{id:3,name:"Admin"},
])

db.emp.insert([
{empid:1001,name:"Ravi",deptid:1},
{empid:1002,name:"Mohan",deptid:1},
{empid:1003,name:"Jainab",deptid:2},
{empid:1004,name:"Tahir",deptid:3},
])

one to Many
db.dept.aggregate({$lookup:{from:"emp",localField:"id",foreignField:"deptid",as:"emp"}}).pretty()

one emp to one department
db.emp.aggregate({$lookup:{from:"dept",localField:"deptid",foreignField:"id",as:"department"}}).pretty()
































































