SET(HEIDISQL_BASE_NAME "HeidiSQL_11.0_32_Portable")
SET(HEIDISQL_ZIP "${HEIDISQL_BASE_NAME}.zip")
SET(HEIDISQL_URL "http://www.heidisql.com/downloads/releases/${HEIDISQL_ZIP}")
SET(HEIDISQL_DOWNLOAD_DIR ${THIRD_PARTY_DOWNLOAD_LOCATION}/${HEIDISQL_BASE_NAME})

IF(NOT EXISTS ${HEIDISQL_DOWNLOAD_DIR}/${HEIDISQL_ZIP})
  MAKE_DIRECTORY(${HEIDISQL_DOWNLOAD_DIR})
  MESSAGE(STATUS "Downloading ${HEIDISQL_URL} to ${HEIDISQL_DOWNLOAD_DIR}/${HEIDISQL_ZIP}")
  FILE(DOWNLOAD ${HEIDISQL_URL} ${HEIDISQL_DOWNLOAD_DIR}/${HEIDISQL_ZIP} TIMEOUT 60)
  EXECUTE_PROCESS(COMMAND ${CMAKE_COMMAND} -E chdir ${HEIDISQL_DOWNLOAD_DIR}
    ${CMAKE_COMMAND} -E tar xfz ${HEIDISQL_DOWNLOAD_DIR}/${HEIDISQL_ZIP}
  )
ENDIF()

CONFIGURE_FILE(${SRCDIR}/heidisql.wxi.in ${CMAKE_CURRENT_BINARY_DIR}/heidisql.wxi)
CONFIGURE_FILE(${SRCDIR}/heidisql_feature.wxi.in ${CMAKE_CURRENT_BINARY_DIR}/heidisql_feature.wxi)
