#!/bin/bash
# Copyright 2017 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

fileName=''
for file in `find "/import" -name *.proto`; do
    fileName="${fileName} ${file}"
done

protoc --proto_path=/import \
--php_out=/output \
--grpc_out=/output \
--plugin=protoc-gen-grpc=/usr/local/bin/grpc_php_plugin $fileName