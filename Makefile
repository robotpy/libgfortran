
BINRELEASE = https://github.com/wpilibsuite/opensdk/releases/download/v2023-5/cortexa9_vfpv3-roborio-academic-2023-x86_64-linux-gnu-Toolchain-12.1.0.tgz
LIBGZIP = $(abspath $(notdir ${BINRELEASE}))

all: package

${LIBGZIP}:
	wget ${BINRELEASE}

.PHONY: package
package: ${LIBGZIP}
	rm -rf data
	mkdir -p data/usr/local/lib
	tar -xf ${LIBGZIP} -C data/usr/local/lib --strip 4 \
		'roborio-academic/arm-nilrt-linux-gnueabi/sysroot/usr/lib/libgfortran.so.5'

	roborio-gen-whl data.py data -o dist