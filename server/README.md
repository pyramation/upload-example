# upload-server


Testing w curl

```sh
curl http://localhost:5000/graphql \
    -F operations='{ "query": "mutation MyMutation ($file: Upload!, $body: String!, $header: String!) { __typename createPost( input: { post: { icon: $file, body: $body, header: $header } } ) { post { id header body icon } } }", "variables": {"body": "body here", "header": "header here", "file": null} }' \
    -F map='{ "0": ["variables.file"] }' \
    -F 0=@/Users/dlynch/Pictures/IMG_5563.png
```