# SlickEdit generated file.  Do not edit this file except in designated areas.

# Make command to use for dependencies
MAKE=make
RM=rm
MKDIR=mkdir
CP=cp

# -----Begin user-editable area-----

# -----End user-editable area-----

# If no configuration is specified, "Debug" will be used
ifndef CFG
CFG=Debug
endif

#
# Configuration: Debug
#
ifeq "$(CFG)" "Debug"
OUTDIR=Debug
OUTFILE=$(OUTDIR)/libLEPTON_SDK.a
CFG_INC=-I/cygdrive/c/WinAVR-20090313/avr/include 
CFG_LIB=
CFG_OBJ=
COMMON_OBJ=$(OUTDIR)/raspi_I2C.o $(OUTDIR)/crc16fast.o \
	$(OUTDIR)/LEPTON_AGC.o $(OUTDIR)/LEPTON_VID.o \
	$(OUTDIR)/LEPTON_I2C_Protocol.o $(OUTDIR)/LEPTON_I2C_Service.o \
	$(OUTDIR)/LEPTON_SDK.o $(OUTDIR)/LEPTON_SYS.o \
	$(OUTDIR)/LEPTON_OEM.o
OBJ=$(COMMON_OBJ) $(CFG_OBJ)
ALL_OBJ=$(OUTDIR)/raspi_I2C.o $(OUTDIR)/crc16fast.o \
	$(OUTDIR)/LEPTON_AGC.o $(OUTDIR)/LEPTON_VID.o \
	$(OUTDIR)/LEPTON_I2C_Protocol.o $(OUTDIR)/LEPTON_I2C_Service.o \
	$(OUTDIR)/LEPTON_SDK.o $(OUTDIR)/LEPTON_SYS.o \
	$(OUTDIR)/LEPTON_OEM.o

COMPILE=gcc -fpermissive -Dlinux=1 -c  -v  -g -o "$(OUTDIR)/$(*F).o" $(CFG_INC) "$<"
LINK=ar -rs  "$(OUTFILE)" $(OBJ)

# Pattern rules
$(OUTDIR)/%.o : %.c
	$(COMPILE)

# Build rules
all: $(OUTFILE)

$(OUTFILE): $(OUTDIR)  $(OBJ)
	$(LINK)

$(OUTDIR):
	$(MKDIR) -p "$(OUTDIR)"

# Rebuild this project
rebuild: cleanall all

# Clean this project
clean:
	$(RM) -f $(OUTFILE)
	$(RM) -f $(OBJ)

# Clean this project and all dependencies
cleanall: clean
endif

#
# Configuration: Release
#
ifeq "$(CFG)" "Release"
OUTDIR=Release
OUTFILE=$(OUTDIR)/libLEPTON_SDK.a
CFG_INC=-I/cygdrive/c/WinAVR-20090313/avr/include 
CFG_LIB=
CFG_OBJ=
COMMON_OBJ=$(OUTDIR)/raspi_I2C.o $(OUTDIR)/crc16fast.o \
	$(OUTDIR)/LEPTON_AGC.o $(OUTDIR)/LEPTON_VID.o \
	$(OUTDIR)/LEPTON_I2C_Protocol.o $(OUTDIR)/LEPTON_I2C_Service.o \
	$(OUTDIR)/LEPTON_SDK.o $(OUTDIR)/LEPTON_SYS.o \
	$(OUTDIR)/LEPTON_OEM.o
OBJ=$(COMMON_OBJ) $(CFG_OBJ)
ALL_OBJ=$(OUTDIR)/raspi_I2C.o $(OUTDIR)/crc16fast.o \
	$(OUTDIR)/LEPTON_AGC.o $(OUTDIR)/LEPTON_VID.o \
	$(OUTDIR)/LEPTON_I2C_Protocol.o $(OUTDIR)/LEPTON_I2C_Service.o \
	$(OUTDIR)/LEPTON_SDK.o $(OUTDIR)/LEPTON_SYS.o \
	$(OUTDIR)/LEPTON_OEM.o

COMPILE=g++ -fpermissive -mno-cygwin -c  -v  -o "$(OUTDIR)/$(*F).o" $(CFG_INC) "$<"
LINK=ar -rs  "$(OUTFILE)" $(OBJ)

# Pattern rules
$(OUTDIR)/%.o : %.c
	$(COMPILE)

# Build rules
all: $(OUTFILE)

$(OUTFILE): $(OUTDIR)  $(OBJ)
	$(LINK)

$(OUTDIR):
	$(MKDIR) -p "$(OUTDIR)"


# Rebuild this project
rebuild: cleanall all

# Clean this project
clean:
	$(RM) -f $(OUTFILE)
	$(RM) -f $(OBJ)

# Clean this project and all dependencies
cleanall: clean
endif
