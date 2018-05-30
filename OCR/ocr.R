


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

## -----------------------------------------------------------------------------
## pdftools

library(pdftools)
pngfile <- pdftools::pdf_convert("~/Dropbox/prog-notes/OCR/G-00002.pdf")

bitmap_p1 <- pdftools::pdf_render_page("~/Dropbox/prog-notes/OCR/G-00002.pdf",
                                       page = 1, dpi = 300)
bitmap_p2 <- pdftools::pdf_render_page("~/Dropbox/prog-notes/OCR/G-00002.pdf",
                                       page = 2, dpi = 300)
png::writePNG(bitmap_p1, "~/Dropbox/prog-notes/OCR/bitmap_p1.png")
png::writePNG(bitmap_p2, "~/Dropbox/prog-notes/OCR/bitmap_p2.png")


## -----------------------------------------------------------------------------
## test Vietnamese

vie <- tesseract::tesseract("vie")
page1 <- tesseract::ocr("~/Dropbox/prog-notes/OCR/bitmap_p1.png", engine = vie)
page2 <- tesseract::ocr("~/Dropbox/prog-notes/OCR/bitmap_p2.png", engine = vie)
