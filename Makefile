TF2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Team Fortress 2
CFG = $(TF2_ROOT_DIR)/tf/cfg
CUSTOM = $(TF2_ROOT_DIR)/tf/custom
TOONHUD = $(CUSTOM)/toonhud

install:
	cp -ru ./cfg/* "$(CFG)"

install_extra:
	unzip -o ./mastercomfig.zip -d "$(TF2_ROOT_DIR)"
	unzip -o ./toonhud.zip -d "$(CUSTOM)"
	# DefaultVerySmall, DefaultSmall, Default
	bash ./scripts/change_toonhud.sh "$(TOONHUD)/resource/ui/targetid.res" "TargetDataLabel" "font" "G_FontSmall"
	# bash ./scripts/change_toonhud.sh "$(TOONHUD)/resource/ui/targetid.res" "TargetDataLabel" "tall" "50"


macro: medic.cfg macro_template.txt
	cp -f macro_template.txt $@
	sed -n 's/^bind *["] *\([^"]*\) *["] * ["]bullet_to_fire["]/\1/p' medic.cfg | xargs -I{} sed -i 's/<BTF_KEY>/{}/g' $@
	sed -n 's/^bind *["] *\([^"]*\) *["] * ["]bullet_to_explosive["]/\1/p' medic.cfg | xargs -I{} sed -i 's/<BTE_KEY>/{}/g' $@
	sed -n 's/^bind *["] *\([^"]*\) *["] * ["]+reload["].*/\1/p' medic.cfg | xargs -I{} sed -i 's/<RELOAD_KEY>/{}/g' $@


extract:
	vpk pak01_dir.vpk -x mods

# TODO: pak01_dir.vpk should not be phony
.PHONY: install install_extra extract pak01_dir.vpk
