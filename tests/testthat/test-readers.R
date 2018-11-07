testthat::context("Does data install")

testthat::test_that("Checking all versions work for fname", {

  testthat::expect_silent(penn115_fname("image"))
  testthat::expect_silent(penn115_fname("brain"))
  testthat::expect_silent(penn115_fname("brain_mask"))
  testthat::expect_silent(penn115_fname("brain_mask_probability"))
  testthat::expect_silent(penn115_fname("registration_mask"))

  testthat::expect_silent({
    img = penn115_image()
    })
  testthat::expect_is(img, "nifti")


})

