#!/usr/bin/env python3
""" a function that changes all topics of a school..."""


def update_topics(mongo_collection, name, topics):
    """document based on the name."""
    mongo_collection.update_many(
        {'name': name},
        {'$set': {'topics': topics}}
    )
