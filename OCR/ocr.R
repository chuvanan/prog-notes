
library(pdftools)
library(tesseract)
library(magick)

## -----------------------------------------------------------------------------
## Helper functions

get_pdfs <- function(path) {
    list.files(path, pattern = "\\.pdf$", full.names = TRUE)
}

pdf2png <- function(pdfs, format = "png", dpi = 400L, pages = 1:2) {
    lapply(pdfs, function(x) {
        pdftools::pdf_convert(pdf = x, dpi = dpi, pages = pages)
    })
}


## -----------------------------------------------------------------------------
## Convert pdf to png


pdf_files <- get_pdfs(path = "~/Dropbox/prog-notes/OCR/")

## Output:
## [1] "/home/anchu/Dropbox/prog-notes/OCR/G-000100.pdf"

pdf2png(pdf_files)
## Output:
## Converting page 1 to G-000100_1.png... done!
## Converting page 2 to G-000100_2.png... done!

## -----------------------------------------------------------------------------
## Image pre-processing

png1 <- image_read("~/Dropbox/prog-notes/OCR/G-000100_1.png")
png2 <- image_read("~/Dropbox/prog-notes/OCR/G-000100_2.png")

png1 <- image_crop(png1, "3000x2500+60+2100")
png2 <- image_crop(png2, "3000x3000+60+70")
png2 <- image_rotate(png2, 1)
image_display(png2, F)


## -----------------------------------------------------------------------------
## Extract text

vie <- tesseract::tesseract("vie")
text1 <- ocr(png1, engine = vie)
text2 <- ocr(png2, engine = vie)
cat(text1)
cat(text2)
