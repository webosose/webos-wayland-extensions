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

find_program(WAYLAND_SCANNER NAMES wayland-scanner)

function(WAYLAND_SERVER_PROTOCOL proto toSource baseName)
    get_filename_component(in ${proto} ABSOLUTE)
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include)

    set(serverHeader "${CMAKE_CURRENT_BINARY_DIR}/include/wayland-${baseName}-server-protocol.h")
    set(code "${CMAKE_CURRENT_BINARY_DIR}/wayland-${baseName}-protocol.c")

    add_custom_command(OUTPUT "${serverHeader}"
        COMMAND ${WAYLAND_SCANNER} server-header < ${in} > ${serverHeader}
        DEPENDS ${in} VERBATIM)

    add_custom_command(OUTPUT "${code}"
        COMMAND ${WAYLAND_SCANNER} code < ${in} > ${code}
        DEPENDS ${in} VERBATIM)

    list(APPEND ${toSource} "${serverHeader}" "${code}")
    set(${toSource} ${${toSource}} PARENT_SCOPE)
endfunction()


function(WAYLAND_CLIENT_PROTOCOL proto toSources baseName)
    get_filename_component(in ${proto} ABSOLUTE)
    file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/include)

    set(clientHeader "${CMAKE_CURRENT_BINARY_DIR}/include/wayland-${baseName}-client-protocol.h")
    set(code "${CMAKE_CURRENT_BINARY_DIR}/wayland-${baseName}-protocol.c")

    add_custom_command(OUTPUT "${clientHeader}"
        COMMAND ${WAYLAND_SCANNER} client-header < ${in} > ${clientHeader}
        DEPENDS ${in} VERBATIM)

    add_custom_command(OUTPUT "${code}"
        COMMAND ${WAYLAND_SCANNER} code < ${in} > ${code}
        DEPENDS ${in} VERBATIM)

    list(APPEND ${toSources} "${clientHeader}" "${code}")
    set(${toSources} ${${toSources}} PARENT_SCOPE)

endfunction()
