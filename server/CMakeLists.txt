# Copyright (c) 2013-2020 LG Electronics, Inc.
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

pkg_check_modules(WAYLAND_SERVER REQUIRED wayland-server)
include_directories(${WAYLAND_SERVER_INCLUDE_DIRS})
webos_add_compiler_flags(ALL ${WAYLAND_SERVER_CFLAGS_OTHER})

wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-shell.xml SOURCES webos-shell)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-surface-group.xml SOURCES webos-surface-group)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/text.xml SOURCES text)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/input-method.xml SOURCES input-method)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-input-manager.xml SOURCES webos-input-manager)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-extension.xml SOURCES webos-extension)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-foreign.xml SOURCES webos-foreign)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-tablet.xml SOURCES webos-tablet)
wayland_server_protocol(${CMAKE_SOURCE_DIR}/protocol/webos-system-ux.xml SOURCES webos-system-ux)

webos_add_linker_options(ALL --no-undefined)

link_directories(${WAYLAND_SERVER_LIBRARY_DIRS})
add_library(${CMAKE_PROJECT_NAME}-server SHARED ${SOURCES})
target_link_libraries(${CMAKE_PROJECT_NAME}-server ${WAYLAND_SERVER_LIBRARIES})

webos_build_pkgconfig(${CMAKE_CURRENT_SOURCE_DIR}/files/pkgconfig/${CMAKE_PROJECT_NAME}-server)
webos_build_library(NAME ${CMAKE_PROJECT_NAME}-server HEADERS ${CMAKE_CURRENT_BINARY_DIR}/include)
