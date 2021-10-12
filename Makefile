ifndef ORBISDEV
$(error ORBISDEV, is not set)
endif

target := ps4_lib
OutPath := lib
TargetFile := libuser_mem_sys
AllTarget = $(OutPath)/$(TargetFile).a 

include $(ORBISDEV)/make/ps4sdklib.mk
CompilerFlags += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__
CompilerFlagsCpp += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D__PS4__ -D_BSD_SOURCE -D__ORBIS__ -fexceptions
IncludePath += -I$(ORBISDEV)/usr/include -I$(ORBISDEV)/usr/include/c++/v1 -I$(ORBISDEV)/usr/include/orbis


$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(ORBISDEV)/usr/lib
	@echo "$(TargetFile) Installed!"

