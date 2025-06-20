TF2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Team Fortress 2
CFG = $(TF2_ROOT_DIR)/tf/cfg
CUSTOM = $(TF2_ROOT_DIR)/tf/custom
TOONHUD = $(CUSTOM)/toonhud

install:
	cp -ru ./cfg/* "$(CFG)"

install_extra:
	unzip -o ./mastercomfig.zip -d "$(TF2_ROOT_DIR)"
	unzip -o ./toonhud.zip -d "$(CUSTOM)"

	# TODO: script patching some vars in this Makefile?
	# DefaultVerySmall, DefaultSmall, Default
	# bash ./scripts/change_toonhud.sh "$(TOONHUD)/resource/ui/targetid.res" "TargetDataLabel" "font" "G_FontSmall"
	# bash ./scripts/change_toonhud.sh "$(TOONHUD)/resource/ui/targetid.res" "TargetDataLabel" "tall" "50"

# TODO: pak01_dir.vpk should not be phony
.PHONY: install install_extra extract pak01_dir.vpk
