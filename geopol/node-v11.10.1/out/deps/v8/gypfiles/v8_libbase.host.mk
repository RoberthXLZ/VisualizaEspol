# This file is generated by gyp; do not edit.

TOOLSET := host
TARGET := v8_libbase
DEFS_Debug := \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0' \
	'-DV8_TARGET_ARCH_X64' \
	'-DV8_EMBEDDER_STRING="-node.17"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_CONCURRENT_MARKING' \
	'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS' \
	'-DOBJECT_PRINT' \
	'-DVERIFY_HEAP' \
	'-DV8_TRACE_MAPS' \
	'-DV8_ENABLE_ALLOCATION_TIMEOUT' \
	'-DV8_ENABLE_FORCE_SLOW_PATH' \
	'-DENABLE_HANDLE_ZAPPING'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-fno-strict-aliasing \
	-m64 \
	-g \
	-Woverloaded-virtual \
	 \
	-fdata-sections \
	-ffunction-sections \
	-O3

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Debug := \
	-I$(srcdir)/deps/v8

DEFS_Release := \
	'-DV8_GYP_BUILD' \
	'-DV8_TYPED_ARRAY_MAX_SIZE_IN_HEAP=0' \
	'-DV8_TARGET_ARCH_X64' \
	'-DV8_EMBEDDER_STRING="-node.17"' \
	'-DENABLE_DISASSEMBLER' \
	'-DV8_PROMISE_INTERNAL_FIELD_COUNT=1' \
	'-DV8_INTL_SUPPORT' \
	'-DV8_CONCURRENT_MARKING' \
	'-DDISABLE_UNTRUSTED_CODE_MITIGATIONS'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-fno-strict-aliasing \
	-m64 \
	-O3 \
	-fno-omit-frame-pointer \
	-fdata-sections \
	-ffunction-sections \
	 \
	-O3

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-rtti \
	-fno-exceptions \
	-std=gnu++1y

INCS_Release := \
	-I$(srcdir)/deps/v8

OBJS := \
	$(obj).host/$(TARGET)/deps/v8/src/base/bits.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/cpu.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/debug/stack_trace.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/division-by-constant.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/file-utils.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/functional.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/ieee754.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/logging.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/once.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/page-allocator.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/condition-variable.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/mutex.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/semaphore.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/time.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/sys-info.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/utils/random-number-generator.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/debug/stack_trace_posix.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/platform-linux.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/platform-posix.o \
	$(obj).host/$(TARGET)/deps/v8/src/base/platform/platform-posix-time.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cc FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64 \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64 \
	-m64

LIBS :=

$(obj).host/deps/v8/gypfiles/libv8_libbase.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).host/deps/v8/gypfiles/libv8_libbase.a: LIBS := $(LIBS)
$(obj).host/deps/v8/gypfiles/libv8_libbase.a: TOOLSET := $(TOOLSET)
$(obj).host/deps/v8/gypfiles/libv8_libbase.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).host/deps/v8/gypfiles/libv8_libbase.a
# Add target alias
.PHONY: v8_libbase
v8_libbase: $(obj).host/deps/v8/gypfiles/libv8_libbase.a

# Add target alias to "all" target.
.PHONY: all
all: v8_libbase
