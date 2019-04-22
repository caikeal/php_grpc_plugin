# 使用方法
+ 将proto文件夹挂载到/import, 将输出的GPBMetadata挂载到/output
`docker run --rm -v /grpc/examples/protos:/import -v /grpc/examples/php:/output caikeal/php_grpc_plugin`