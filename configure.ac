AC_PREREQ([2.65])
AC_INIT([unified-wifi-mesh], [1.0], [BUG-REPORT-ADDRESS])
AM_INIT_AUTOMAKE([subdir-objects])
LT_INIT
GTEST_ENABLE_FLAG = ""

# Enable gtest support
AC_ARG_ENABLE([gtestapp],
             AS_HELP_STRING([--enable-gtestapp],[enable Gtest support (default is no)]),
             [
              case "${enableval}" in
               yes) GTEST_SUPPORT_ENABLED=true
                    GTEST_ENABLE_FLAG="-DGTEST_ENABLE"
                    m4_if(m4_sysval,[0],[AC_CONFIG_FILES([src/test/Makefile])]);;
               no) GTEST_SUPPORT_ENABLED=false AC_MSG_ERROR([Gtest support is disabled]);;
               *) AC_MSG_ERROR([bad value ${enableval} for --enable-gtestapp ]);;
              esac
             ],
             [echo "Gtestapp is disabled"])
AM_CONDITIONAL([WITH_GTEST_SUPPORT], [test x$GTEST_SUPPORT_ENABLED = xtrue])

# Installation prefix
AC_PREFIX_DEFAULT(`pwd`)
AC_ENABLE_SHARED
AC_DISABLE_STATIC

# Enable journalctl support
JOURNALCTL_ENABLE_FLAG = " "
AC_ARG_ENABLE([journalctl],
             AS_HELP_STRING([--enable-journalctl],[enable journalctl logging support (default is no)]),
             [
              case "${enableval}" in
               yes) JOURNALCTL_SUPPORT_ENABLE=true
                    JOURNALCTL_ENABLE_FLAG="-DJOURNALCTL_SUPPORT";;
               no)  JOURNALCTL_SUPPORT_ENABLE=false AC_MSG_ERROR([journalctl logging support is disabled]);;
               *)   AC_MSG_ERROR([bad value ${enableval} for --enable-journalctl ]);;
              esac
             ],
             [echo "journalctl logging is disabled"])
AM_CONDITIONAL([JOURNALCTL_SUPPORT], [test x$JOURNALCTL_SUPPORT_ENABLE = xtrue])
AC_SUBST(JOURNALCTL_ENABLE_FLAG)

# Systemd notification support
SYSTEMD_CFLAGS=" "
SYSTEMD_LDFLAGS=" "
AC_ARG_ENABLE([notify],
        AS_HELP_STRING([--enable-notify],[enable systemd notify]),
        [
          case "${enableval}" in
           yes) SYSTEMD_CFLAGS="-DENABLE_SD_NOTIFY"
                SYSTEMD_LDFLAGS="-lsystemd" ;;
           no) AC_MSG_ERROR([systemd notify is disabled]) ;;
          *) AC_MSG_ERROR([bad value ${enableval} for --enable-notify ]) ;;
           esac
           ],
         [echo "systemd notify is disabled."])

AC_SUBST(SYSTEMD_CFLAGS)
AC_SUBST(SYSTEMD_LDFLAGS)

# Config header and macros
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_MACRO_DIR([m4])

# Checks for programs
AC_PROG_CC
AC_PROG_CXX
AC_PROG_INSTALL
AM_PROG_CC_C_O
AM_PROG_LIBTOOL(libtool)

# Checks for header files
AC_CHECK_HEADERS([stdlib.h string.h unistd.h])

# Checks for typedefs, structures, and compiler characteristics
AC_HEADER_STDBOOL
AC_C_INLINE

# Checks for library functions
AC_FUNC_MALLOC

# Configure output files
AC_CONFIG_FILES([
    Makefile
    src/Makefile
    src/agent/Makefile
    src/cli/Makefile
    src/cmd/Makefile
    src/ctrl/Makefile
    src/db/Makefile
    src/dm/Makefile
    src/em/Makefile
    src/orch/Makefile
    src/util_crypto/Makefile
    src/utils/Makefile
])

AC_SUBST(GTEST_ENABLE_FLAG)
AC_OUTPUT
