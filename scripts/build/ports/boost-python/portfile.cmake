# Automatically generated by boost-vcpkg-helpers/generate-ports.ps1

include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/python
    REF boost-1.68.0
    SHA512 17aacec09a653b718e1925f13fbce1a22a09d44011534e451a953600f4fef47b0e8a759d4e1588b74dbfc71ef38f1f13200d77668eca2ad1bc5b1e470e231a2f
    HEAD_REF master
    PATCHES unwind-type.patch
)

# Find Python. Can't use find_package here, but we already know where everything is
file(GLOB PYTHON_INCLUDE_PATH "${CURRENT_INSTALLED_DIR}/include/python[0-9.]*")
set(PYTHONLIBS_RELEASE "${CURRENT_INSTALLED_DIR}/lib")
set(PYTHONLIBS_DEBUG "${CURRENT_INSTALLED_DIR}/debug/lib")
string(REGEX REPLACE ".*python([0-9\.]+)$" "\\1" PYTHON_VERSION "${PYTHON_INCLUDE_PATH}")
include(${CURRENT_INSTALLED_DIR}/share/boost-build/boost-modular-build.cmake)
boost_modular_build(SOURCE_PATH ${SOURCE_PATH})
include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})
