testthat::context("Does data install")

testthat::test_that("Checking all versions work for fname", {

  testthat::expect_silent(penn60_fname("image"))
  testthat::expect_silent(penn60_fname("brain"))
  testthat::expect_silent(penn60_fname("brain_mask"))
  testthat::expect_silent(penn60_fname("brain_mask_probability"))
  testthat::expect_silent(penn60_fname("registration_mask"))

  testthat::expect_silent({
    img = penn60_image()
    })
  testthat::expect_is(img, "nifti")


})

