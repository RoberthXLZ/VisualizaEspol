# This file is generated by gyp; do not edit.

TOOLSET := target
TARGET := v8
### Rules for action "v8_dump_build_config":
quiet_cmd__home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config = ACTION _home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config $@
cmd__home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config = LD_LIBRARY_PATH=$(builddir)/lib.host:$(builddir)/lib.target:$$LD_LIBRARY_PATH; export LD_LIBRARY_PATH; cd $(srcdir)/deps/v8/gypfiles; mkdir -p $(builddir); python ../tools/testrunner/utils/dump_build_config_gyp.py "$(builddir)/v8_build_config.json" "dcheck_always_on=0" "is_asan=0" "is_cfi=0" "is_component_build=static_library" "is_debug=$(BUILDTYPE)" "is_gcov_coverage=0" "is_msan=0" "is_tsan=0" "is_ubsan_vptr=0" "target_cpu=x64" "v8_enable_i18n_support=1" "v8_enable_verify_predictable=0" "v8_target_cpu=x64" "v8_use_snapshot=true"

$(builddir)/v8_build_config.json: obj := $(abs_obj)
$(builddir)/v8_build_config.json: builddir := $(abs_builddir)
$(builddir)/v8_build_config.json: TOOLSET := $(TOOLSET)
$(builddir)/v8_build_config.json: $(srcdir)/deps/v8/tools/testrunner/utils/dump_build_config_gyp.py FORCE_DO_CMD
	$(call do_cmd,_home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config)

all_deps += $(builddir)/v8_build_config.json
action__home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config_outputs := $(builddir)/v8_build_config.json


### Rules for final target.
# Build our special outputs first.
$(obj).target/deps/v8/gypfiles/v8.stamp: | $(action__home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config_outputs)

# Preserve order dependency of special output on deps.
$(action__home_rjloor_pasantiasPreprofesionales_VisualizaEspol_geopol_node_v11_10_1_deps_v8_gypfiles_v8_gyp_v8_target_v8_dump_build_config_outputs): | $(obj).target/deps/v8/gypfiles/v8_maybe_snapshot.stamp

$(obj).target/deps/v8/gypfiles/v8.stamp: TOOLSET := $(TOOLSET)
$(obj).target/deps/v8/gypfiles/v8.stamp: $(obj).target/deps/v8/gypfiles/v8_maybe_snapshot.stamp FORCE_DO_CMD
	$(call do_cmd,touch)

all_deps += $(obj).target/deps/v8/gypfiles/v8.stamp
# Add target alias
.PHONY: v8
v8: $(obj).target/deps/v8/gypfiles/v8.stamp

# Add target alias to "all" target.
.PHONY: all
all: v8

