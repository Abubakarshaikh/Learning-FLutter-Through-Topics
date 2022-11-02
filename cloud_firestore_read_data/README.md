[Collections & Documents]
* Firestore stores data within "documents", which are contained within "collections". 

* Documents can also contain nested collections.

* For example, our users would each have their own "document" stored inside the "Users" collection.

* The collection method allows us to reference a collection within our code.

* 



[Read Data]

[Document & Query Snapshots]
 * When performing a query, Firestore returns either a QuerySnapshot or a DocumentSnapshot.


[QuerySnapshot]
 * A QuerySnapshot is returned from a collection query, and allows you to inspect the collection, such as how many documents exist within it.

 * gives access to the documents within the collection, see any changes since the last query and more.

 * To access the documents within a QuerySnapshot, call the docs property, which returns a List containing DocumentSnapshot classes.


 [DocumentSnapshot]

* A DocumentSnapshot is returned from a query, or by accessing the document directly. Even if no document exists in the database, a snapshot will always be returned.

* To determine whether the document exists, use the exists property:

* If the document exists, you can read the data of it by calling the data method, which returns a Map<String, dynamic>, or null if it does not exist:



