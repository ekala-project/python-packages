{ lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, # build-system
  hatch-vcs
, hatchling
, # dependencies
  numpy
, packaging
, # optional-dependencies
  backports-zstd
, indexed-gzip
, matplotlib
, pydicom
, pillow
, h5py
, scipy
,
}:

buildPythonPackage (finalAttrs: {
  pname = "nibabel";
  version = "5.4.2";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "nipy";
    repo = "nibabel";
    tag = finalAttrs.version;
    hash = "sha256-QzkmSI0JGdIXLc3XSPZrGrBYSq98tLFrozNNopR/ytg=";
  };

  build-system = [
    hatch-vcs
    hatchling
  ];

  dependencies = [
    numpy
    packaging
  ];
  optional-dependencies = lib.fix (self: {
    all = self.dicomfs ++ self.indexed_gzip ++ self.minc2 ++ self.spm ++ self.zstd;
    dicom = [ pydicom ];
    dicomfs = [ pillow ] ++ self.dicom;
    indexed_gzip = [ indexed-gzip ];
    minc2 = [ h5py ];
    spm = [ scipy ];
    viewers = [ matplotlib ];
    zstd = lib.optionals (pythonOlder "3.14") [ backports-zstd ];
  });

  pythonImportsCheck = [ "nibabel" ];

  meta = {
    homepage = "https://nipy.org/nibabel";
    description = "Access a multitude of neuroimaging data formats";
    license = lib.licenses.mit;
    maintainers = [ ];
  };
})
