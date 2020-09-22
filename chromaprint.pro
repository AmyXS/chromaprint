TEMPLATE = app
CONFIG += console c++11
CONFIG -= app_bundle
CONFIG -= qt

INCLUDEPATH += $$PWD/src
INCLUDEPATH += vendor/kissfft

macx {
DEFINES += USE_VDSP
LIBS += -framework Accelerate

SOURCES += \
    src/fft_lib_vdsp.cpp \
    src/fft_lib_vdsp.h
}

win32 | win64 {
DEFINES += USE_KISSFFT # todo: test is performance is alright, or use FFMpeg alternatively
SOURCES += \
    src/fft_lib_kissfft.cpp \
    src/fft_lib_kissfft.h
}

SOURCES += \
        main.cpp \
        src/audio_processor.cpp \
        src/avresample/resample2.c \
        src/chroma.cpp \
        src/chroma_filter.cpp \
        src/chroma_resampler.cpp \
        src/chromaprint.cpp \
        src/fft.cpp \
        src/fingerprint_calculator.cpp \
        src/fingerprint_compressor.cpp \
        src/fingerprint_decompressor.cpp \
        src/fingerprint_matcher.cpp \
        src/fingerprinter.cpp \
        src/fingerprinter_configuration.cpp \
        src/image_builder.cpp \
        src/silence_remover.cpp \
        src/simhash.cpp \
        src/spectrum.cpp \
        src/utils/base64.cpp \
        vendor/kissfft/kiss_fft.c \
        vendor/kissfft/tools/kfc.c \
        vendor/kissfft/tools/kiss_fastfir.c \
        vendor/kissfft/tools/kiss_fftnd.c \
        vendor/kissfft/tools/kiss_fftndr.c \
        vendor/kissfft/tools/kiss_fftr.c


HEADERS += \
    src/audio/audio_slicer.h \
    src/audio_consumer.h \
    src/audio_processor.h \
    src/avresample/avcodec.h \
    src/avresample/dsputil.h \
    src/chroma.h \
    src/chroma_filter.h \
    src/chroma_normalizer.h \
    src/chroma_resampler.h \
    src/chromaprint.h \
    src/classifier.h \
    src/debug.h \
    src/feature_vector_consumer.h \
    src/fft.h \
    src/fft_frame.h \
    src/fft_frame_consumer.h \
    src/fft_lib.h \
    src/filter.h \
    src/filter_utils.h \
    src/fingerprint_calculator.h \
    src/fingerprint_compressor.h \
    src/fingerprint_decompressor.h \
    src/fingerprint_matcher.h \
    src/fingerprinter.h \
    src/fingerprinter_configuration.h \
    src/image.h \
    src/image_builder.h \
    src/moving_average.h \
    src/quantizer.h \
    src/silence_remover.h \
    src/simhash.h \
    src/spectrum.h \
    src/utils.h \
    src/utils/base64.h \
    src/utils/gaussian_filter.h \
    src/utils/gradient.h \
    src/utils/pack_int3_array.h \
    src/utils/pack_int5_array.h \
    src/utils/rolling_integral_image.h \
    src/utils/scope_exit.h \
    src/utils/unpack_int3_array.h \
    src/utils/unpack_int5_array.h \
    vendor/kissfft/_kiss_fft_guts.h \
    vendor/kissfft/kiss_fft.h \
    vendor/kissfft/kissfft.h \
    vendor/kissfft/tools/kfc.h \
    vendor/kissfft/tools/kiss_fftnd.h \
    vendor/kissfft/tools/kiss_fftndr.h \
    vendor/kissfft/tools/kiss_fftr.h
