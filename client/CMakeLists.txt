# Copyright (c) 2013-2019 LG Electronics, Inc.
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

pkg_check_modules(WAYLAND_CLIENT REQUIRED wayland-client)
include_directories(${WAYLAND_CLIENT_INCLUDE_DIRS})
webos_add_compiler_flags(ALL ${WAYLAND_CLIENT_CFLAGS_OTHER})

wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-shell.xml SOURCES webos-shell)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-surface-group.xml SOURCES webos-surface-group)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/text.xml SOURCES text)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/input-method.xml SOURCES input-method)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-input-manager.xml SOURCES webos-input-manager)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-extension.xml SOURCES webos-extension)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-foreign.xml SOURCES webos-foreign)
wayland_client_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-tablet.xml SOURCES webos-tablet)

webos_add_linker_options(ALL --no-undefined)

link_directories(${WAYLAND_CLIENT_LIBRARY_DIRS})
add_library(${CMAKE_PROJECT_NAME}-client SHARED ${SOURCES})
target_link_libraries(${CMAKE_PROJECT_NAME}-client ${WAYLAND_CLIENT_LIBRARIES})

webos_build_pkgconfig(${CMAKE_CURRENT_SOURCE_DIR}/files/pkgconfig/${CMAKE_PROJECT_NAME}-client)
webos_build_library(NAME ${CMAKE_PROJECT_NAME}-client HEADERS ${CMAKE_CURRENT_BINARY_DIR}/include)
