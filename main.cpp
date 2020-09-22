
#include <algorithm>
#include <vector>
#include <fstream>
#include "audio_processor.h"
#include "audio_processor.h"
#include "chroma.h"
#include "chroma_normalizer.h"
#include "chroma_resampler.h"
#include "fft.h"
#include "audio_processor.h"
#include "image.h"
#include "image_builder.h"
#include "utils.h"

using namespace chromaprint;

static const int SAMPLE_RATE = 11025;
static const int FRAME_SIZE = 4096;
static const int OVERLAP = FRAME_SIZE - FRAME_SIZE / 3;// 2720;
static const int MIN_FREQ = 28;
static const int MAX_FREQ = 3520;
static const int MAX_FILTER_WIDTH = 20;

int main(int argc, char *argv[])
{
    std::vector<short> data = {1,123,221,321,321,23,45,4,66,7,4,7,99,1,231,123,2,21,1,123,221,321,321,23,45,4,66,7,4,7,99,231,123,2,21,1,123,221,321,321,23,45,4,66,7,4,7,99,231,123,2,21};

    chromaprint::Image image(12);
    chromaprint::ImageBuilder image_builder(&image);
    chromaprint::ChromaNormalizer chroma_normalizer(&image_builder);
    chromaprint::Chroma chroma(MIN_FREQ, MAX_FREQ, FRAME_SIZE, SAMPLE_RATE, &chroma_normalizer);
    chromaprint::FFT fft(FRAME_SIZE, OVERLAP, &chroma);
    chromaprint::AudioProcessor processor(SAMPLE_RATE, &fft);

    processor.Reset(44100, 2);
    processor.Consume(&data[0], data.size());
    processor.Flush();

    return 0;
}
