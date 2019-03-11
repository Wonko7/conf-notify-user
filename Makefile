############################################################
# Project:
############################################################

PROJECT	= notify-user
TARGET	= notify-user


############################################################
# Compilation flags:
############################################################

INCDIR		=
LIBDIR		=
LIBRAIRIES	= $(LIBDIR)
INCLUDE		= $(INCDIR)
CFLAGS 		=	-W			\
			-Wall			\
			-Wextra			\
			-Wundef			\
			-Wno-multichar		\
			-Wtrigraphs		\
			-Wswitch		\
			-Wunused		\
			-Wimplicit		\
			-Wcast-qual		\
			-Wcast-align		\
			-Wwrite-strings		\
			-Wuninitialized		\
			-Winit-self		\
			-Wmissing-prototypes	\
			-Wpacked		\
			-Wnested-externs	\
			-Waggregate-return	\
			-Wshadow		\
			-pedantic		\
			-fno-common		\
			-DLINUX			\
			-D_XOPEN_SOURCE=600	\
			-O2			\
			-march=native		\
			-mtune=native		\
			-std=gnu99

# For debug and valgrind
ifdef DEBUG
	CFLAGS += -g -ggdb3
endif
ifdef VALGRIND
	CFLAGS += -g -DGLIBC_FORCE_NEW -ggdb3
endif
CFLAGS+= $(INCLUDE)


############################################################
# Files and directories
############################################################

SRC = src
BIN = bin
OBJ = obj
OBJ_DIR = $(OBJ)
BIN_DIR = $(BIN)
SRC_FILES = $(wildcard $(SRC)/*.c)
HDR_FILES = $(wildcard $(SRC)/*.h)
OBJ_FILES = $(subst $(SRC),$(OBJ_DIR),$(SRC_FILES:.c=.o))


############################################################
# Build:
############################################################


all: $(OBJ_DIR) $(BIN_DIR) $(BIN_DIR)/$(TARGET)

$(OBJ_DIR)/%.o: $(SRC)/%.c $(HDR_FILES)
	$(CC) $(CFLAGS) -o $@ -c $<

$(BIN_DIR)/$(TARGET): $(OBJ_FILES) 
	$(CC) $(CFLAGS) -o "$(BIN_DIR)/$(TARGET)" $(OBJ_FILES) $(LIBRAIRIES)

$(OBJ_DIR) $(BIN_DIR):
	mkdir $@

############################################################
# Maintenance:
############################################################

# clean
clean:
	rm -f $(OBJ_FILES)

distclean: clean
	rm -f $(BIN_DIR)/$(TARGET)

dist: distclean
	echo FIXME

check:
	@cd test-suite && make check
