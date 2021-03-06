include $(PLATFORM_PATH)/sdk.mk
include $(PLATFORM_PATH)/fw.mk
include $(PLATFORM_PATH)/mft.mk
include $(PLATFORM_PATH)/mlnx-sai.mk
include $(PLATFORM_PATH)/hw-management.mk
include $(PLATFORM_PATH)/docker-syncd-mlnx.mk

SONIC_ALL += $(DOCKER_SYNCD_MLNX) \
	     $(DOCKER_ORCHAGENT) \
	     $(DOCKER_FPM) \
	     $(DOCKER_DATABASE) \
	     $(DOCKER_LLDP_SV2) \
	     $(DOCKER_SNMP_SV2) \
	     $(DOCKER_TEAM) \
	     $(DOCKER_PLATFORM_MONITOR)

# Inject mlnx sai into sairedis
$(LIBSAIREDIS)_DEPENDS += $(MLNX_SAI)

# Runtime dependency on mlnx sai is set only for syncd
$(SYNCD)_RDEPENDS += $(MLNX_SAI)
