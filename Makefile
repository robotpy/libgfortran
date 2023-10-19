
BINRELEASE = https://github.com/wpilibsuite/opensdk/releases/download/v2024-1/cortexa9_vfpv3-roborio-academic-2024-x86_64-linux-gnu-Toolchain-12.1.0.tgz
LIBGZIP = $(abspath $(notdir ${BINRELEASE}))

all: package

${LIBGZIP}:
	wget ${BINRELEASE}

.PHONY: package
package: ${LIBGZIP}
	rm -rf data
	mkdir -p data/usr/local/lib
	tar -xf ${LIBGZIP} -C data/usr/local/lib --strip 6 \
		'./roborio-academic/arm-nilrt-linux-gnueabi/sysroot/usr/lib/libgfortran.so.5'

	roborio-gen-whl data.py data -o dist
