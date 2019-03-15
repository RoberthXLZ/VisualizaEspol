# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := icustubdata
DEFS_Debug := \
	'-DU_ATTRIBUTE_DEPRECATED=' \
	'-D_CRT_SECURE_NO_DEPRECATE=' \
	'-DU_STATIC_IMPLEMENTATION=1' \
	'-DDEBUG' \
	'-D_DEBUG' \
	'-DV8_ENABLE_CHECKS'

# Flags passed to all source files.
CFLAGS_Debug := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-Wno-deprecated-declarations \
	-Wno-strict-aliasing \
	-g \
	-O0

# Flags passed to only C files.
CFLAGS_C_Debug :=

# Flags passed to only C++ files.
CFLAGS_CC_Debug := \
	-fno-exceptions \
	-std=gnu++1y \
	-frtti

INCS_Debug := \
	-I$(srcdir)/deps/icu-small/source/common

DEFS_Release := \
	'-DU_ATTRIBUTE_DEPRECATED=' \
	'-D_CRT_SECURE_NO_DEPRECATE=' \
	'-DU_STATIC_IMPLEMENTATION=1'

# Flags passed to all source files.
CFLAGS_Release := \
	-pthread \
	-Wall \
	-Wextra \
	-Wno-unused-parameter \
	-m64 \
	-Wno-deprecated-declarations \
	-Wno-strict-aliasing \
	-O3 \
	-fno-omit-frame-pointer

# Flags passed to only C files.
CFLAGS_C_Release :=

# Flags passed to only C++ files.
CFLAGS_CC_Release := \
	-fno-exceptions \
	-std=gnu++1y \
	-frtti

INCS_Release := \
	-I$(srcdir)/deps/icu-small/source/common

OBJS := \
	$(obj).target/$(TARGET)/deps/icu-small/source/stubdata/stubdata.o

# Add to the list of files we specially track dependencies for.
all_deps += $(OBJS)

# Make sure our dependencies are built before any of us.
$(OBJS): | $(obj).target/tools/icu/icu_implementation.stamp

# CFLAGS et al overrides must be target-local.
# See "Target-specific Variable Values" in the GNU Make manual.
$(OBJS): TOOLSET := $(TOOLSET)
$(OBJS): GYP_CFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_C_$(BUILDTYPE))
$(OBJS): GYP_CXXFLAGS := $(DEFS_$(BUILDTYPE)) $(INCS_$(BUILDTYPE))  $(CFLAGS_$(BUILDTYPE)) $(CFLAGS_CC_$(BUILDTYPE))

# Suffix rules, putting all outputs into $(obj).

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(srcdir)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# Try building from generated source, too.

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj).$(TOOLSET)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

$(obj).$(TOOLSET)/$(TARGET)/%.o: $(obj)/%.cpp FORCE_DO_CMD
	@$(call do_cmd,cxx,1)

# End of this set of suffix rules
### Rules for final target.
LDFLAGS_Debug := \
	-pthread \
	-rdynamic \
	-m64

LDFLAGS_Release := \
	-pthread \
	-rdynamic \
	-m64

LIBS :=

$(obj).target/tools/icu/libicustubdata.a: GYP_LDFLAGS := $(LDFLAGS_$(BUILDTYPE))
$(obj).target/tools/icu/libicustubdata.a: LIBS := $(LIBS)
$(obj).target/tools/icu/libicustubdata.a: TOOLSET := $(TOOLSET)
$(obj).target/tools/icu/libicustubdata.a: $(OBJS) FORCE_DO_CMD
	$(call do_cmd,alink_thin)

all_deps += $(obj).target/tools/icu/libicustubdata.a
# Add target alias
.PHONY: icustubdata
icustubdata: $(obj).target/tools/icu/libicustubdata.a

# Add target alias to "all" target.
.PHONY: all
all: icustubdata

