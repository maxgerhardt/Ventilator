cmake_minimum_required(VERSION 3.7.0 FATAL_ERROR)
project(ventilator_gui
    LANGUAGES CXX C
    VERSION 0.0.1
    )

set(EXTRA_MODULES_DIR ${CMAKE_CURRENT_LIST_DIR}/cmake)
list(APPEND CMAKE_MODULE_PATH ${EXTRA_MODULES_DIR})
list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})

#=============================================================================
# ensure build type first
#=============================================================================

include(EnsureBuildType)

#=============================================================================
# Conan
#=============================================================================

if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
  file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.16.1/conan.cmake"
    "${CMAKE_BINARY_DIR}/conan.cmake"
    EXPECTED_HASH SHA256=396e16d0f5eabdc6a14afddbcfff62a54a7ee75c6da23f32f7a31bc85db23484
    TLS_VERIFY ON)
endif()

set(CONAN_PROFILE "default" CACHE STRING "Name of conan profile to use, uses default by default")
set(CONAN "AUTO" CACHE STRING "conan options AUTO (conan must be in path), MANUAL (expects conanbuildinfo.cmake in build directory) or DISABLE")
if(${CONAN} MATCHES "AUTO")
  include(${CMAKE_BINARY_DIR}/conan.cmake)
  conan_cmake_run(CONANFILE conanfile.txt
      PROFILE ${CONAN_PROFILE}
      BASIC_SETUP NO_OUTPUT_DIRS KEEP_RPATHS
      BUILD_TYPE "None"
      BUILD outdated)
elseif(${CONAN} MATCHES "MANUAL")
  if(EXISTS "${CMAKE_BINARY_DIR}/conanbuildinfo.cmake")
    include("${CMAKE_BINARY_DIR}/conanbuildinfo.cmake")
    conan_basic_setup(NO_OUTPUT_DIRS KEEP_RPATHS)
  else()
    message(FATAL_ERROR "CONAN set to MANUAL but no file named conanbuildinfo.cmake found in build directory")
  endif()
elseif(NOT ${CONAN} MATCHES "DISABLE")
  message(FATAL_ERROR "Unrecognised option for CONAN (${CONAN}), use AUTO, MANUAL or DISABLE")
endif()

include(CompilerConfig)
include(OutputDirConfig)
include(CoverageReports)
include(QtMacFix)

#include(InstallConfig)

#include(BuildInfo)
execute_process(COMMAND "git" "rev-parse" "HEAD"
  WORKING_DIRECTORY "${CMAKE_SOURCE_DIR}"
  OUTPUT_VARIABLE GIT_SHA1
  OUTPUT_STRIP_TRAILING_WHITESPACE)
add_definitions(-DGIT_VERSION="${GIT_SHA1}")

add_subdirectory(src)
add_subdirectory(app)

enable_testing()
add_subdirectory(tests)

add_custom_target(everything DEPENDS
  all_tests
  ventilator_gui_app
  )
