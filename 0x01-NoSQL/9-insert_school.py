#!/usr/bin/env python3
"""a function that ... based on kwargs:"""


def insert_school(mongo_collection, **kwargs):
    """a new document in a collection..."""
    result = mongo_collection.insert_one(kwargs)
    return result.inserted_id
