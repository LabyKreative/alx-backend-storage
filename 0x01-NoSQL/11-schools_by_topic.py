#!/usr/bin/env python3
""" a function that returns the"""


def schools_by_topic(mongo_collection, topic):
    """list of school having a specific topic."""
    topic_filter = {
        'topics': {
            '$elemMatch': {
                '$eq': topic,
            },
        },
    }
    return [doc for doc in mongo_collection.find(topic_filter)]
