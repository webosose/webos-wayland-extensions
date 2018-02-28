# Copyright (c) 2013-2018 LG Electronics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

cmake_minimum_required(VERSION 2.8.7)

project(wayland-webos)

set (SURFACEMANAGER_EXTENSIONS_VERSION_MAJOR 1)
set (SURFACEMANAGER_EXTENSIONS_VERSION_MINOR 0)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

include(webOS/webOS)
include(FindPkgConfig)
include(wayland)

webos_modules_init(1 0 0 QUALIFIER RC4)
webos_component(${SURFACEMANAGER_EXTENSIONS_VERSION_MAJOR} ${SURFACEMANAGER_EXTENSIONS_VERSION_MINOR} 0)

add_subdirectory(server)
add_subdirectory(client)
add_subdirectory(protocol)
