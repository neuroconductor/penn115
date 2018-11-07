#' Filename of penn115 image
#'
#' @param type type of image to return
#'
#' @return A character vector
#' @export
#'
#' @examples
#' penn115_fname(type = "image")
#' penn115_fname(type = "brain")
#' penn115_fname(type = "brain_mask")
#' penn115_fname(type = "brain_mask_probability")
#' penn115_fname(type = "registration_mask")
#'
#' img = penn115_image()
#'
penn115_fname = function(
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
  fname = system.file("extdata", fname, package = "penn115")
  stopifnot(file.exists(fname))
  fname
}

#' @export
#' @rdname penn115_fname
penn115_image_fname = function() penn115_fname(type = "image")

#' @export
#' @rdname penn115_fname
penn115_brain_fname = function() penn115_fname(type = "brain")

#' @export
#' @rdname penn115_fname
penn115_brain_mask_fname = function() penn115_fname(type = "brain_mask")


#' @export
#' @rdname penn115_fname
penn115_brain_mask_probability_fname = function() penn115_fname(type = "brain_mask_probability")

#' @export
#' @rdname penn115_fname
penn115_registration_mask_fname = function() penn115_fname(type = "brain_mask_probability")


#' @export
#' @rdname penn115_fname
#' @importFrom neurobase readnii
#' @param ... arguments to pass to \code{\link{penn115_fname}}
penn115_nifti = function(...) {
  fname = penn115_fname(...)
  stopifnot(file.exists(fname))
  img = neurobase::readnii(fname)
  img
}


#' @export
#' @rdname penn115_fname
penn115_image = function() penn115_nifti(type = "image")

#' @export
#' @rdname penn115_fname
penn115_brain = function() penn115_nifti(type = "brain")

#' @export
#' @rdname penn115_fname
penn115_brain_mask = function() penn115_nifti(type = "brain_mask")


#' @export
#' @rdname penn115_fname
penn115_brain_mask_probability = function() penn115_nifti(type = "brain_mask_probability")

#' @export
#' @rdname penn115_fname
penn115_registration_mask = function() penn115_nifti(type = "brain_mask_probability")


