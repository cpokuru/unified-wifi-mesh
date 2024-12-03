SUBDIRS = utils db dm em

SUBDIRS += agent cli cmd ctrl orch util_crypto

if WITH_GTEST_SUPPORT
noinst_PROGRAMS = validation_test

validation_test_SOURCES = validation_test.cpp

validation_test_CPPFLAGS = \
    -I$(top_srcdir)/inc \
    $(GTEST_ENABLE_FLAG)

validation_test_LDADD = \
    -lgtest \
    -lgtest_main \
    -lpthread
endif

# Make sure all the directories are included in distribution
EXTRA_DIST = \
    agent \
    cli \
    cmd \
    ctrl \
    db \
    dm \
    em \
    orch \
    util_crypto \
    utils \
    validation_test.cpp
