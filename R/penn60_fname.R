#' Filename of penn60 image
#'
#' @param type type of image to return
#'
#' @return A character vector
#' @export
#'
#' @examples
#' penn60_fname(type = "image")
#' penn60_fname(type = "brain")
#' penn60_fname(type = "brain_mask")
#' penn60_fname(type = "brain_mask_probability")
#' penn60_fname(type = "registration_mask")
#'
#' img = penn60_image()
#'
penn60_fname = function(
  type = c("brain",
           "image", "brain_mask", "brain_mask_probability",
           "registration_mask")) {
  type = match.arg(type)
  fname = switch(
    type,
    "brain" = "templateBrain.nii.gz",
    "image" = "template.nii.gz",
    "brain_mask" = "templateBrainMask.nii.gz",
    "brain_mask_probability" = "templateBrainMaskProbability.nii.gz",
    "registration_mask" = "templateBrainExtractionRegistrationMask.nii.gz")
  fname = system.file("extdata", fname, package = "penn60")
  stopifnot(file.exists(fname))
  fname
}

#' @export
#' @rdname penn60_fname
penn60_image_fname = function() penn60_fname(type = "image")

#' @export
#' @rdname penn60_fname
penn60_brain_fname = function() penn60_fname(type = "brain")

#' @export
#' @rdname penn60_fname
penn60_brain_mask_fname = function() penn60_fname(type = "brain_mask")


#' @export
#' @rdname penn60_fname
penn60_brain_mask_probability_fname = function() penn60_fname(type = "brain_mask_probability")

#' @export
#' @rdname penn60_fname
penn60_registration_mask_fname = function() penn60_fname(type = "brain_mask_probability")


#' @export
#' @rdname penn60_fname
#' @importFrom neurobase readnii
#' @param ... arguments to pass to \code{\link{penn60_fname}}
penn60_nifti = function(...) {
  fname = penn60_fname(...)
  stopifnot(file.exists(fname))
  img = neurobase::readnii(fname)
  img
}


#' @export
#' @rdname penn60_fname
penn60_image = function() penn60_nifti(type = "image")

#' @export
#' @rdname penn60_fname
penn60_brain = function() penn60_nifti(type = "brain")

#' @export
#' @rdname penn60_fname
penn60_brain_mask = function() penn60_nifti(type = "brain_mask")


#' @export
#' @rdname penn60_fname
penn60_brain_mask_probability = function() penn60_nifti(type = "brain_mask_probability")

#' @export
#' @rdname penn60_fname
penn60_registration_mask = function() penn60_nifti(type = "brain_mask_probability")


