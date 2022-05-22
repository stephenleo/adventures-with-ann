# Neural Search
- Given a chunk of text, find all chunks in our database that are similar
- Use Semantic vector search 

# Approaches
## Jina
- Very easy to setup on local but needs K8S to scale. So not pursuing at the moment.

## Milvus
- Very easy to setup on local, EC2 or K8S
- One node has been setup on EC2 and ~2Mil vectors uploaded
    ```
    from pymilvus import connections

    # Connect to Milvus server
    host = 'ec2-18-118-28-76.us-east-2.compute.amazonaws.com'
    connections.connect(alias='default', host=host, port='19530')

    # Collection name
    collection_name = 'chunks'
    ```
- Query latency is $<50ms$!
- One issue is that it cannot store any metadata in the current version. So to map the `id` to the `text`, we need to maintain an external mapping database. The next version of Milvus will have metadata storage capability but we're not waiting for it.

## Opensearch
- Currently exploring vector search on Opensearch.
- Saj has setup the cluster.
- After some struggle with permissions, we've been successful in connecting to it and pushing ~100K chunks now.
- Currently exploring how to enable vector search on this test data.
- Will upload the chunk embeddings from Yuqi once they're ready.

## Endpoint
The endpoint will have a few steps:
1. Take an text chunk as input
1. Hit a Lambda function endpoint which does a few things:
    - Chunk the full text
    - Convert the chunk texts to vectors
    - Search the vectors in the database
    - Summarise the results to only return the top chunk at the article level
    - Return the results back

## Playground
- Setup a notebook to play around with the endpoint