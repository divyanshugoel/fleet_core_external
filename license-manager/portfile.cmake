get_filename_component(_bt_dir "${CURRENT_BUILDTREES_DIR}/src" ABSOLUTE)
set(VCPKG_VERBOSE_LOG ON)

file(GLOB LICENSE_MANAGER_PATCHES
    "${CMAKE_CURRENT_LIST_DIR}/patches/*.patch"
)

# vcpkg_from_git(
#   OUT_SOURCE_PATH SOURCE_PATH
#   URL          git@gitlab.addverb.com:at-robotics/development-core/fleet_and_task_scheduling/license_manager.git
#   REF          3cfa5aec94f89f70e63a7d7bcc1bb848091a2c73
# )

# execute_process(
#   COMMAND git submodule update --init --recursive
#   WORKING_DIRECTORY ${SOURCE_PATH}
# )

if(NOT EXISTS "${_bt_dir}/.git")
    message(STATUS "Cloning license-manager into ${_bt_dir} …")
    execute_process(
      COMMAND git clone
              --branch licenseManager
              --recursive
              "git@gitlab.addverb.com:at-robotics/development-core/fleet_and_task_scheduling/license_manager.git"
              "${_bt_dir}"
      RESULT_VARIABLE _git_clone_result
    )
    if(NOT _git_clone_result EQUAL 0)
      message(FATAL_ERROR "git clone failed with ${_git_clone_result}")
    endif()
endif()

set(SOURCE_PATH "${_bt_dir}")

vcpkg_configure_cmake(
  SOURCE_PATH ${SOURCE_PATH}
  PREFER_NINJA
  OPTIONS
    -DVCPKG_LIBRARY_LINKAGE=dynamic
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(INSTALL
  DIRECTORY   ${CURRENT_PACKAGES_DIR}/share/license-manager
  DESTINATION ${CURRENT_PACKAGES_DIR}/debug/share/license-manager
)

vcpkg_fixup_cmake_targets(CONFIG_PATH share/license-manager)