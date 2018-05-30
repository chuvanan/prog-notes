


library(tesseract)
eng <- tesseract("eng")

text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png",
                       engine = eng)
cat(text)                               # noted: line break is preserved

word <- tesseract::ocr_data("http://jeroen.github.io/images/testocr.png",
                            engine = eng)
word                                    # accuracy rate for each word

## install new training data
tesseract_download("vie")
