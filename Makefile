
BINRELEASE = https://github.com/wpilibsuite/roborio-toolchain/releases/download/v2022-1/FRC-2022-Linux-Toolchain-7.3.0.tar.gz
LIBGZIP = $(abspath $(notdir ${BINRELEASE}))

all: package

${LIBGZIP}:
	wget ${BINRELEASE}

.PHONY: package
package: ${LIBGZIP}
	rm -rf data
	mkdir -p data/usr/local/lib
	xtar -xf ${LIBGZIP} -C data/usr/local/lib --strip 4 \
		'frc2022/roborio/arm-frc2022-linux-gnueabi/lib/libgfortran.so.4'

	roborio-gen-whl data.py data -o dist