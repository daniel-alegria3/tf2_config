TF2_ROOT_DIR = $(HOME)/.local/share/Steam/steamapps/common/Team Fortress 2
CFG = $(TF2_ROOT_DIR)/tf/cfg/
OVERRIDES = $(CFG)/overrides/
# GAMEINFO = $(TF2_ROOT_DIR)/left4dead2/gameinfo.txt
# VIDEOEXEC = $(TF2_ROOT_DIR)/left4dead2/cfg/video.txt
# SPRAY_DIR = $(TF2_ROOT_DIR)/left4dead2/materials/vgui/logos/custom

# MODS_FOLDER=mods

install: autoexec.cfg vacc.cfg
	cp -f ./autoexec.cfg "$(OVERRIDES)"
	cp -f ./medic.cfg "$(OVERRIDES)"
	cp -f ./vacc.cfg "$(CFG)"
	cp -f ./practice.cfg "$(CFG)"

install_extra:
	unzip -o ./mastercomfig.zip -d "$(TF2_ROOT_DIR)"
	unzip -o ./toonhud.zip -d "$(TF2_ROOT_DIR)/tf/custom"

extract:
	vpk pak01_dir.vpk -x mods

# TODO: pak01_dir.vpk should not be phony
.PHONY: install install_extra extract pak01_dir.vpk
