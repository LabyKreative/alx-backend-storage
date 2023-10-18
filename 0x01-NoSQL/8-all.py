#!/usr/bin/env python3
"""a function that lists all documents in a collection:"""


def list_all(mongo_collection):
    # Return an empty list if no document in the collection
    if mongo_collection.count_documents({}) == 0:
        return []
    # Create an empty list to store the documents
    docs = []
    for doc in mongo_collection.find():
        docs.append(doc)
    # Return the list of documents
    return docs
