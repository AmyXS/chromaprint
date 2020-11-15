INCLUDEPATH += $$PWD/src
INCLUDEPATH += $$PWD/vendor/kissfft

macx {
DEFINES += USE_VDSP
LIBS += -framework Accelerate

SOURCES += \
    $$PWD/src/fft_lib_vdsp.cpp \
    $$PWD/src/fft_lib_vdsp.h
}

win32 | win64 {
DEFINES += USE_KISSFFT # todo: test is performance is alright, or use FFMpeg alternatively
SOURCES += \
    $$PWD/src/fft_lib_kissfft.cpp \
    $$PWD/src/fft_lib_kissfft.h
}

SOURCES += \
        $$PWD/src/audio_processor.cpp \
        $$PWD/src/avresample/resample2.c \
        $$PWD/src/chroma.cpp \
        $$PWD/src/chroma_filter.cpp \
        $$PWD/src/chroma_resampler.cpp \
        $$PWD/src/chromaprint.cpp \
        $$PWD/src/fft.cpp \
        $$PWD/src/fingerprint_calculator.cpp \
        $$PWD/src/fingerprint_compressor.cpp \
        $$PWD/src/fingerprint_decompressor.cpp \
        $$PWD/src/fingerprint_matcher.cpp \
        $$PWD/src/fingerprinter.cpp \
        $$PWD/src/fingerprinter_configuration.cpp \
        $$PWD/src/image_builder.cpp \
        $$PWD/src/silence_remover.cpp \
        $$PWD/src/simhash.cpp \
        $$PWD/src/spectrum.cpp \
        $$PWD/src/utils/base64.cpp \
        $$PWD/vendor/kissfft/kiss_fft.c \
        $$PWD/vendor/kissfft/tools/kfc.c \
        $$PWD/vendor/kissfft/tools/kiss_fastfir.c \
        $$PWD/vendor/kissfft/tools/kiss_fftnd.c \
        $$PWD/vendor/kissfft/tools/kiss_fftndr.c \
        $$PWD/vendor/kissfft/tools/kiss_fftr.c


HEADERS += \
    $$PWD/src/audio/audio_slicer.h \
    $$PWD/src/audio_consumer.h \
    $$PWD/src/audio_processor.h \
    $$PWD/src/avresample/avcodec.h \
    $$PWD/src/avresample/dsputil.h \
    $$PWD/src/chroma.h \
    $$PWD/src/chroma_filter.h \
    $$PWD/src/chroma_normalizer.h \
    $$PWD/src/chroma_resampler.h \
    $$PWD/src/chromaprint.h \
    $$PWD/src/classifier.h \
    $$PWD/src/debug.h \
    $$PWD/src/feature_vector_consumer.h \
    $$PWD/src/fft.h \
    $$PWD/src/fft_frame.h \
    $$PWD/src/fft_frame_consumer.h \
    $$PWD/src/fft_lib.h \
    $$PWD/src/filter.h \
    $$PWD/src/filter_utils.h \
    $$PWD/src/fingerprint_calculator.h \
    $$PWD/src/fingerprint_compressor.h \
    $$PWD/src/fingerprint_decompressor.h \
    $$PWD/src/fingerprint_matcher.h \
    $$PWD/src/fingerprinter.h \
    $$PWD/src/fingerprinter_configuration.h \
    $$PWD/src/image.h \
    $$PWD/src/image_builder.h \
    $$PWD/src/moving_average.h \
    $$PWD/src/quantizer.h \
    $$PWD/src/silence_remover.h \
    $$PWD/src/simhash.h \
    $$PWD/src/spectrum.h \
    $$PWD/src/utils.h \
    $$PWD/src/utils/base64.h \
    $$PWD/src/utils/gaussian_filter.h \
    $$PWD/src/utils/gradient.h \
    $$PWD/src/utils/pack_int3_array.h \
    $$PWD/src/utils/pack_int5_array.h \
    $$PWD/src/utils/rolling_integral_image.h \
    $$PWD/src/utils/scope_exit.h \
    $$PWD/src/utils/unpack_int3_array.h \
    $$PWD/src/utils/unpack_int5_array.h \
    $$PWD/vendor/kissfft/_kiss_fft_guts.h \
    $$PWD/vendor/kissfft/kiss_fft.h \
    $$PWD/vendor/kissfft/kissfft.h \
    $$PWD/vendor/kissfft/tools/kfc.h \
    $$PWD/vendor/kissfft/tools/kiss_fftnd.h \
    $$PWD/vendor/kissfft/tools/kiss_fftndr.h \
    $$PWD/vendor/kissfft/tools/kiss_fftr.h
