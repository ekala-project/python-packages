{
  lib,
  buildPythonPackage,
  fetchPypi,
  fetchpatch,
  click,
  joblib,
  regex,
  tqdm,
}:

buildPythonPackage rec {
  pname = "nltk";
  version = "3.9.2";
  format = "setuptools";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-D0CemwacpBd8GQPD6EPu+Qx+kpkvpJMa5gfabeSeFBk=";
  };

  patches = [
    # https://github.com/nltk/nltk/security/advisories/GHSA-jm6w-m3j8-898g
    (fetchpatch {
      name = "fix-unauthed-shutdown";
      url = "https://github.com/nltk/nltk/commit/bbaae83db86a0f49e00f5b0db44a7254c268de9b.patch";
      hash = "sha256-1ZzOQXiNxZ6o7JQs0b9FpsUjZtuUAjXEmDkc9mV3dYU=";
    })

    # https://github.com/nltk/nltk/security/advisories/GHSA-469j-vmhf-r6v7
    (fetchpatch {
      name = "fix-downloader-path-traversal";
      url = "https://github.com/nltk/nltk/commit/89fe2ec2c6bae6e2e7a46dad65cc34231976ed8a.patch";
      hash = "sha256-hQJmVEDDcio4Ew+Y10WzMV53mpYZuuDsFcEZKEzl7nk=";
    })
  ];

  dependencies = [
    click
    joblib
    regex
    tqdm
  ];

  pythonImportsCheck = [ "nltk" ];

  meta = {
    description = "Natural Language Processing ToolKit";
    mainProgram = "nltk";
    homepage = "http://nltk.org/";
    license = lib.licenses.asl20;
  };
}
