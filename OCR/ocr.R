
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
## [1] "/home/anchu/Dropbox/prog-notes/OCR/G-000157.pdf"
## [1] "/home/anchu/Dropbox/prog-notes/OCR/G-000174.pdf"

pdf2png(pdf_files)
## Output:
## Converting page 1 to G-000100_1.png... done!
## Converting page 2 to G-000100_2.png... done!
## Converting page 1 to G-000157_1.png... done!
## Converting page 2 to G-000157_2.png... done!
## Converting page 1 to G-000174_1.png... done!
## Converting page 2 to G-000174_2.png... done!

## -----------------------------------------------------------------------------
## Image pre-processing

png100_1 <- image_read("~/Dropbox/prog-notes/OCR/G-000100_1.png")
png100_2 <- image_read("~/Dropbox/prog-notes/OCR/G-000100_2.png")
png157_1 <- image_read("~/Dropbox/prog-notes/OCR/G-000157_1.png")
png157_2 <- image_read("~/Dropbox/prog-notes/OCR/G-000157_2.png")
png174_1 <- image_read("~/Dropbox/prog-notes/OCR/G-000174_1.png")
png174_2 <- image_read("~/Dropbox/prog-notes/OCR/G-000174_2.png")


png100_1 <- image_crop(png100_1, "3000x2500+60+2100")
png100_2 <- image_crop(png100_2, "3000x3000+60+70")
png2 <- image_rotate(png2, 1)

png157_1 <- image_crop(png157_1, "3000x2500+60+2100")
png157_2 <- image_crop(png157_2, "3000x3000+60+70")

png174_1 <- image_crop(png174_1, "3000x2500+60+2100")
png174_2 <- image_crop(png174_2, "3000x3000+60+70")

## -----------------------------------------------------------------------------
## Extract text

vie <- tesseract::tesseract("vie")
text100_1 <- ocr(png100_1, engine = vie)
text100_2 <- ocr(png100_2, engine = vie)
cat(text100_1)
cat(text100_2)

text157_1 <- ocr(png157_1, engine = vie)
text157_2 <- ocr(png157_2, engine = vie)
cat(text157_1)
cat(text157_2)

text174_1 <- ocr(png174_1, engine = vie)
text174_2 <- ocr(png174_2, engine = vie)
cat(text174_1)
cat(text174_2)
